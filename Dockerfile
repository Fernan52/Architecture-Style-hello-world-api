# Usamos una imagen base de .NET SDK para construir el proyecto
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src

# Copiar el archivo .csproj y restaurar dependencias
COPY hello-world-api.csproj ./
RUN dotnet restore "hello-world-api.csproj"

# Copiar el resto de los archivos del proyecto
COPY . ./

# Compilar el proyecto
RUN dotnet build "hello-world-api.csproj" -c Release -o /app/build

# Publicar el proyecto
FROM build AS publish
RUN dotnet publish "hello-world-api.csproj" -c Release -o /app/publish

# Usar una imagen base para ejecutar el contenedor
FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 80

# Copiar los archivos publicados al contenedor
COPY --from=publish /app/publish .

# Configurar el punto de entrada para ejecutar la API
ENTRYPOINT ["dotnet", "hello-world-api.dll"]
