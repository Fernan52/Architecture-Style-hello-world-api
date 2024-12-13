using Microsoft.AspNetCore.Builder;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;

var builder = WebApplication.CreateBuilder(args);

// Agregar servicios necesarios para la API
builder.Services.AddControllers();

var app = builder.Build();

// Configurar el middleware para las API
app.UseRouting();

// Configurar las rutas de los controladores
app.MapControllers();

app.Run();
