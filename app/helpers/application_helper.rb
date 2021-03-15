module ApplicationHelper
  def fix_url(str)
    if (str.starts_with?('http://') || str.starts_with?('https://'))
      str
    else
      'http://' + str
    end
  end

  def fix_time(dt)
    if logged_in? && !current_user.timezone.blank?
      dt = dt.in_time_zone(current_user.timezone)
    end
    
    dt.strftime("%m/%d/%Y %I:%M%p %Z")
  end
end
