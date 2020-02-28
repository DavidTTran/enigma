class Enigma

  def initialize
  end

  def encrypt(message, key, date)
    key_to_pairs(key)

    encryption_info = {}
    encryption_info[:encryption] = new_message(message.downcase)
    encryption_info[:key] = key
    encryption_info[:date] = date
    encryption_info
  end

  def key_to_pairs(key)
    keys = []
    key = key.split("").each_cons(2) { |pair| keys << pair }
    keys.map { |key| key.join.to_i }
  end
end
