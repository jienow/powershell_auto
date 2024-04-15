function cb
{
  cmake -B build;
  if (!$?)
  {
    Write-Host "cmake构建失败";
    return;
  }
  Write-Host  -ForegroundColor Cyan "------------------------------------------------构建成功";
  cmake --build .\build\;
  if (!$?)
  {
    Write-Host "编译失败";
    return;
  }
  Write-Host  -ForegroundColor Green "------------------------------------------------编译成功";
  ./build/main.exe;
  if (!$?)
  {
    Write-Host "main执行失败，可执行文件名可能不是main.exe";
    return;
  }
}
