module ApplicationHelper
  def formatTime(date)
    date.in_time_zone('EST').strftime('%H:%M:%S.%L')
  end
end
