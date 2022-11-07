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


        private static string ClientConnection = @"Data Source=.\ENTERPRISE;Initial Catalog=Aqua_V808;Trusted_Connection=True;User Id=SA;Password=Password;Integrated Security=false;";


        public Worker(ILogger<Worker> logger)
        {
            _logger = logger;
        }

        protected override async Task ExecuteAsync(CancellationToken stoppingToken)
        {
            Console.WriteLine("Service Started..........");

            while (!stoppingToken.IsCancellationRequested)
            {
                try
                {
                    int SyncInterval =  60000;
                    string ClientID = "808";



                    ///Local 
                    var serverOrchestrator = new WebClientOrchestrator("http://80.90.167.136:5088/api/Sync/" + ClientID);

                    // Second provider is using plain old Sql Server provider, relying on triggers and tracking tables to create the sync environment
                    var clientProvider = new SqlSyncProvider(ClientConnection);

                    // Set the web server Options
                    var options = new SyncOptions
                    {
                        BatchDirectory = Path.Combine(SyncOptions.GetDefaultUserBatchDiretory(), "client")
                    };
                    // Creating an agent that will handle all the process
                    var agent = new SyncAgent(clientProvider, serverOrchestrator, options);
                    var progress = new SynchronousProgress<ProgressArgs>(pa => Console.WriteLine($"{pa.ProgressPercentage:p}\t {pa.Message}"));

                    if (!agent.Parameters.Contains("BranchID"))
                        //agent.Parameters.Add("BranchID", 1);
                        agent.Parameters.Add("BranchID",1);
                    do
                    {
                        try
                        {
                            // Launch the sync process
                            var s1 = await agent.SynchronizeAsync(progress);
                            if (s1.TotalChangesUploaded > 0)
                            {
                                Console.Beep(700, 5000);

                            }
                            if (s1.TotalChangesDownloaded > 0)
                            {
                                Console.Beep(700, 5000);
                            }
                            // Write results
                            Console.WriteLine(s1);

                          
                        }
                        catch (Exception ex)
                        {
                            Console.Beep(5000, 3000);
                            
                        }
                        Console.WriteLine("Waiting For New DB Changes!");

                        await Task.Delay(SyncInterval, stoppingToken);
                    }


                    while (!stoppingToken.IsCancellationRequested);

                    Console.WriteLine("End");
                }
                catch (Exception ex)
                {
                    Console.Beep(5000, 3000);
                    
                }

            }
        }
    }
}
