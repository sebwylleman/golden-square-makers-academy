require 'date'
require 'json'
require 'net/http'

class TimeError
  # Returns difference in seconds between server time
  # and the time on this computer
  def initialize(request)
    @request = request
  end
  def error(current_time)
    return get_server_time - current_time
  end

  private

  def get_server_time
    text_response = @request.get(URI("https://worldtimeapi.org/api/ip"))
    json = JSON.parse(text_response)
    return DateTime.parse(json["utc_datetime"]).to_time
  end
end

# time_error = TimeError.new
# p time_error.error
# p time_error.error
# p time_error.error
# p time_error.error
