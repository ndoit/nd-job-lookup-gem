require 'date'

module Validation
  def validateInputDate(date_string)
    unless date_string =~ /20[0-2][0-9]-[0-1][0-9]-[0-3][0-9]/
      raise InvalidParams
    end
    Date.parse(date_string)
    date_string

  rescue
    raise InvalidParams
  end
end
