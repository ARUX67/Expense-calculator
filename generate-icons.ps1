$dir = 'D:\projects\Daily Grocerys\icons'
New-Item -ItemType Directory -Force -Path $dir | Out-Null

foreach ($size in 192, 512) {
    $img = New-Object System.Drawing.Bitmap($size, $size)
    $g = [System.Drawing.Graphics]::FromImage($img)
    $g.Clear([System.Drawing.Color]::FromArgb(45, 95, 79))
    $orange = [System.Drawing.Color]::FromArgb(232, 117, 74)
    $white = [System.Drawing.Color]::FromArgb(255, 255, 255)
    $gold = [System.Drawing.Color]::FromArgb(212, 175, 55)

    $g.FillRectangle([System.Drawing.SolidBrush]::new($orange), 24, 60, ($size - 48), [int]($size / 3))
    $g.FillRectangle([System.Drawing.SolidBrush]::new($white), 32, 28, ($size - 64), 28)
    $g.FillRectangle([System.Drawing.SolidBrush]::new($white), 42, ($size - 54), ($size - 84), 20)

    $font = New-Object System.Drawing.Font('Segoe UI', [Math]::Round($size * 0.38), [System.Drawing.FontStyle]::Bold)
    $g.DrawString('G', $font, [System.Drawing.SolidBrush]::new($white), [System.Drawing.PointF]::new($size * 0.27, $size * 0.17))
    $g.DrawString('G', $font, [System.Drawing.SolidBrush]::new($gold), [System.Drawing.PointF]::new($size * 0.26, $size * 0.17))

    $path = Join-Path $dir ("icon-" + $size + ".png")
    $img.Save($path, [System.Drawing.Imaging.ImageFormat]::Png)
    $g.Dispose()
    $img.Dispose()
}

Get-ChildItem -Path $dir | Select-Object Name, Length
Write-Output 'PNG icons created'
