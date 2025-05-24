# Requires
# Description: This script tests the powershell scripts in the repository.
# Author: Luis

#Set the current location
Set-Location $PSScriptRoot

#This test is about making sure there aren't easily fixed mistakes in our powershell code bases.
Write-Host "Starting Pester Tests"

Describe 'CheckPowerShellSyntax' {
    It 'Should be valid powershell code' {
        $Scripts = Get-ChildItem ..\*.ps1 -Recurse
        foreach ($ScriptFile in $Scripts){
            Write-Host "Checking File $ScriptFile"
            #Create the variables and pass the code to the parser. Then if there's any errors, return an an error.
            $tokens = $errors = $null
            [System.Management.Automation.Language.Parser]::ParseFile($ScriptFile, [ref]$tokens, [ref]$errors)
            if ($errors) {
                Write-Error "Test has Failed"
                }
        }
    }
}