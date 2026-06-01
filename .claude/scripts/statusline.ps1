# Claude Code statusline script (PowerShell)
$raw  = [Console]::In.ReadToEnd().Trim()
$json = $raw | ConvertFrom-Json

$model = $json.model.display_name
if (-not $model) { $model = $json.model.id }
if (-not $model) { $model = "Unknown" }

$rawSession = $json.context_window.used_percentage
if ($null -eq $rawSession) {
    $sessionPct = "-%"
} else {
    $sessionPct = "{0:F0}%" -f [double]$rawSession
}

$rawDaily = $json.rate_limits.five_hour.used_percentage
if ($null -eq $rawDaily) {
    $dailyPct = "-%"
} else {
    $dailyPct = "{0:F0}%" -f [double]$rawDaily
}

$cwd = $json.workspace.current_dir
if (-not $cwd) { $cwd = $json.cwd }
if (-not $cwd) { $cwd = "" }

$branch = $json.workspace.git_worktree
if (-not $branch -and $cwd) {
    $branch = git -C $cwd --no-optional-locks symbolic-ref --short HEAD 2>$null
}

$usage = "session {0} | daily {1}" -f $sessionPct, $dailyPct

if ($branch) {
    Write-Host ("{0} | {1} | {2} | {3}" -f $model, $usage, $cwd, $branch)
} else {
    Write-Host ("{0} | {1} | {2}" -f $model, $usage, $cwd)
}