require './lib/chisel'
require 'minitest/autorun'

class TestChisel < Minitest::Test
  def test_markdown_to_html
    skip
    markdown = File.read('./my_input.md')

    expected_html = '<h1>My Life in Desserts</h1>

<h2>Chapter 1: The Beginning</h2>
    
<p>
  "You just <em>have</em> to try the cheesecake," he said. "Ever since it appeared in
  <strong>Food &amp; Wine</strong> this place has been packed every night."
</p>'

    output_html = Chisel.new(markdown).to_html
    assert_equal expected_html, output_html
  end

  def test_to_chunks
    markdown = "## Here's a bunch of stuff\n\nThat should be converted to chunks"
    expected_chunks = ["## Here's a bunch of stuff", "That should be converted to chunks"]
    output_chunks = Chisel.new(markdown).to_chunks(markdown)
    assert_equal expected_chunks, output_chunks
  end
end