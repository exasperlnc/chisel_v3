class Chisel
  def initialize(markdown)
    @markdown = markdown
  end

  def to_html
    # convert the markdown to chunks
    chunks = self.to_chunks(@markdown)

    # convert markdown based on if chunk is header or paragraph
    self.convert_chunks_to_html(chunks).joins('')
    # join the chunks together

  end

  def to_chunks(markdown)
    markdown.split(/\n\n+/)
  end
end
program_running = ($PROGRAM_NAME == __FILE__)
if program_running
  # Read the input file
  markdown_file = ARGV[0]
  html_file = ARGV[1]
  markdown = File.read(markdown_file)
  html = Chisel.new(markdown).to_html
  File.write(html_file, html)
  # Convert it to MD
  # print out the return statement to the terminal`
  markdown_file_lines = markdown.lines.count
  html_file_lines = html.lines.count
  p "Converted #{markdown} (#{markdown_file_lines} lines) to #{html_file} (#{html_file_lines} lines)"
end