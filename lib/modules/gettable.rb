module Gettable
require 'date'

  def get_date
    @date = Date.today.strftime("%d%m%y")
  end

  def get_random_key
    @random_key = Array.new(5) { rand(0..9) }.join
  end
end
