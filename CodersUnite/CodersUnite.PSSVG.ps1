#requires -Module PSSVG
$AssetsPath = Join-Path -Path $PSScriptRoot  -ChildPath "Assets"

if (-not (Test-Path $AssetsPath)) {
    New-Item -ItemType Directory -Path $AssetsPath | Out-Null
}

function ⇴ {
    param($radius, $angle)
    $radius * [math]::round([math]::cos($angle * [Math]::PI/180),15)
    $radius * [math]::round([math]::sin($angle * [Math]::PI/180),15)
}

$fontName = 'Anta'
$fontName = 'Heebo'
$fontName = 'Noto Sans'

svg -content $(
    $commonParameters = [Ordered]@{
        Fill        = '#4488FF'
        Class       = 'foreground-fill'
    }

    SVG.GoogleFont -FontName $fontName

    svg.symbol -Id psChevron -Content @(
        svg.polygon -Points (@(
            "40,20"
            "45,20"
            "60,50"
            "35,80"
            "32.5,80"
            "55,50"
        ) -join ' ')
    ) -ViewBox 100, 100

    $radius = 420
    
    $circleTop    = (1080/2), ((1080/2)-$radius)
    $circleMid    = (1080/2), (1080/2)
    $circleRight  = ((1080/2) + $radius),((1080/2))
    $circleBottom = (1080/2), ((1080/2)+$radius)
    $circleLeft   = ((1080/2) - $radius),((1080/2))    
    
    svg.use -Href '#psChevron' -X 0% -Y 25% @commonParameters -Height 50% -Opacity .9

    $arcStart  = ⇴ $radius 45 100
    $arcEnd    = ⇴ $radius 135 100 
    
    SVG.ArcPath -Start $circleLeft -End $circleBottom  -Radius $radius -Stroke 'transparent' -Id 'arc2' -Fill 'transparent' |
        SVG.ArcPath -End $circleRight  -Radius $radius -Stroke 'transparent' -Id 'arc2' -Fill 'transparent' |
        SVG.ArcPath -End $circleTop  -Radius $radius -Stroke 'transparent' -Id 'arc2' -Fill 'transparent' |
        SVG.ArcPath -End $circleLeft  -Radius $radius -Stroke 'transparent' -Id 'arc2' -Fill 'transparent'
    
    SVG.Circle -Cx (1080/2) -Cy (1080/2) -R ($radius*1.2) -Fill transparent -Stroke '#4488FF' -StrokeWidth 2 -Class 'foreground-stroke'
    SVG.Circle -Cx (1080/2) -Cy (1080/2) -R ($radius*0.8) -Fill transparent -Stroke '#4488FF' -StrokeWidth 2 -Class 'foreground-stroke'

    svg.text -X 25%  -FontSize 4.2em -FontFamily sans-serif @commonParameters -DominantBaseline 'middle' -TextAnchor 'right' -Style "font-family:'$fontName'" @(
        SVG.textPath -Href '#arc2' -Content "CODERS UNITE !" 
    ) -LetterSpacing .3em 
) -ViewBox 0, 0, 1080, 1080 -OutputPath $(
    Join-Path $assetsPath CodersUnite.svg
)