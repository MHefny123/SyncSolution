using Dotmim.Sync.Enumerations;
using Dotmim.Sync.Web.Server;
using Dotmim.Sync;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using System.IO;
using System.Threading.Tasks;
using System;
using Microsoft.AspNetCore.Hosting;

namespace SyncApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SyncController : ControllerBase
    {
        public WebServerAgent WebServerAgent { get; }
        public IWebHostEnvironment Env { get; }
        public IConfiguration Configuration { get; }


        // Injected thanks to Dependency Injection
        public SyncController(WebServerAgent webServerAgent, IWebHostEnvironment env, IConfiguration configuration)
        {
            WebServerAgent = webServerAgent;
            Env = env;
            Configuration = configuration;
        }

        /// <summary>
        /// This POST handler is mandatory to handle all the sync process
        /// </summary>
        /// <returns></returns>
        [HttpPost("{id}")]
        public async Task Post(int id)
        {
            //this.WebServerAgent.Provider.ConnectionString = this.Configuration.GetSection("ConnectionStrings")["DefaultConnection"].Replace("Aqua_V", "Aqua_V" + id.ToString());
            this.WebServerAgent.Provider.ConnectionString = this.Configuration.GetSection("ConnectionStrings")["DefaultConnection"].Replace("Aqua_V", "Aqua_V" + id.ToString() + "S");
            await this.WebServerAgent.HandleRequestAsync(HttpContext).ConfigureAwait(false);
        }

        /// <summary>
        /// This GET handler is optional. It allows you to see the configuration hosted on the server
        /// </summary>
        [HttpGet]
        public Task Get()
        {
            return this.HttpContext.WriteHelloAsync(this.WebServerAgent);
        }

    }

}
