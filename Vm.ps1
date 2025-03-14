$vmPath = 'D:\vm\Archlinux2025\archlinux2025.vmx'

function ArchStatus
{
  # 定义虚拟机的路径

  # 使用 vmrun 命令获取虚拟机状态
  $vmStatus = & vmrun list;
  # Write-Host $vmStatus.gettype()

  # Write-Host $vmPath
  # Write-Host $vmStatus
  # Write-Host $vmStatus[1]

  # 检查虚拟机是否在启动中
  if ($vmStatus -is [String])
  {
    return $false
  } elseif ($vmStatus -is [Object[]])
  {
    return $true
  } else
  {
    Write-Host "未知类型"
  }
}

function sshArch
{
  $Result = & ArchStatus;
  if ($Result -eq $false)
  {
    Write-Host "虚拟机没有启动。";
    # 启动虚拟机
    & vmrun start $vmPath nogui;
    # 循环判断状态
    for ($i = 1; $i -le 1000; $i++)
    {
      $Result = & ArchStatus;
      # 已经启动则退出
      if ($Result -eq $true)
      {
        break
      }
      Start-Sleep -Seconds 1
    }
  }
  Write-Host "虚拟机正在启动中。";
  clear
  ssh arch
}

function GuaQiArch
{
  & vmrun suspend $vmPath
}
