param(
    [string]$WallpaperPath,
    [single]$SaturationnValue = 0.15
)

wal.exe -s -t -e -q -n -i $WallpaperPath --saturate $SaturationnValue

$colorsPath = "$HOME\.cache\wal\yasbcolors.json"
$colors = Get-Content -Raw -Path $colorsPath | ConvertFrom-Json
$variablesSection = @"
:root{
    --backgroundcol: $($colors.colors.background);
    --backgroundtranscol: $($colors.colors.backgroundtrans);
    --backgroundtranscol2: $($colors.colors.backgroundtrans2);
    --backgroundtranscol3: $($colors.colors.backgroundtrans3);
    --backgroundtranscol35: $($colors.colors.backgroundtrans35);
    --backgroundtranscol9: $($colors.colors.backgroundtrans9);
    --foregroundcol: $($colors.colors.foreground);
    --colors1: $($colors.colors.color1);
    --colors2: $($colors.colors.color2);
    --colors3: $($colors.colors.color3);
    --colors4: $($colors.colors.color4);
    --colors5: $($colors.colors.color5);
    --colors6: $($colors.colors.color6);
    --colors7: $($colors.colors.color7);
    --colors8: $($colors.colors.color8);
    --colors9: $($colors.colors.color9);
    --colors10: $($colors.colors.color10);
    --colors11: $($colors.colors.color11);
    --colors12: $($colors.colors.color12);
    --colors13: $($colors.colors.color13);
    --colors14: $($colors.colors.color14);
    --colors15: $($colors.colors.color15);
    --colors9trans5: $($colors.colors.color9trans);
    --colors10trans15: $($colors.colors.color10trans);
    --colors11trans5: $($colors.colors.color11trans);
    --colors12trans3: $($colors.colors.color12trans);
    --colors13trans7: $($colors.colors.color13trans);
    --colors14trans5: $($colors.colors.color14trans);
    --colors15trans9: $($colors.colors.color15trans);
}
"@

$stylesPath = "$HOME\.config\yasb\styles.css"
$stylesContent = Get-Content -Raw -Path $stylesPath
if ($stylesContent -match ":root\{[\s\S]*?\}") {
    $newStylesContent = $stylesContent -replace ":root\{[\s\S]*?\}", $variablesSection
} else {
    $newStylesContent = "$variablesSection`n$stylesContent"
}
$newStylesContent = $newStylesContent.TrimEnd()
$newStylesContent | Set-Content -Path $stylesPath

# YASB にリロードを通知
yasbc.exe reload
