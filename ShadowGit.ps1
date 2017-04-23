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
	
	$A = Start-Process -FilePath "G:\Side_Project\Snipenator\Speedy_Git.bat" -Wait -passthru;$a.ExitCode
	
### DECIDE WHICH EVENTS SHOULD BE WATCHED
    Register-ObjectEvent $watcher "Created" -Action $A
    Register-ObjectEvent $watcher "Changed" -Action $A
    Register-ObjectEvent $watcher "Deleted" -Action $A
    Register-ObjectEvent $watcher "Renamed" -Action $A
	while ($true) {sleep 5}