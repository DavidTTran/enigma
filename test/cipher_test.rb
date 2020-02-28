require './lib/cipher'
require_relative 'test_helper'

class CipherTest < Minitest::Test

  def setup
    @cipher = Cipher.new
  end

  def test_it_exists
    assert_instance_of Cipher, @cipher
  end

  def test_it_can_get_keys
    key = "02715"

    assert_equal [2,27,71,15], @cipher.get_keys(key)
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

  def test_it_can_get_date_key
    date = "040895"

    assert_equal [1,0,2,5], @cipher.get_date_keys(date)
  end

  def test_it_can_get_offset_total
    date = [1,0,2,5]
    key = [2,27,71,15]

    assert_equal [3,27,73,20], @cipher.total_offset(key, date)
  end

  def test_shift_alphabet
    skip
    assert_equal 1, @cipher.shift_alphabet
  end

  def test_it_can_encrypt_a_message
    skip
    message = "abc"
    assert_equal "bcd", @cipher.new_message(message)
  end

  def test_it_can_get_todays_date
    expected = Date.today.strftime("%d%m%y")

    assert_equal expected, @cipher.get_date
  end

  def test_it_can_generate_random_number
    assert_instance_of String, @cipher.get_random_key
    assert @cipher.get_random_key.to_i < 100000
    assert_equal 5, @cipher.get_random_key.length
    # little odd testing minimum value, as it can return "00000"
    # assert @cipher.random_key.to_i > 999
  end
end
