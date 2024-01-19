# Buid STG version of app
# Codemagic API documentation can be found here - https://docs.codemagic.io/rest-api/builds/
# Update appId, workflowId, branch, APP_STORE_ID, BUNDLE_ID, XCODE_SCHEME, XCODE_CONFIG, ENTRY_POINT to your own values.

curl -H "Content-Type: application/json" -H "x-auth-token: ${CM_API_KEY}" \
--data '{
    "appId": "com.negandev.devfin.stg",
    "workflowId": "ios-release",
    "branch": "dev",
    "environment": {
        "variables": {
            "BUNDLE_ID": "com.negandev.devfin.stg",
            "XCODE_SCHEME": "staging",
            "XCODE_CONFIG": "Release-staging",
            "ENTRY_POINT": "lib/main_staging.dart"
        }
    }
}' \
https://api.codemagic.io/builds