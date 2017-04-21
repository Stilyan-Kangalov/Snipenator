### SET FOLDER TO WATCH + FILES TO WATCH + SUBFOLDERS YES/NO
    $watcher = New-Object System.IO.FileSystemWatcher
    $watcher.Path = "G:\Side_Project\Snipenator"
    $watcher.Filter = "*.*"
    $watcher.IncludeSubdirectories = $true
    $watcher.EnableRaisingEvents = $true  

### DEFINE ACTIONS AFTER AN EVENT IS DETECTED
    $action = { $path = $Event.SourceEventArgs.FullPath
                $changeType = $Event.SourceEventArgs.ChangeType
                $logline = "$(Get-Date), $changeType, $path"
                Add-content "D:\log.txt" -value $logline
              }
			  
	$action1 = { cmd.exe /c 'speedy_git.bat'  } 
	
### DECIDE WHICH EVENTS SHOULD BE WATCHED - Test 5
    Register-ObjectEvent $watcher "Created" -Action $action1
    Register-ObjectEvent $watcher "Changed" -Action $action1
    Register-ObjectEvent $watcher "Deleted" -Action $action1
    Register-ObjectEvent $watcher "Renamed" -Action $action1
    while ($true) {sleep 5}