require './lib/enigma'
require_relative 'test_helper'

class EnigmaTest < Minitest::Test

  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_it_can_encrypt_a_message
    skip
    date = "010101"
    key = "00000"
    message = "abc"
    @enigma.get_info(key, date)
    assert_equal "bcd", @enigma.new_message(message)
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

    expected3 =
    {
      encryption: "kbc",
      key: "10000",
      date: "000000"
    }

    assert_equal expected1, @enigma.encrypt("hello world", "02715", "040895")
    assert_equal expected2, @enigma.encrypt("HELLO! WORLD!", "00000", "000000")
    assert_equal expected3, @enigma.encrypt("abc", "10000", "000000")
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

  def test_it_can_decrypt_with_todays_date
    Date.expects(:today).returns(Date.new(2020,02,28))
    encrypted =
    {
      encryption: "rib ydmcapu",
      key: "02715",
      date: "280220"
    }

    expected =
    {
      decryption: "hello world",
      key: "02715",
      date: "280220"
    }
    assert_equal expected, @enigma.decrypt(encrypted[:encryption], "02715")
  end

  def test_it_can_encrypt_with_random_number
    Array.expects(:new).returns([1,2,3,4,5])
    Date.expects(:today).returns(Date.new(2020,02,28))
    expected =
    {
      encryption: "aesch cfklk",
      key: "12345",
      date: "280220"
    }

    assert_equal expected, @enigma.encrypt("hello world")
  end

  def test_it_can_crack_a_message
    Date.expects(:today).returns(Date.new(2020,02,02))
    expected =
    {
      :encryption=>"xkopdfzsgrgdutg",
      :key=>"08304",
      :date=>"020220"
    }

    assert_equal expected, @enigma.crack("xkopdfzsgrgdutg", "020220")
  end

end
