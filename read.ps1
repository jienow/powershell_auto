param (
    [string]$FilePath = "C:\path\to\your\large_file.txt",
    [int]$ChunkSize = 4096  # 每次读取的字符数
)

if (-Not (Test-Path $FilePath)) {
    Write-Host "错误：文件 '$FilePath' 不存在。"
    exit
}

try {
    $reader = [System.IO.StreamReader]::new($FilePath)

    while ($true) {
        # 等待用户输入再读取
        $inputCmd = Read-Host "`n输入 'a' 继续读取下一块, 'q' 退出程序"
        switch ($inputCmd.ToLower()) {
            'a' {
                $buffer = New-Object char[] $ChunkSize
                $readCount = $reader.Read($buffer, 0, $ChunkSize)

                if ($readCount -eq 0) {
                    Write-Host "`n--- 已到文件末尾 ---"
                    break
                }

                $text = -join $buffer[0..($readCount - 1)]
                Write-Host "`n[读取 $readCount 字符]"
                Write-Host $text
            }
            'q' {
                Write-Host "已退出程序。"
                $reader.Close()
                exit
            }
            default {
                Write-Host "无效指令，请输入 'a' 或 'q'。"
            }
        }
    }

    $reader.Close()
}
catch {
    Write-Host "读取文件时发生异常：$($_.Exception.Message)"
}

