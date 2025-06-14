$paletteName = 'Solarized-Darcula'
$CodeFont = 'Inconsolata'
$argsAndinput = @($args) + @($input)

$style = @"
body {
    width: 100vw;
    height: 100vh;
    font-family: '$GoogleFont', sans-serif;        
}
pre, code {
    font-family: '$CodeFont', monospace;
}
"@

@"
<html>
    <head>
        <title>$Title</title>
        <script src="https://unpkg.com/htmx.org@latest"></script>
        <meta name='viewport' content='width=device-width, initial-scale=1' />
        <link rel='stylesheet' href='https://cdn.jsdelivr.net/gh/2bitdesigns/4bitcss@latest/css/$PaletteName.css'/>
        $OpenGraph
        $ImportMap
        <style>
$style        
        </style>
        $(
            @(
                '<script src="https://cdn.jsdelivr.net/gh/highlightjs/cdn-release@latest/build/highlight.min.js"></script>'
                foreach ($language in 'powershell') {
                    "<script src='https://cdn.jsdelivr.net/gh/highlightjs/cdn-release@latest/build/languages/$language.min.js'></script>"
                }
            ) -join [Environment]::NewLine            
        )
    </head>
<body>
        <a href="https://github.com/CodersUnite-org/CodersUnite">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="foreground-stroke"><path d="M9 19c-5 1.5-5-2.5-7-3m14 6v-3.87a3.37 3.37 0 0 0-.94-2.61c3.14-.35 6.44-1.54 6.44-7A5.44 5.44 0 0 0 20 4.77 5.07 5.07 0 0 0 19.91 1S18.73.65 16 2.48a13.38 13.38 0 0 0-7 0C6.27.65 5.09 1 5.09 1A5.07 5.07 0 0 0 5 4.77a5.44 5.44 0 0 0-1.5 3.78c0 5.42 3.3 6.61 6.44 7A3.37 3.37 0 0 0 9 18.13V22"></path></svg>
        </a>
        $($argsAndinput -join [Environment]::NewLine)
<script>hljs.highlightAll();</script>
    </body>
</html>
"@
