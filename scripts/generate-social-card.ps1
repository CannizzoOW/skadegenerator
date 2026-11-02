Add-Type -AssemblyName System.Drawing

$width = 1200
$height = 630
$bitmap = New-Object System.Drawing.Bitmap($width, $height)
$graphics = [System.Drawing.Graphics]::FromImage($bitmap)
$graphics.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
$graphics.TextRenderingHint = [System.Drawing.Text.TextRenderingHint]::AntiAliasGridFit

$background = New-Object System.Drawing.Drawing2D.LinearGradientBrush(
  (New-Object System.Drawing.Rectangle(0, 0, $width, $height)),
  ([System.Drawing.Color]::FromArgb(8, 10, 11)),
  ([System.Drawing.Color]::FromArgb(22, 28, 30)),
  25
)
$graphics.FillRectangle($background, 0, 0, $width, $height)

$linePen = New-Object System.Drawing.Pen(([System.Drawing.Color]::FromArgb(51, 62, 66)), 2)
$graphics.DrawRectangle($linePen, 28, 28, 1143, 573)
$graphics.DrawLine($linePen, 64, 84, 1136, 84)

$crossPen = New-Object System.Drawing.Pen(([System.Drawing.Color]::FromArgb(70, 84, 89)), 2)
$graphics.DrawEllipse($crossPen, 860, 146, 210, 210)
$graphics.DrawLine($crossPen, 825, 251, 1105, 251)
$graphics.DrawLine($crossPen, 965, 111, 965, 391)

$white = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(242, 241, 233))
$orange = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(255, 91, 54))
$green = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(200, 255, 61))
$muted = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(143, 153, 157))

$labelFont = New-Object System.Drawing.Font('Consolas', 19, [System.Drawing.FontStyle]::Regular)
$titleFont = New-Object System.Drawing.Font('Impact', 92, [System.Drawing.FontStyle]::Regular)
$subFont = New-Object System.Drawing.Font('Consolas', 24, [System.Drawing.FontStyle]::Regular)
$tagFont = New-Object System.Drawing.Font('Consolas', 17, [System.Drawing.FontStyle]::Bold)

$graphics.DrawString('SYSTEM // RNG-01', $labelFont, $muted, 66, 48)
$graphics.DrawString('SKADE', $titleFont, $white, 58, 142)
$graphics.DrawString('GENERATOR', $titleFont, $orange, 58, 245)
$graphics.DrawString('RNG FOR SKADEOMFANG', $subFont, $white, 68, 405)
$graphics.DrawString('P/P  //  BEHANDLINGSBEHOV  //  /MEG', $tagFont, $green, 70, 474)
$graphics.DrawString('FOR FIKSJON & SPILL', $labelFont, $muted, 70, 538)

$outputPath = Join-Path $PSScriptRoot '..\dist\social-card.png'
$bitmap.Save($outputPath, [System.Drawing.Imaging.ImageFormat]::Png)

$tagFont.Dispose()
$subFont.Dispose()
$titleFont.Dispose()
$labelFont.Dispose()
$muted.Dispose()
$green.Dispose()
$orange.Dispose()
$white.Dispose()
$crossPen.Dispose()
$linePen.Dispose()
$background.Dispose()
$graphics.Dispose()
$bitmap.Dispose()

Write-Output $outputPath
