using System;
using Microsoft.Azure.WebJobs;
using Microsoft.Azure.WebJobs.Host;
using Microsoft.Extensions.Logging;

namespace demo
{
    public static class reader
    {
        [FunctionName("reader")]
        public static void Run([ServiceBusTrigger("dev-mastery-sbus", Connection = "devmasterysbusns_SERVICEBUS")]string myQueueItem, ILogger log)
        {
            log.LogInformation($"C# ServiceBus queue trigger function processed message: {myQueueItem}");
        }
    }
}
