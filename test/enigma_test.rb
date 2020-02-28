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
    expected1 =
    {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
    }

    expected2 =
    {
      encryption: "hello! world!",
      key: "00000",
      date: "000000"
    }

    assert_equal expected1, @enigma.encrypt("hello world", "02715", "040895")
    assert_equal expected2, @enigma.encrypt("HELLO! WORLD!", "00000", "000000")
  end

  def test_it_can_get_keys
    key = "02715"

    assert_equal [2,27,71,15], @enigma.get_keys(key)
  end

  def test_key_to_pairs
    assert_equal [10,4,45,55], @enigma.key_to_pairs("10455")
  end

  def test_date_squared_last_four_num
    assert_equal [4,4,0,0], @enigma.date_to_keys("120620")
  end

  def test_total_offset
    key = [1,1,1,1]
    date = [1,1,1,1]
    assert_equal [2,2,2,2], @enigma.total_offset(key, date)
  end

  def test_it_can_get_date_key
    date = "040895"

    assert_equal [1,0,2,5], @enigma.get_date_keys(date)
  end

  def test_it_can_get_offset_total
    date = "040895"
    key = "02715"

    assert_equal [3,27,73,20], @enigma.get_info(key, date)
  end

  def test_shift_alphabet
    skip
    assert_equal 1, @enigma.shift_alphabet
  end

  def test_it_can_encrypt_a_message
    skip
    message = "abc"
    assert_equal "bcd", @enigma.new_message(message)
  end

  def test_it_can_decrypt_a_message
    expected =
    {
      decryption: "hello world",
      key: "02715",
      date: "040895"
    }

    assert_equal expected, @enigma.decrypt("keder ohulw", "02715", "040895")
  end

  def test_it_can_get_todays_date
    expected = Date.today.strftime("%d%m%y")

    assert_equal expected, @enigma.get_date
  end

  def test_it_can_encrypt_with_todays_date
    Date.expects(:today).returns(Date.new(2020,02,28))
    encrypted =
    {
      encryption: "rib ydmcapu",
      key: "02715",
      date: "280220"
    }

    assert_equal encrypted, @enigma.encrypt("hello world", "02715")
  end
end
