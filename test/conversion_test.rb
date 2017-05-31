require 'minitest/autorun'
require 'minitest/emoji'
require './lib/conversion'
class ConversionTest < Minitest::Test
  def test_it_exists
    c = Conversion.new

    assert_instance_of Conversion, c
  end

  def test_converts_free_standing
    c = Conversion.new
    str = "Hello World"

    assert_equal "<p>Hello World</p>", c.free_standing_to_p_tags(str)
  end

  def test_converts_single_line_breaks
    c = Conversion.new
    str = "Animals live at the zoo.\nDogs live at the park"
    expect = "<p>Animals live at the zoo. Dogs live at the park</p>"

    assert_equal expect, c.single_line_breaks_to_p_tags(str)
  end

  def test_converts_double_line_breaks
    c = Conversion.new
    str = "Welcome to my home\n\n"
    expect ="<p>Welcome to my home</p>\n"

    assert_equal expect, c.double_line_breaks_to_p_tags(str)
  end

  def test_convert_headers_to_h_tags
    c = Conversion.new
    str0 = '#Hello'
    str1 = '##Jello'
    str2 = '###Mello'
    str3 = '####Fellow'
    str4 = '#####Pizza'

    assert_equal "<h1>Hello</h1>", c.convert_to_header(str0)
    assert_equal "<h2>Jello</h2>", c.convert_to_header(str1)
    assert_equal "<h3>Mello</h3>", c.convert_to_header(str2)
    assert_equal "<h4>Fellow</h4>", c.convert_to_header(str3)
    assert_equal "<h5>Pizza</h5>", c.convert_to_header(str4)
  end

  def test_convert_to_em_or_strong_tags
    c = Conversion.new
    str0 = '*Mouse*'
    str1 = '**House**'
    str2 = "*There's a **Mouse** in the House*"
    expect = "<em>There's a <strong>Mouse</strong> in the House</em>"

    assert_equal "<em>Mouse</em>", c.convert_bold_or_italics(str0)
    assert_equal "<em>House</em>", c.convert_bold_or_italics(str1)
    assert_equal expect, c.convert_bold_or_italics(str2)
  end
end
