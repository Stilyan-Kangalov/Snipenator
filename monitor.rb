require 'filewatcher'
puts "###############################################################################"
puts "############################## Shadow Git #####################################"
puts
puts "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="
puts "Start Monitoring: " + Dir.pwd
puts "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="
puts

$dir = Dir.pwd

FileWatcher.new([$dir]).watch() do |filename, event|
  if(event == :changed)
    puts "File updated: " + filename
	puts "#####"
	puts
	system "start " + $dir + "/Speedy_Git.bat"
  end
  if(event == :delete)
    puts "New File Action: " + filename
	puts "#####"
	puts
	system "start " + $dir + "/Speedy_Git.bat"
  end
end

