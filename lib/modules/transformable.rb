module Transformable

  def key_to_pairs(key)
    keys = []
    key = key.split("").each_cons(2) { |pair| keys << pair }
    keys.map { |key| key.join.to_i }
  end

  def date_to_key(date)
    last_four = ((((date.to_i)**2).to_s)[-4..-1])
    last_four.split("").map { |key| key.to_i }
  end

  def total_offset(key, date)
   [key, date].transpose.map { |new_value| new_value.reduce(:+) }
  end

end
