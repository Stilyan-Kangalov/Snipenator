require 'filewatcher'

print "Lets Start Monitoring"

FileWatcher.new(["G:/Side_Project/Snipenator"]).watch() do |filename, event|
  if(event == :changed)
    puts "File updated: " + filename
  end
  if(event == :delete or event == :new)
    puts "File deleted: " + filename
	system "start G:\\Side_Project\\Snipenator\\test_me.bat"
  end
end
