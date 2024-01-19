# Buid PROD version of app
# Codemagic API documentation can be found here - https://docs.codemagic.io/rest-api/builds/
# Update appId, workflowId, branch, APP_STORE_ID, BUNDLE_ID, XCODE_SCHEME, XCODE_CONFIG, ENTRY_POINT to your own values.
# The appId can be found in App Store Connect > App > General > App Information

curl -H "Content-Type: application/json" -H "x-auth-token: ${CM_API_KEY}" \
--data '{
    "appId": "6476280284",
    "workflowId": "ios-release",
    "branch": "dev",
    "environment": {
        "variables": {
            "BUNDLE_ID": "com.negandev.devfin",
            "XCODE_SCHEME": "production",
            "XCODE_CONFIG": "Release-production",
            "ENTRY_POINT": "lib/main_production.dart"
        }
    }
}' \
https://api.codemagic.io/builds