require_relative 'modules/transformable'
require_relative 'modules/gettable'

class Cipher
  include Transformable
  include Gettable

  def initialize
    @alphabet = ("a".."z").to_a << " "
    @offset = nil
    @offset_values = nil
    @date = nil
    @random_key = nil
  end

  def get_total_offset(key, date)
    @offset_values = total_offset(get_keys(key), get_date_keys(date))
  end

  def get_keys(key)
    key_to_pairs(key)
  end

  def get_date_keys(date)
    date_to_keys(date)
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

end