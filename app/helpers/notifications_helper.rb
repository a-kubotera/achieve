module NotificationsHelper
  def posted_time(time)
    time > Date.today ? "#{time_ago_in_words(time)}" : time.strftime('%m月%d日')
  end
  def chk_comment(notice)
    @bool = notice.read
    unless @bool
      return "未読"
    end
  end

end
