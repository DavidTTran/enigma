module Gettable

  def get_date
    @date = Date.today.strftime("%d%m%y")
  end
end
