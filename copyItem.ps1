Add-Type -AssemblyName System.Windows.Forms

$Form = New-Object Windows.Forms.Form
$Form.Text = "ファイルコピー"
$Form.Size = [Drawing.Size]::new(520, 200)
$Column = @(0, 10, 110, 330, 420)
$Row = @(0, 10, 40, 70, 100)

$Controls = @{
    Label1 = [Windows.Forms.Label]@{ Text = "コピー元:"; Location = [Drawing.Point]::new($Column[1], $Row[1]) }
    Label2 = [Windows.Forms.Label]@{ Text = "コピー先:"; Location = [Drawing.Point]::new($Column[1], $Row[2]) }
    Label3 = [Windows.Forms.Label]@{ Text = "除外ファイル:"; Location = [Drawing.Point]::new($Column[1], $Row[3]) }
    TextBox1 = [Windows.Forms.TextBox]@{ Location = [Drawing.Point]::new($Column[2], $Row[1]); Size = [Drawing.Size]::new(300, 20) }
    TextBox2 = [Windows.Forms.TextBox]@{ Location = [Drawing.Point]::new($Column[2], $Row[2]); Size = [Drawing.Size]::new(300, 20) }
    TextBox3 = [Windows.Forms.TextBox]@{ Location = [Drawing.Point]::new($Column[2], $Row[3]); Size = [Drawing.Size]::new(300, 20) }
    Button1 = [Windows.Forms.Button]@{ Text = "選択"; Location = [Drawing.Point]::new($Column[4], $Row[1]) }
    Button2 = [Windows.Forms.Button]@{ Text = "選択"; Location = [Drawing.Point]::new($Column[4], $Row[2]) }
    Button3 = [Windows.Forms.Button]@{ Text = "スタート"; Location = [Drawing.Point]::new($Column[4], $Row[4]) }
}

foreach ($control in $Controls.Keys) {
    $Form.Controls.Add($Controls[$control])
}

foreach ($i in 1..2) {
    $Controls["Button$i"].Add_Click({
        $folderDialog = New-Object Windows.Forms.FolderBrowserDialog
        $result = $folderDialog.ShowDialog()
        if ($result -eq [Windows.Forms.DialogResult]::OK) {
            $Form.Controls["TextBox$i"].Text = $folderDialog.SelectedPath
        }
    })
}

$StatusBar = New-Object Windows.Forms.StatusStrip
$StatusText = New-Object Windows.Forms.ToolStripStatusLabel
$StatusBar.Items.Add($StatusText)
$StatusBar.Dock = [Windows.Forms.DockStyle]::Bottom
$Form.Controls.Add($StatusBar)

$Controls["Button3"].Add_Click({
    $sourcePath, $destinationPath, $excludeFile = $Controls["TextBox1"].Text, $Controls["TextBox2"].Text, $Controls["TextBox3"].Text -split ','
    $StatusText.Text = "コピーを開始しました。"
    $copyResult = Copy-Item -Path $sourcePath -Destination $destinationPath -Recurse -Exclude $excludeFile -PassThru
    $StatusText.Text = "コピーが完了しました。コピー項目数: $($copyResult.Count)"
})

$Form.ShowDialog()
