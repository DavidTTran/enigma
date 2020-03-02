require './lib/cipher'
require_relative 'test_helper'

class CipherTest < Minitest::Test

  def setup
    @cipher = Cipher.new
  end

  def test_it_exists
    assert_instance_of Cipher, @cipher
  end

  def test_key_to_pairs
    assert_equal [10,4,45,55], @cipher.key_to_pairs("10455")
  end

  def test_date_squared_last_four_num
    assert_equal [4,4,0,0], @cipher.date_to_keys("120620")
  end

  def test_total_offset
    key = [1,1,1,1]
    date = [1,1,1,1]
    assert_equal [2,2,2,2], @cipher.total_offset(key, date)
  end

  def test_it_can_validate_keys
    key = "123456"
    date = "020320"

    assert_equal "Invalid key", @cipher.keys_valid?(key, date)

    key = "12345"
    date = "1234567"
    assert_equal "Invalid date", @cipher.keys_valid?(key, date)

    key = "123ab"
    date = "020320"
    assert_equal "Invalid key", @cipher.keys_valid?(key, date)
  end

  def test_it_can_get_offset_total
    date = [1,1,1,1]
    key = [0,0,0,0]

    assert_equal [1,1,1,1], @cipher.total_offset(key, date)
  end

  def test_shift_alphabet
    date = "040895"
    key = "02715"
    @cipher.get_total_offset(key, date)
    expected = ["defghijklmnopqrstuvwxyz abc",
                "abcdefghijklmnopqrstuvwxyz ",
                "tuvwxyz abcdefghijklmnopqrs",
                "uvwxyz abcdefghijklmnopqrst"]

    assert_equal expected, @cipher.shift_alphabet
  end

  def test_it_can_get_todays_date
    expected = Date.today.strftime("%d%m%y")

    assert_equal expected, @cipher.get_date
  end

  def test_it_can_generate_random_number
    assert_instance_of String, @cipher.get_random_key
    assert @cipher.get_random_key.to_i < 100000
    assert_equal 5, @cipher.get_random_key.length
  end
end
