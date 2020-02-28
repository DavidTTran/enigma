require_relative 'modules/transformable'

class Enigma
  include Transformable

  def initialize
    @offset_values = nil
  end

  def encrypt(message, key, date)
    get_info(key, date)
    encryption_info = {}
    encryption_info[:encryption] = new_message(message.downcase)
    encryption_info[:key] = key
    encryption_info[:date] = date
    encryption_info
  end

  def get_info(key, date)
    @offset_values = total_offset(key_to_pairs(key), date_to_key(date))
  end
end
