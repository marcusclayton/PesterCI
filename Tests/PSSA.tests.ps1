$here = (Split-Path -Parent $MyInvocation.MyCommand.Path ) -replace 'tests', 'code'
$file = "script.ps1"
$script = "$here\$file"
write "$here\$file"

#. "$here\$sut"

Describe 'Testing against PSSA rules' {
       Context 'PSSA Standard Rules' {
        $analysis = Invoke-ScriptAnalyzer -Path $script
        $scriptAnalyzerRules = Get-ScriptAnalyzerRule
 
        forEach ($rule in $scriptAnalyzerRules) {
            It "Should pass $rule" {
                If ($analysis.RuleName -contains $rule) {
                    $analysis |
                         Where RuleName -EQ $rule -outvariable failures |
                         Out-Default
                    $failures.Count | Should Be 0
                }
            }
        }
    }
}
