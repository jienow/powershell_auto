$global:initStatus = $false
function setProxy {
  $Env:http_proxy="http://127.0.0.1:7890";$Env:https_proxy="http://127.0.0.1:7890";
  if ($global:initStatus -eq $true){
    getProxy
  }
  $global:initStatus = $true
}
function unsetProxy {
  $Env:http_proxy=$null;
  $Env:https_proxy=$null;
  getProxy;
}
function getProxy {
  $Env:http_proxy;
  $Env:https_proxy
}

$d="d:\development"
setProxy

