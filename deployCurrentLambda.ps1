Push-Location $PSScriptRoot
Compress-Archive -Path ".\currentLambda\*" -DestinationPath ".\currentLambda.zip"
$path = (Get-Item -Path ".\currentLambda.zip").FullName.Replace("\", "/")
aws lambda create-function --region eu-west-2 --function-name londonTubeCurrentLambda --zip-file "fileb://$path" --handler index.js --runtime nodejs8.10 --role arn:aws:iam::803049121276:role/service-role/londonTubeClientLambdaRole
Remove-Item .\currentLambda.zip
Pop-Location