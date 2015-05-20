class CommentsMailer < ActionMailer::Base
  default from: "myurban.com.ua",
          template_path: "mailers"

  def comment_to_event(name, email, content, email_user)
    @name = name
    @email = email
    @email_user = email_user
    @content = content
    mail(:to => @email_user, :subject => "Your information was send")
  end
end
