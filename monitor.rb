require 'filewatcher'

print "Lets Start Monitoring"

FileWatcher.new(["G:/Side_Project/Snipenator"]).watch() do |filename, event|
  if(event == :changed)
    puts "File updated: " + filename
  end
  if(event == :delete)
    puts "File deleted: " + filename
  end
  if(event == :new)
    puts "Added file: " + filename
	system "start G:\\Side_Project\\Snipenator\\test_me.bat"
  end
end
