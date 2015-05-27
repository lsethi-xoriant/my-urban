module CommentsHelper
  def to_pretty_time_ago comment_time
    a = (Time.now-comment_time).to_i
    #a = comment_time.to_i
    case a
      when 0 then t('just_now')
      when 1..59 then a.to_s + ' ' + case_of_comment_time_ago(a, 'case_of_second').to_s
      when 60..(3600-1) then #1minute = 60
        time = (a/60)
        time.to_s + ' ' + case_of_comment_time_ago(time, 'case_of_minute').to_s
      when 3600 .. (3600*24-1) then #1hour = 3600
        time = (a/3600)
        time.to_s + ' ' + case_of_comment_time_ago(time, 'case_of_hour').to_s
      when (3600*24) .. (3600*24*7-1) then #1day = 86400
        time = (a/(3600*24))
        time.to_s + ' ' + case_of_comment_time_ago(time, 'case_of_day').to_s
      when (3600*24*7) .. (3600*24*7*4-1) then #1week = 604800
        time = (a/(3600*24*7))
        time.to_s + ' ' + case_of_comment_time_ago(time, 'case_of_week').to_s
      when (3600*24*7*4) .. (3600*24*7*4*12-1) then #1month = 2419200
        time = (a/(3600*24*7*4)) 
        time.to_s + ' ' + case_of_comment_time_ago(time, 'case_of_month').to_s
      else 
        time = (a/(3600*24*7*4*12)) #1year = 29030400
        time.to_s + ' ' + case_of_comment_time_ago(time, 'case_of_year').to_s
    end
  end

  def case_of_comment_time_ago(count, type)
    if count == 1 || count>=21&&count%10 == 1     
      t("#{type}.one")
    elsif (count<=4&&count>1) || (count>=22&&(count%10 == 2 || count%10 == 3 || count%10 == 4))
      t("#{type}.few")
    elsif (count>=5&&count<21) || (count>=25&&(count%10 == 5 || count%10 == 6 || count%10 == 7 || count%10 == 8 || count%10 == 9 || count%10 == 0))     
      t("#{type}.many")    
    end
  end 
end
