class AppMailer < ActionMailer::Base
  default from: "from@example.com"

def notify_project_owner discussion
  @sending_user = discussion.user
  @project = discussion.project
  @receiving_user = @project.user

  mail(to: @receiving_user.email, subject: " #{@sending_user.email} has started a discussion on your project #{@project.title}")

end




end
