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
end