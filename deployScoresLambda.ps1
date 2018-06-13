Push-Location $PSScriptRoot
7z a -r scoresLambda.zip .\scoresLambda\*
$path = (Get-Item -Path ".\scoresLambda.zip").FullName.Replace("\", "/")
$currentEnv = aws lambda get-function-configuration --function-name londonTubeClientLambda | ConvertFrom-Json | Select -expand Environment | Select -expand Variables
$MYSQL_HOST = $currentEnv.MYSQL_HOST
$MYSQL_DB = $currentEnv.MYSQL_DB
$MYSQL_USER = $currentEnv.MYSQL_USER
$MYSQL_PASSWORD = $currentEnv.MYSQL_PASSWORD
$currentRole = aws lambda get-function-configuration --function-name londonTubeClientLambda | ConvertFrom-Json | Select -expand Role
aws lambda create-function --region eu-west-2 --function-name londonTubeScoresLambda --zip-file "fileb://$path" --handler index.handler --runtime nodejs8.10 --role $currentRole
aws lambda update-function-configuration --region eu-west-2 --function-name londonTubeScoresLambda --environment Variables="{MYSQL_HOST=$MYSQL_HOST,MYSQL_PASSWORD=$MYSQL_PASSWORD,MYSQL_USER=$MYSQL_USER,MYSQL_DB=$MYSQL_DB}"
Remove-Item .\scoresLambda.zip
Pop-Location