﻿namespace Poseidon.Application
{
    public interface ICurrentUserService
    {
        string UserId { get; }

        bool IsAuthenticated { get; }
    }
}