using Dotmim.Sync;
using Dotmim.Sync.SqlServer;
using Dotmim.Sync.Web.Client;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;

namespace SyncService
{
    public class Worker : BackgroundService
    {
        private readonly ILogger<Worker> _logger;


        private static string clientConnectionString = $"Data Source=(localdb)\\mssqllocaldb; Initial Catalog=Aqua_V808;Integrated Security=true;";


        public Worker(ILogger<Worker> logger)
        {
            _logger = logger;
        }

        protected override async Task ExecuteAsync(CancellationToken stoppingToken)
        {
            Console.WriteLine("Service Started..........");

            while (!stoppingToken.IsCancellationRequested)
            {

                int SyncInterval = 60000;
                string ClientID = "808";

                ///Local 
                var serverOrchestrator = new WebRemoteOrchestrator("https://localhost:44371/api/sync/" + ClientID);

                // Second provider is using plain old Sql Server provider, relying on triggers and tracking tables to create the sync environment
                var clientProvider = new SqlSyncProvider(clientConnectionString);

                // Set the web server Options
                var options = new SyncOptions
                {
                    BatchDirectory = Path.Combine(SyncOptions.GetDefaultUserBatchDirectory(), "client")
                };
                // Creating an agent that will handle all the process
                var agent = new SyncAgent(clientProvider, serverOrchestrator, options);
                var progress = new SynchronousProgress<ProgressArgs>(pa => Console.WriteLine($"{pa.ProgressPercentage:p}\t {pa.Message}"));

                var parameters = new SyncParameters { { "BranchID", 1 } };
                do
                {
                    try
                    {
                        // Launch the sync process
                        var syncResult = await agent.SynchronizeAsync(parameters, progress);

                                              // Write results
                        Console.WriteLine(syncResult);


                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine(ex.Message);
                    }

                    Console.WriteLine("Waiting For New DB Changes!");

                    await Task.Delay(SyncInterval, stoppingToken);
                }

                while (!stoppingToken.IsCancellationRequested);

                Console.WriteLine("End");
            }
        }
    }
}
