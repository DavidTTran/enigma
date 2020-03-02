module Validateable

  def keys_valid?(key, date)
    if key != nil && key.length != 5 && key.to_i.length != 5
      "Invalid key"
    elsif date != nil && date.length != 6 && date.to_i.length >= 5
      "Invalid date"
    end
  end
  
end
