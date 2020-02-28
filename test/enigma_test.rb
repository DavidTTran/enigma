require './lib/enigma'
require_relative 'test_helper'

class EnigmaTest < Minitest::Test

  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_it_can_encrypt
    skip
    expected =
    {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
    }

    assert_equal expected, @enigma.encrypt("hello world", "02715", "040895")
  end

  def test_it_can_get_keys
    key = "02715"

    assert_equal [2,27,71,15], @enigma.key_to_pairs(key)
  end

  def test_it_can_get_date_key
    date = "040895"

    assert_equal [1,0,2,5], @enigma.get_date_keys(date)
  end
end
