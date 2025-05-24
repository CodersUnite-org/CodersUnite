# Requires
# Description: This script tests the markdown files in the repository.
# Author: Luis

#Set the current location
Set-Location $PSScriptRoot

#This test is about making sure there aren't easily fixed mistakes in the markdown files.
Write-Host "Starting Pester Tests"

Describe 'CheckMarkdownSyntax' {
    It 'Should be valid markdown code' {
        $Scripts = Get-ChildItem ..\*.md -Recurse
        foreach ($ScriptFile in $Scripts){
            Write-Host "Checking File $ScriptFile"
            ConvertFrom-Markdown -Path $ScriptFile -ErrorAction Stop
        }
    }
}