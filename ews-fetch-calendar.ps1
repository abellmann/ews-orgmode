function Get-ScriptDirectory
{
  $Invocation = (Get-Variable MyInvocation -Scope 1).Value
  Split-Path $Invocation.MyCommand.Path
}
$PYTHON_HOME="C:\python-venv\python-2711-win32"

$ACTIVATION_SCRIPT = $PYTHON_HOME + "\Scripts\activate.ps1"

& $ACTIVATION_SCRIPT

$scriptdir  = Get-ScriptDirectory  
$script = $scriptdir + "\ews-fetch-calendar.py"
py $script > $env:USERPROFILE\spacemacs\.ews-orgmode\outlook.org
#cmd /c pause | Out-Null
#python $script