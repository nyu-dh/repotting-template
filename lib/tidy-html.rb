require 'fileutils'

Dir.glob("./#{ARGV[0]}/**/*.html").each do |input|
  puts "\ntidying #{input}\n\n"
  system("tidy --force-output yes --clean yes --indent auto -utf8 -q -m '#{input}'")
end
