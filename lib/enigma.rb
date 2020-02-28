require_relative 'modules/transformable'

class Enigma
  include Transformable

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
    offset1 = @alphabet.rotate(@offset_values[0]).join
    offset2 = @alphabet.rotate(@offset_values[1]).join
    offset3 = @alphabet.rotate(@offset_values[2]).join
    offset4 = @alphabet.rotate(@offset_values[3]).join
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

end
