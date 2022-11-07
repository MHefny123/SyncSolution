using Dotmim.Sync.Enumerations;
using Dotmim.Sync.Web.Server;
using Dotmim.Sync;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using System.IO;
using System.Threading.Tasks;
using System;

namespace SyncApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SyncController : ControllerBase
    {
        public WebServerOrchestrator Orchestrator { get; }
        public IConfiguration Configuration { get; }


        // Injected thanks to Dependency Injection
        public SyncController(WebServerOrchestrator webServerOrchestrator, IConfiguration configuration)
        {
            Orchestrator = webServerOrchestrator;
            Configuration = configuration;



        }




        /// <summary>
        /// This POST handler is mandatory to handle all the sync process
        /// </summary>
        /// <returns></returns>
        [HttpPost("{id}")]
        public Task Post(int id)
        {
            this.Orchestrator.Setup.Tables.Clear();
            this.Orchestrator.Provider.ConnectionString = this.Configuration.GetSection("ConnectionStrings")["DefaultConnection"].Replace("Aqua_V", "Aqua_V" + id.ToString());

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





            #region UPDownConditions
            #endregion



            this.Orchestrator.Setup = setup;

            return this.Orchestrator.HandleRequestAsync(this.HttpContext);
        }

        /// <summary>
        /// This GET handler is optional. It allows you to see the configuration hosted on the server
        /// </summary>
        [HttpGet("{id}")]
        public Task Get(int id)
        {
            return WebServerOrchestrator.WriteHelloAsync(this.HttpContext, this.Orchestrator);
        }

    }

}
