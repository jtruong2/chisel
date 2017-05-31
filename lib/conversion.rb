require 'pry'
class Conversion
  def initialize

  end

  def free_standing_to_p_tags(line)
    "<p>#{line}</p>"
  end

  def single_line_breaks_to_p_tags(line)
    new_line = line.sub("\n", " ")
    free_standing_to_p_tags(new_line)
  end

  def double_line_breaks_to_p_tags(line)
    new_line = line.gsub("\n", "")
    leng = new_line.length
    "<p>#{new_line[0..leng-1]}</p>\n"
  end

  def convert_to_header(line)
    case
    when line.include?('#####') then "<h5>#{line[5..-1]}</h5>"
    when line.include?('####') then "<h4>#{line[4..-1]}</h4>"
    when line.include?('###') then "<h3>#{line[3..-1]}</h3>"
    when line.include?('##') then "<h2>#{line[2..-1]}</h2>"
    when line.include?('#') then "<h1>#{line[1..-1]}</h1>"
    end
  end

  def convert_bold_or_italics(line)
    leng = line.length-1
    if line[0..1] == "**"
      if line[2..leng-1].include?('*')
        line[2..leng-1].sub!('*','<em>')
        line[2..leng-1].sub!('*','</em>')
      end
      "<strong>#{line[2..leng-1]}</strong>"
    elsif line[0] == "*"
      if line[1..leng].include?('**')
        line[1..leng].sub!('**','<strong>')
        line[1..leng].sub!('**','</strong>')
      end
      "<em>#{line[1..leng]}</em>"
    end

  end
end
