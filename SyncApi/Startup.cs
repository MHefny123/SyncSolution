using Dotmim.Sync;
using Dotmim.Sync.Enumerations;
using Dotmim.Sync.SqlServer;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace SyncApi
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddControllers();

            services.AddDistributedMemoryCache();
            services.AddSession(options => options.IdleTimeout = TimeSpan.FromMinutes(30));


            services.AddMvc();
            services.AddHttpContextAccessor();


            // [Required] Get a connection string for your server data source
            var connectionString = Configuration.GetSection("ConnectionStrings")["DefaultConnection"];

            // [Optional] Set the web server Options
            var options = new SyncOptions
            {
                SnapshotsDirectory = Path.Combine(
                Environment.GetFolderPath(Environment.SpecialFolder.UserProfile),
                "Snapshots"),
                CleanMetadatas = true,
                ConflictResolutionPolicy = ConflictResolutionPolicy.ServerWins

            };


            //string tblsJson =  System.IO.File.ReadAllText("json-schema.json");
            //var tbls = Newtonsoft.Json.JsonConvert.DeserializeObject<List<SyncTable>>(tblsJson);

            /// DownLoad Only Tables
            var tblsDownLoadOnly = new string[] {

            };


            var tblsUploadOnly = new string[] {

            };


            var tblsUpDown = new string[] {



            };

            // [Optional] Defines the schema prefix and suffix for all generated objects
            var setup = new SyncSetup()
            {
                // optional :
                StoredProceduresPrefix = "s",
                StoredProceduresSuffix = "",
                TrackingTablesPrefix = "s",
                TrackingTablesSuffix = ""

            };



            SetupTable table;
            foreach (var obj in tblsDownLoadOnly)
            {
                table = new SetupTable();
                table.TableName = obj;
                table.SyncDirection = SyncDirection.DownloadOnly;
                setup.Tables.Add(table);
            }


            foreach (var obj in tblsUploadOnly)
            {
                table = new SetupTable();
                table.TableName = obj;
                table.SyncDirection = SyncDirection.UploadOnly;
                setup.Tables.Add(table);

            }


            foreach (var obj in tblsUpDown)
            {
                table = new SetupTable();
                table.TableName = obj;
                table.SyncDirection = SyncDirection.Bidirectional;
                setup.Tables.Add(table);
            }

            // [Required] add a SqlSyncProvider acting as the server hub
            services.AddSyncServer<SqlSyncProvider>(connectionString, setup, options);
        }
        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            app.UseSession();

            app.UseHttpsRedirection();
            app.UseCors(x => x
                .AllowAnyOrigin()
                .AllowAnyMethod()
                .AllowAnyHeader());
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            app.UseHttpsRedirection();

            app.UseRouting();

            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });


        }
    }
}
