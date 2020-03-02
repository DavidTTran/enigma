require_relative 'modules/transformable'
require_relative 'modules/gettable'
require_relative 'modules/validateable'

class Cipher
  include Transformable
  include Gettable
  include Validateable

  attr_reader :offset_values, :offset, :alphabet

  def initialize
    @alphabet = ("a".."z").to_a << " "
    @offset = nil
    @offset_values = nil
  end

  def get_total_offset(key, date)
    total_offset(key_to_pairs(key), date_to_keys(date))
  end

  def shift_alphabet(function = "encrypt")
    if function == "decrypt"
      @offset_values = @offset_values.map { |value| value * -1 }
    end
      offset1 = @alphabet.rotate(@offset_values[0]).join
      offset2 = @alphabet.rotate(@offset_values[1]).join
      offset3 = @alphabet.rotate(@offset_values[2]).join
      offset4 = @alphabet.rotate(@offset_values[3]).join
      @offset = [offset1, offset2, offset3, offset4]
  end

end
