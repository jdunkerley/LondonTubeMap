Push-Location $PSScriptRoot
 7z a -r clientLambda.zip .\clientLambda\*
$path = (Get-Item -Path ".\clientLambda.zip").FullName.Replace("\", "/")
aws lambda update-function-code --region eu-west-2 --function-name londonTubeClientLambda --zip-file "fileb://$path"
Remove-Item .\clientLambda.zip
Pop-Location
