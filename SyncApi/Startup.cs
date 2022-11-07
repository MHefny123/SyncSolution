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

            var options = new SyncOptions
            {
                SnapshotsDirectory = Path.Combine(
                  Environment.GetFolderPath(Environment.SpecialFolder.UserProfile),
                  "Snapshots"),
                CleanMetadatas = true,
                ConflictResolutionPolicy = ConflictResolutionPolicy.ServerWins
            };

            /// DownLoad Only Tables
            var tblsDownLoadOnly = new string[] {
                 "Branch",
                 "BranchItemPrice",
                 "BranchItemPrinterlog",
                 "BranchPaymentAllowed",
                 "BranchPOSConfig",
                 "BranchZone"
            };


            //Upload Only Tables
            var tblsUploadOnly = new string[] {
               "POS_Sales",
               "POS_SalesDetail",
               "POS_TempSales",
               "POS_TempSalesDetail"
            };


            var tblsUpDown = new string[] {

                "CustomerTitle",
                "Customer",
                "CustomerGroup",
                "Zone",
                "CustomerZoneAddress",
                "Customer_AccountStatement"
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

            foreach (var obj in tblsDownLoadOnly)
                setup.Tables.Add(new SetupTable { TableName = obj, SyncDirection = SyncDirection.DownloadOnly });

            foreach (var obj in tblsUploadOnly)
                setup.Tables.Add(new SetupTable { TableName = obj, SyncDirection = SyncDirection.UploadOnly });

            foreach (var obj in tblsUpDown)
                setup.Tables.Add(new SetupTable { TableName = obj, SyncDirection = SyncDirection.Bidirectional });

            #region DownLoadOnlyConditions


            // Pull Branch Prices By Branch ID
            var BranchItemPrice = new SetupFilter("BranchItemPrice");
            BranchItemPrice.AddParameter("BranchID", "BranchItemPrice", true);
            BranchItemPrice.AddWhere("BranchID", "BranchItemPrice", "BranchID");
            setup.Filters.Add(BranchItemPrice);

            // Pull Branch Zones By Branch
            var BranchZone = new SetupFilter("BranchZone");
            BranchZone.AddParameter("BranchID", "BranchZone", true);
            BranchZone.AddWhere("BranchID", "BranchZone", "BranchID");
            setup.Filters.Add(BranchZone);


            #endregion

            #region UploadOnlyConditions

            // push  Branch POS_TempSales By Branch ID
            var POS_TempSales = new SetupFilter("POS_TempSales");
            POS_TempSales.AddParameter("BranchID", "POS_TempSales", true);
            POS_TempSales.AddWhere("BranchID", "POS_TempSales", "BranchID");
            setup.Filters.Add(POS_TempSales);


            var POS_TempSalesDetail = new SetupFilter("POS_TempSalesDetail");
            POS_TempSalesDetail.AddParameter("BranchID", "POS_TempSalesDetail", true);
            POS_TempSalesDetail.AddWhere("BranchID", "POS_TempSalesDetail", "BranchID");
            setup.Filters.Add(POS_TempSalesDetail);

            var POS_Sales = new SetupFilter("POS_Sales");
            POS_Sales.AddParameter("BranchID", "POS_Sales", true);
            POS_Sales.AddWhere("BranchID", "POS_Sales", "BranchID");
            setup.Filters.Add(POS_Sales);

            var POS_SalesDetail = new SetupFilter("POS_SalesDetail");
            POS_SalesDetail.AddParameter("BranchID", "POS_SalesDetail", true);
            POS_SalesDetail.AddWhere("BranchID", "POS_SalesDetail", "BranchID");
            setup.Filters.Add(POS_SalesDetail);

            #endregion

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
