require 'minitest/autorun'
require 'minitest/emoji'
require './lib/chisel'
require 'csv'

class ChiselTest < Minitest::Test
  def test_it_exists
    c = Chisel.new

    assert_instance_of Chisel, c
  end

  def test_

end
