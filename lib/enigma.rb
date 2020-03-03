require_relative 'cipher'

class Enigma < Cipher

  def initialize
    @date = nil
    @random_key = nil
    super
  end

  def encrypt(message, key = nil, date = nil)
    keys_valid?(key, date)
    get_info(key, date)
    shift_alphabet("encrypt")

    encryption_info = {}
    encryption_info[:encryption] = new_message(message.downcase)
    encryption_info[:key] = key.nil? ? @random_key : key
    encryption_info[:date] = date.nil? ? @date : date
    encryption_info
  end

  def decrypt(encrypted_message, key = nil, date = nil)
    keys_valid?(key, date)
    get_info(key, date)
    shift_alphabet("decrypt")

    decryption_info = {}
    decryption_info[:decryption] = new_message(encrypted_message.downcase)
    decryption_info[:key] = key
    decryption_info[:date] = date.nil? ? @date : date
    decryption_info
  end

  def get_info(key = nil, date = nil)
    if date.nil? && key.nil?
      get_total_offset(get_random_key, get_date)
    elsif date.nil?
      get_total_offset(key, get_date)
    else
      get_total_offset(key, date)
    end
  end

  def new_message(message)
    new_message = ""
    message.each_char do |character|
      new_message << character.tr(@alphabet.join, @offset.first)
      @offset.rotate!
    end
    new_message
  end

end
