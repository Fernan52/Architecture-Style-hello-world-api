using Microsoft.AspNetCore.Mvc;

namespace HelloWorldApi.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class HelloWorldController : ControllerBase
    {
        // Ruta GET para devolver el mensaje "Hola Mundo"
        [HttpGet]
        public ActionResult<string> Get()
        {
            return "Hola Mundo desde la API";
        }
    }
}
