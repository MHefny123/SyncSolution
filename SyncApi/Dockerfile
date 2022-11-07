#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:3.1 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:3.1 AS build
WORKDIR /src
COPY ["SyncAPI.csproj", "./"]
RUN dotnet restore "./SyncAPI.csproj"
COPY . .
WORKDIR "/src/."
RUN dotnet build "SyncAPI.csproj" -c Release -o /app

FROM build AS publish
RUN dotnet publish "SyncAPI.csproj" -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "SyncAPI.dll"]



# $ docker build -t syncapi .

# $ docker run -d -p 5008:80 --name SyncApi syncapi