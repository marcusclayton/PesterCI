$here = (Split-Path -Parent $MyInvocation.MyCommand.Path ) -replace 'tests', 'code'
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'

. "$here\$sut"



Describe "Running App Specific Pester Tests" {
  context 'Context Block 1'{
      It "does something useful" {
          $true | Should Be $true
      }
    }
}
