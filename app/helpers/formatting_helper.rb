module FormattingHelper
  
  def format_time(time)
  	if time.present? 
      time.strftime("%d.%m.%Y %H:%M")
    end
  end

  def format_date(date)
  	if date.present?
  		date.strftime("%d.%m.%Y")
    end
  end

  def format_for_calendar(date)
    if date.present?
      "#{date.strftime("%Y-%m-%d")}"
    end
  end
end