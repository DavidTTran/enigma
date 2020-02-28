require_relative 'modules/transformable'
require_relative 'modules/gettable'

class Enigma
  include Transformable
  include Gettable

  def initialize
    @alphabet = ("a".."z").to_a << " "
    @offset = nil
    @offset_values = nil
  end

  def encrypt(message, key, date)
    get_info(key, date)
    shift_alphabet

    encryption_info = {}
    encryption_info[:encryption] = new_message(message.downcase)
    encryption_info[:key] = key
    encryption_info[:date] = date
    encryption_info
  end

  def get_info(key, date)
    @offset_values = total_offset(key_to_pairs(key), date_to_keys(date))
  end

  def shift_alphabet(function = "encrypt")
    if function == "decrypt"
      @offset_values = @offset_values.map { |value| value * -1 }
      offset1 = @alphabet.rotate(@offset_values[0]).join
      offset2 = @alphabet.rotate(@offset_values[1]).join
      offset3 = @alphabet.rotate(@offset_values[2]).join
      offset4 = @alphabet.rotate(@offset_values[3]).join
    else
      offset1 = @alphabet.rotate(@offset_values[0]).join
      offset2 = @alphabet.rotate(@offset_values[1]).join
      offset3 = @alphabet.rotate(@offset_values[2]).join
      offset4 = @alphabet.rotate(@offset_values[3]).join
    end
    @offset = [offset1, offset2, offset3, offset4]
  end

  def new_message(message)
    new_message = ""
    message.each_char do |character|
      if @alphabet.include?(character)
        new_message << character.tr(@alphabet.join, @offset.first)
        @offset.rotate!
      else
        new_message << character
      end
    end
    new_message
  end

  def decrypt(encrypted_message, key, date)
    get_info(key, date)
    shift_alphabet("decrypt")

    decryption_info = {}
    decryption_info[:decryption] = new_message(encrypted_message.downcase)
    decryption_info[:key] = key
    decryption_info[:date] = date
    decryption_info
  end

end
