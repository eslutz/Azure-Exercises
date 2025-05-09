# Develop Azure Functions

[Develop Azure Functions](https://learn.microsoft.com/en-us/training/modules/develop-azure-functions/): A module covering how to create and deploy Azure Functions.

## Troubleshooting

### Update the VS Code Launch Configuration

The project created from the HTTP Trigger template using the VS Code Azure Functions extension will not start using the provided `launch.json` file. When you attempt to start debugging the following error message is displayed:

> Error processing launch options at field: processId

To resolve the issue, update the `launch.json` file to change the `processId` line from:

```json
"processId": "${command:azureFunctions.pickProcess}"
```

to:

```json
"processId": "${command:pickProcess}"
```

The full `launch.json` configuration should look like this:

```json
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "Attach to .NET Functions",
      "type": "coreclr",
      "request": "attach",
      "processId": "${command:pickProcess}"
    }
  ]
}
```

### Debugging the Function

To debug the function, follow these steps:

1. Open a terminal at the root of the project.
2. Run the command:

   ```bash
   func start
   ```

3. In VS Code, click the debug button to start debugging using the configuration provided in `launch.json`.
4. When prompted, select the process for the function that is running.
