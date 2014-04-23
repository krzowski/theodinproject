class Timer
  attr_accessor :seconds

  def initialize
  	@seconds = 0
  end

  def time_string
  	sec = seconds % 60
  	sec = (sec > 9 ? sec.to_s : "0" + sec.to_s)
  	min = (seconds / 60) % 60
  	min = (min > 9 ? min.to_s : "0" + min.to_s)
  	hour = (seconds / 3600) % 24
  	hour = (hour > 9 ? hour.to_s : "0" + hour.to_s)

  	"#{hour}:#{min}:#{sec}" 
  end
end