function yy
{
  # 创建临时文件路径
  $yy_tmp = [System.IO.Path]::Combine(
    [System.IO.Path]::GetTempPath(),
    "yazi-cwd.$([System.IO.Path]::GetRandomFileName())"
  )
    
  # 启动 Yazi 并传递临时文件路径
  yazi $Args --cwd-file="$yy_tmp"
    
  # 读取临时文件内容
  $yy_cwd = Get-Content -Path $yy_tmp -ErrorAction SilentlyContinue
    
  # 删除临时文件
  Remove-Item -Path $yy_tmp -Force -ErrorAction SilentlyContinue

  # 切换目录逻辑
  if ($yy_cwd -and ($yy_cwd -ne (Get-Location).Path))
  {
    Set-Location -Path $yy_cwd
  }
}
