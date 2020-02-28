class Enigma

  def initialize
  end

  def encrypt(message, key, date)
    get_info(key, date)[:encrypt]

    encryption_info = {}
    encryption_info[:encryption] = new_message(message.downcase)
    encryption_info[:key] = key
    encryption_info[:date] = date
    encryption_info
  end
end
