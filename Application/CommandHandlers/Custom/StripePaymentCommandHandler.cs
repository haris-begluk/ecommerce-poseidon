using MediatR;
using Microsoft.Extensions.Logging;
using Poseidon.Application;
using Poseidon.Application.Commands;
using Poseidon.Common;
using Poseidon.Domain;
using Poseidon.Enums;
using Stripe;

namespace Poseidon.Application.CommandHandlers;

public partial class StripePaymentCommandHandler : IRequestHandler<StripePaymentCommand, (string response, Status status)>
{
    private readonly IPoseidonDbContext _context;
    private readonly ILogger<StripePaymentCommandHandler> _logger;
    public StripePaymentCommandHandler(IPoseidonDbContext context
        , ILogger<StripePaymentCommandHandler> logger
                                        )
    {
        _context = context;
        _logger = logger;
    }

    public async Task<(string response, Status status)> Handle(StripePaymentCommand request, CancellationToken cancellationToken)
    {
        Order? order = null;
        CreditCard? creditCard = null;

        try
        {
            order = _context.Order.FirstOrDefault(o => o.OrderId.Equals(request.OrderId));

            if (order is null)
            {
                _logger.Error($"Order {request.OrderId} not found, exiting payment process");

                return ($"Order {request.OrderId} not found", Status.NotFound);
            }

            if (order.PayedAndClosed)
            {
                _logger.Warning($"Order {request.OrderId} is closed and payment is confirmed, exiting payment process");

                return ($"Order {request.OrderId} is closed and payment is confirmed", Status.BadRequest);
            }

            creditCard = _context.CreditCard.FirstOrDefault(o => o.CreditCardId.Equals(request.CardId));

            if (creditCard is null)
            {
                _logger.Error($"Credit card {request.CardId} not found, exiting payment process");

                return ($"Credit card {request.CardId} not found", Status.NotFound);
            }

            var amount = Convert.ToInt64(Math.Round(order.OrderTotal * 100, 2));

            if (amount <= 100)
            {
                _logger.Error($"Total amount {order.OrderTotal} must be greater than  1, exiting payment process");

                return ($"Total amount {order.OrderTotal} must be greater than  1 ({amount})", Status.BadRequest);
            }

            _logger.Info($"Creating instance of payment method option...");

            var options = new PaymentMethodCreateOptions
            {
                Type = "card",
                Card = new PaymentMethodCardOptions
                {
                    Number = creditCard.CreaditCartNumber,
                    ExpMonth = creditCard.ExpirationDate.Month,
                    ExpYear = creditCard.ExpirationDate.Year,
                    Cvc = creditCard.CVC,
                },
            };

            _logger.Info($"Creating instance of payment method service...");

            var paymentService = new PaymentMethodService();

            _logger.Info($"Creating instance of payment method service...");

            var paymentMethod = paymentService.Create(options);

            _logger.Info($"Creating instance of payment intent service...");

            var paymentIntentService = new PaymentIntentService();


            _logger.Info($"Creating payment intent in KM (BAM) for amount {amount}");

            var paymentIntent = paymentIntentService.Create(
            new PaymentIntentCreateOptions
            {
                Amount = amount,
                Currency = "bam",
                PaymentMethod = paymentMethod.Id,
                AutomaticPaymentMethods =
                new PaymentIntentAutomaticPaymentMethodsOptions
                {
                    Enabled = false,
                },

            });

            _logger.Debug($"Payment intent ID {paymentIntent.Id} and client secret {paymentIntent.ClientSecret}  for amount {amount} in KM (BAM)");


            var result = paymentIntentService.Confirm(paymentIntent.Id);

            SetPamentWithStatus(order!, creditCard!, result.Status);

            order.PayedAndClosed = true;
            order.DeliveryId = request.DeliveryId;

            await _context.SaveChangesAsync(cancellationToken);

            return ($"{result.Status}", Status.Created);

        }
        catch (Exception ex)
        {
            if (order is not null && creditCard is not null)
            {
                _logger.Error($"Critical failure on order {order?.OrderId} payment, setting pament failure status");

                SetPamentWithStatus(order!, creditCard!, ex.Message);
            }

            if (order != null)
            {
                order!.PayedAndClosed = false;
                _logger.Error($"Critical failure on order {order?.OrderId} payment, setting order payed and closed value to false");

            }

            await _context.SaveChangesAsync(cancellationToken);

            _logger.Error($"Critical failure on order {order?.OrderId} payment");

            throw;
        }

    }
    private void SetPamentWithStatus(Order order, CreditCard creditCard, string status)
    {
        var orderPayment = _context.Payment.FirstOrDefault(p => p.OrderId.Equals(order.OrderId));

        if (orderPayment == null)
        {
            orderPayment = new()
            {
                Amount = order.OrderTotal,
                PaymentFee = order.PaymentFeeAmount,
                OrderId = order.OrderId,
                FailureMessage = status,
                PaymentProviderId = creditCard.PaymentProviderId

            };

            this._context.Payment.Add(orderPayment);
        }
        else
        {
            orderPayment.FailureMessage = status;
        }
    }
}