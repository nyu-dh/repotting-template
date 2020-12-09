require 'fileutils'

input_dir  = ARGV[0]
output_dir = ARGV[1]

FileUtils.mkdir_p output_dir

Dir.glob("./#{input_dir}/*.html").each do |input|
  output = "./#{output_dir}/#{File.basename input}"
  system("tidy -config config.txt '#{input}' > '#{output}'")
end
