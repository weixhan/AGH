param([switch]$Restart)

$ErrorActionPreference = 'Stop'
$taskProjectRoot = [IO.Path]::GetFullPath($PSScriptRoot)
$taskLauncher = Join-Path $taskProjectRoot 'run_agh.py'
$taskPython = 'E:\Anaconda_envs\envs\MMIOC_env\python.exe'
$taskNode = 'E:\nodejs24.15.0\node.exe'
$taskEntry = [IO.Path]::GetFullPath((Join-Path $taskProjectRoot '..\agnes-harness\packages\cli\dist\local\agnes.mjs'))
$taskOriginalEntry = $taskEntry
$taskPreferredManifest = Join-Path $taskProjectRoot 'outputs\agh-title-repair-v2\repair_verification.json'
if (Test-Path -LiteralPath $taskPreferredManifest -PathType Leaf) {
    $taskPreferred = Get-Content -LiteralPath $taskPreferredManifest -Raw -Encoding UTF8 | ConvertFrom-Json
    $taskExpectedRuntime = Join-Path $taskProjectRoot 'outputs\agh-title-repair-v2\runtime\packages\cli\dist\local'
    if ($taskPreferred.status -ne 'passed_local_repair' -or $taskPreferred.repair_version -ne 2 -or
        [IO.Path]::GetFullPath($taskPreferred.runtime_directory) -ne [IO.Path]::GetFullPath($taskExpectedRuntime)) {
        throw 'The preferred runtime manifest is not the accepted project V2 runtime.'
    }
    foreach ($taskPin in $taskPreferred.runtime_files) {
        if ((Get-FileHash -LiteralPath $taskPin.path -Algorithm SHA256).Hash.ToLowerInvariant() -ne $taskPin.sha256) {
            throw 'The preferred runtime bytes changed; refusing to start an unverified runtime.'
        }
    }
    $taskEntry = Join-Path $taskExpectedRuntime 'agnes.mjs'
}
$taskRuntime = Join-Path $taskProjectRoot '.runtime'

foreach ($taskRequired in @($taskPython, $taskNode, $taskLauncher, $taskEntry)) {
    if (-not (Test-Path -LiteralPath $taskRequired -PathType Leaf)) {
        throw "Required runtime is missing: $taskRequired"
    }
}

$taskListeners = @(Get-NetTCPConnection -LocalPort 4177 -State Listen -ErrorAction SilentlyContinue)
foreach ($taskListener in $taskListeners) {
    $taskOwner = Get-CimInstance Win32_Process -Filter ('ProcessId = ' + $taskListener.OwningProcess)
    $taskParent = Get-CimInstance Win32_Process -Filter ('ProcessId = ' + $taskOwner.ParentProcessId)
    $taskMatches = $taskOwner.Name -eq 'node.exe' -and
        $taskOwner.ExecutablePath -ieq $taskNode -and
        ($taskOwner.CommandLine.Contains($taskEntry) -or $taskOwner.CommandLine.Contains($taskOriginalEntry)) -and
        $taskParent -and $taskParent.CommandLine -and
        $taskParent.CommandLine.Contains($taskLauncher)
    if (-not $taskMatches) { throw 'Port 4177 belongs to another service; refusing to stop it.' }
    if (-not $Restart) {
        Write-Output 'Already running: http://127.0.0.1:4177/'
        return
    }
    # Hold the exact process handle and recheck its creation time before stopping it.
    $taskHandle = Get-Process -Id $taskOwner.ProcessId
    $null = $taskHandle.Handle
    if ([Math]::Abs(($taskHandle.StartTime.ToUniversalTime() - $taskOwner.CreationDate.ToUniversalTime()).TotalMilliseconds) -ge 1) {
        throw 'The listening process changed; refusing to stop it.'
    }
    $taskHandle.Kill()
    $null = $taskHandle.WaitForExit(10000)
    if (-not $taskHandle.HasExited) { throw 'The old web process did not exit.' }
}

New-Item -ItemType Directory -Path $taskRuntime -Force | Out-Null
$taskStamp = [DateTime]::UtcNow.ToString('yyyyMMdd-HHmmss')
$taskStdout = Join-Path $taskRuntime ("web-$taskStamp.stdout.log")
$taskStderr = Join-Path $taskRuntime ("web-$taskStamp.stderr.log")
$taskArguments = @('-B', ('"{0}"' -f $taskLauncher), '--node', ('"{0}"' -f $taskNode), '--entry', ('"{0}"' -f $taskEntry), 'serve')
$taskWeb = Start-Process -FilePath $taskPython -ArgumentList $taskArguments -WorkingDirectory $taskProjectRoot -WindowStyle Hidden -RedirectStandardOutput $taskStdout -RedirectStandardError $taskStderr -PassThru
[pscustomobject]@{
    pid = $taskWeb.Id
    process_started_at = $taskWeb.StartTime.ToUniversalTime().ToString('o')
    url = 'http://127.0.0.1:4177/'
    stdout = $taskStdout
    stderr = $taskStderr
} | ConvertTo-Json | Set-Content -LiteralPath (Join-Path $taskRuntime 'web-process.json') -Encoding UTF8
Write-Output ('Started background web launcher PID ' + $taskWeb.Id)
Write-Output 'http://127.0.0.1:4177/'
