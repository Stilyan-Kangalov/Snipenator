### SET FOLDER TO WATCH + FILES TO WATCH + SUBFOLDERS YES/NO
    $watcher = New-Object System.IO.FileSystemWatcher
    $watcher.Path = "G:\Side_Project\Snipenator"
    $watcher.Filter = "*.*"
    $watcher.IncludeSubdirectories = $true
    $watcher.EnableRaisingEvents = $true  
	
### DEFINE ACTIONS AFTER AN EVENT IS DETECTED
    $action1 = { $path = $Event.SourceEventArgs.FullPath
                $changeType = $Event.SourceEventArgs.ChangeType
                $logline = "$(Get-Date), $changeType, $path"
                Add-content "D:\log.txt" -value $logline
              } 	

### DEFINE ACTIONS AFTER AN EVENT IS DETECTED
    $action2 = { & "G:\Side_Project\Snipenator\Speedy_Git.bat" } 
	
	$action3 = { cmd.exe /c 'git add .'  } 
	
### DECIDE WHICH EVENTS SHOULD BE WATCHED
    Register-ObjectEvent $watcher "Created" -Action $action2
    Register-ObjectEvent $watcher "Changed" -Action $action2
    Register-ObjectEvent $watcher "Deleted" -Action $action2
    Register-ObjectEvent $watcher "Renamed" -Action $action2
	while ($true) {sleep 5}