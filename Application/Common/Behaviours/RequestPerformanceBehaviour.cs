using MediatR;
using Microsoft.Extensions.Logging;
using Poseidon.Common;
using System.Diagnostics;

namespace Poseidon.Application
{
    public class RequestPerformanceBehaviour<TRequest, TResponse> : IPipelineBehavior<TRequest, TResponse>
         where TRequest : IRequest<TResponse>
    {
        private readonly Stopwatch           _timer;
        private readonly ILogger<TRequest>   _logger;
        private readonly ICurrentUserService _currentUserService;

        public RequestPerformanceBehaviour(
              ILogger<TRequest>   logger
            , ICurrentUserService currentUserService)
        {
            _logger             = logger            ;
            _timer              = new Stopwatch()   ;
            _currentUserService = currentUserService;
        }

        public async Task<TResponse> Handle(
              TRequest                          request
            , RequestHandlerDelegate<TResponse> next
            , CancellationToken cancellationToken
            )
        {
            _timer.Start();

            var response = await next();
            _timer.Stop();
            _logger.Info(string.Format("Total request time in {0} milliseconds", _timer.ElapsedMilliseconds));
            if (_timer.ElapsedMilliseconds > 500)
            {
                var name = typeof(TRequest).Name;

                _logger.Warning(
                    string.Format("Poseidon Long Running Request: {0} ({1} milliseconds) {2} {3}"
                    , name
                    , _timer.ElapsedMilliseconds
                    , _currentUserService.UserId
                    , request));
            }

            return response;
        }
    }
}