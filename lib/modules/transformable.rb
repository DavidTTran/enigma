module Transformable

  def key_to_pairs(key)
    keys = []
    key = key.split("").each_cons(2) { |pair| keys << pair }
    keys.map { |key| key.join.to_i }
  end

  def date_to_keys(date)
    last_four = ((((date.to_i)**2).to_s)[-4..-1])
    if last_four.nil?
      [0,0,0,0]
    else
      last_four.split("").map { |key| key.to_i }
    end
  end

  def total_offset(key, date)
   @offset_values = [key, date].transpose.map { |new_value| new_value.reduce(:+) }
  end

end
