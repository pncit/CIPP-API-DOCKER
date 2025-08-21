param($Request, $TriggerMetadata)

# UpmonFunction
# Simple health-check endpoint for the API.
# Returns HTTP 200 to confirm the service is running.

Push-OutputBinding -Name Response -Value ([HttpResponseContext]@{
    StatusCode = 200
    Body       = "OK"
})
