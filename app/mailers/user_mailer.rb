class UserMailer < ActionMailer::Base
  default from: "notification@wantobs.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.comment_notification.subject
  #
  def comment_notification(comment)
    @user = comment.commentable if comment.commentable.class.to_s == "User"
    @user = comment.commentable.user if comment.commentable.class.to_s == "Wtb"
    @user = comment.commentable.user if comment.commentable.class.to_s == "Wts"
    @comment = comment
    mail to: @user.email, subject: "Someone commented on your post"
  end
end
