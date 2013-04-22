class UserMailer < ActionMailer::Base
  default from: "notification@wantobs.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.comment_notification.subject
  #
  def comment_notification(comment)
    
    @user = comment.wts.user if !comment.wts.nil?
    @user = comment.wtb.user if !comment.wtb.nil?
    @comment = comment

    mail to: @user.email, subject: "Someone commented on your post"
  end
end
