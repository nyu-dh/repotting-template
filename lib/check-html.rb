require 'nokogumbo'

Dir.glob("./#{ARGV[0]}/**/*.html").each do |f|
  page = File.open(f).read()
  doc = Nokogiri::HTML5.parse(page, max_errors: 10)
  puts "\nerrors in '#{f}':\n\n" unless doc.errors.empty?
  doc.errors.each do |err|
    puts(err)
  end
end
