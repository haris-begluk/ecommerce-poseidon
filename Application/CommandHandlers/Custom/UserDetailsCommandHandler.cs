using AutoMapper;
using MediatR;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using Poseidon.Application.Commands;
using Poseidon.Application.Dto;
using Poseidon.Common;
using Poseidon.Domain;
using System.Security.Claims;

namespace Poseidon.Application.CommandHandlers;

public partial class UserDetailsCommandHandler : IRequestHandler<UserDetailsCommand, ResponseData<UserDetailsDto>>
{
    private readonly IPoseidonDbContext _context;
    private readonly IHttpContextAccessor _httpContextAccessor;
    private readonly IMapper _mapper;
    private readonly ILogger<UserDetailsCommandHandler> _logger;

    public UserDetailsCommandHandler(IPoseidonDbContext context
        , IHttpContextAccessor httpContextAccessor
        , IMapper mapper
        , ILogger<UserDetailsCommandHandler> logger
                                        )
    {
        _context = context;
        _logger = logger;
        _httpContextAccessor = httpContextAccessor;
        _mapper = mapper;
    }

    public async Task<ResponseData<UserDetailsDto>> Handle(UserDetailsCommand request, CancellationToken cancellationToken)
    {
        var userEmail = _httpContextAccessor
                         .HttpContext
                         ?.User
                         ?.Claims
                         ?.FirstOrDefault(c => c.Type.Equals(ClaimTypes.Email))?.Value;

        if (string.IsNullOrWhiteSpace(userEmail))
        {
            _logger.Error($"Email claim not available for this user");
            return new ResponseData<UserDetailsDto>(Array.Empty<UserDetailsDto>(), 0, 1, 0);
        }

        var user = await _context.User
            .Include(c => c.Address)
            .AsNoTracking()
            .FirstOrDefaultAsync(u => u.Email
                .Equals(userEmail));

        if (user is null)
        {
            _logger.Error($"User not found for email {userEmail}");
            return new ResponseData<UserDetailsDto>(Array.Empty<UserDetailsDto>(), 0, 1, 0);
        }

        UserDetailsDto userDto = _mapper.Map<User, UserDetailsDto>(user);

        if (user.Address is not null)
        {
            userDto.Address = _mapper.Map<Address, AddressDto>(user.Address);
        }

        return new ResponseData<UserDetailsDto>(new UserDetailsDto[] { userDto }, 1, 1, 1);
    }
}