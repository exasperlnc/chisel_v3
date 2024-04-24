class Chisel
  def initialize(markdown)
    @markdown = markdown
  end

  def to_html
    @markdown.reverse
  end
end
# Read the input file
markdown = ARGV[0]
html_file = ARGV[1]
markdown_file = File.read(markdown)
# Convert it to MD
Chisel.new(markdown_file).to_html
# print out the return statement to the terminal`
markdown_file_lines = markdown_file.lines.count
html_file_lines = html_file.lines.count
require 'pry'; binding.pry
p "Converted #{markdown} (#{markdown_file_lines} lines) to #{html_file} (#{html_file_lines} lines)"