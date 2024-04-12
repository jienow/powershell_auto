function setProxy {
  $Env:http_proxy="http://127.0.0.1:7890";$Env:https_proxy="http://127.0.0.1:7890"
  getProxy
}
function unsetProxy {
  $Env:http_proxy=$null
  $Env:https_proxy=$null
  getProxy
}
function getProxy {
  $Env:http_proxy
  $Env:https_proxy
}

$d="d:\development"
setProxy

