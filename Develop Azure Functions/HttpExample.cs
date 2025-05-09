using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Azure.Functions.Worker;
using Microsoft.Extensions.Logging;

namespace Develop_Azure_Functions;

public class HttpExample(ILogger<HttpExample> logger)
{
    private readonly ILogger<HttpExample> _logger = logger;

    [Function("HttpExample")]
    public IActionResult Run([HttpTrigger(AuthorizationLevel.Anonymous, "get", "post")] HttpRequest req)
    {
        _logger.LogInformation("HTTP trigger function processed a request. Method: {Method}, Path: {Path}", req.Method, req.Path);
        return new OkObjectResult("Well, you're here... Now what? ¯\\_(ツ)_/¯");
    }
}
