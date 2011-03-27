module ApplicationHelper
  def formatTime(date)

    #print ActiveSupport::TimeZone.us_zones()
    #print date.class
    date.in_time_zone('Eastern Time (US & Canada)').strftime('%H:%M:%S.%L')
    
    #date.local.strftime('%H:%M:%S.%L')
  end
end
