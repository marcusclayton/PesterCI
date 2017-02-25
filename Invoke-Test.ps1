$ErrorActionPreference = 'stop'
Install-PackageProvider -Name Nuget -Scope CurrentUser -Force -Confirm:$false
Install-Module -Name Pester -Scope CurrentUser -Force -Confirm:$false -SkipPublisherCheck
Install-Module -Name PSScriptAnalyzer -Scope CurrentUser -Force -Confirm:$false -SkipPublisherCheck
Import-Module Pester
Import-Module PSScriptAnalyzer
Invoke-Pester -OutputFile '.\Results\PesterResults.xml' -OutputFormat 'NUnitXml' -Script '.\Tests\script.tests.ps1'
Invoke-Pester -OutputFile '.\Results\PSSAResults.xml' -OutputFormat 'NUnitXml' -Script '.\Tests\PSSA.tests.ps1'
