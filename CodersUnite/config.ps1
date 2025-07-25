<#
.SYNOPSIS
    Configures the site
.DESCRIPTION
    Configures the site.  
    
    At the point this runs, a $Site dictionary should exist, and it should contain a list of files to build.

    Any *.json, *.psd1, or *.yaml files in the root should have already been loaded into the $Site dictionary.

    Any additional configuration or common initialization should be done here.
#>

#region Site Metadata
$Site.Title = "Coders Unite!"
#endregion Site Metadata

#region Site Icons
$Site.Icon  = [Ordered]@{
    <#'BlueSky' = 
        Get-Content -Path (
            Join-Path $PSScriptRoot Assets | 
                Join-Path -ChildPath 'BlueSky.svg'
        ) -Raw#>
    'GitHub' = 
        Get-Content -Path (
            Join-Path $PSScriptRoot Assets | 
                Join-Path -ChildPath 'GitHub.svg'
        ) -Raw
    'RSS' = 
        Get-Content -Path (
            Join-Path $PSScriptRoot Assets | 
                Join-Path -ChildPath 'RSS.svg'
        ) -Raw
}
#endregion Site Icons


$site.PaletteName = 'Solarized-Darcula'
$Site.CodeFont = 'Inconsolata'

#region Site Menus
$Site.Logo = Get-Content -Path (
    Join-Path $PSScriptRoot 'Assets/CodersUnite.svg'
) -Raw

$site.Taskbar = [Ordered]@{
    'GitHub' = 'https://github.com/CodersUnite-org/CodersUnite'
    'RSS' = 'https://CodersUnite.org/RSS/index.rss'
}

$site.HeaderMenu = [Ordered]@{}
#endregion Site Menus