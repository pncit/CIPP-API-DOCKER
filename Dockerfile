# Use the official Azure Functions v4 PowerShell image as the base
FROM mcr.microsoft.com/azure-functions/powershell:4-powershell7.2

# Configure the function app's root and enable console logging
ENV AzureWebJobsScriptRoot=/home/site/wwwroot \
    AzureFunctionsJobHost__Logging__Console__IsEnabled=true

# Copy the Azure Functions project into the container
COPY . /home/site/wwwroot

# Azure Functions listens on port 80 by default
EXPOSE 80
