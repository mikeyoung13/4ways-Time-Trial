module ApplicationHelper
  
  def formatMinSec(seconds)

    if !seconds.nil?
      (Time.mktime(0)+seconds).strftime("%H:%M:%S")
    else
      ""
    end

    #total_minutes = seconds / 1.minutes
    #seconds_in_last_minute = seconds - total_minutes.minutes.seconds
    #{}"#{total_minutes}:#{seconds_in_last_minute}s"
  end

  def formatTime(date)
    
    if !date.nil?
      date.strftime('%H:%M:%S')
    else
      ""
    end

    #print ActiveSupport::TimeZone.us_zones()
    #print date.class
    #date.in_time_zone('Eastern Time (US & Canada)').strftime('%H:%M:%S.%L')
    
    #date.local.strftime('%H:%M:%S.%L')
  end
end
