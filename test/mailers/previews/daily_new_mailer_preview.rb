# Preview all emails at http://localhost:3000/rails/mailers/daily_new_mailer
class DailyNewMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/daily_new_mailer/daily_notification
  def daily_notification
    DailyNewMailer.daily_notification
  end

end
