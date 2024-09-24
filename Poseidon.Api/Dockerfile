#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:9.0 AS base
WORKDIR /app
EXPOSE 80

FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /src
COPY ["Poseidon.Api/Poseidon.Api.csproj", "Poseidon.Api/"]
COPY ["Persistance/Persistance.csproj", "Persistance/"]
COPY ["Application/Application.csproj", "Application/"]
COPY ["Domain/Domain.csproj", "Domain/"]
COPY ["Common/Common.csproj", "Common/"]
COPY ["Infrastructure/Infrastructure.csproj", "Infrastructure/"]
RUN dotnet restore "Poseidon.Api/Poseidon.Api.csproj"
COPY . .
WORKDIR "/src/Poseidon.Api"
RUN dotnet build "Poseidon.Api.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "Poseidon.Api.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "Poseidon.Api.dll"]