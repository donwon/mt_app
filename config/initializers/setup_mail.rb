ActionMailer::Base.smtp_settings= {

  address:    "smtp.gmail.com",
  port:       "587",
  user_name:  ENV['email_username'], #saved to email vars, so we can .gitignore
  password:   ENV['email_password'],
  authentication: :plain,
  enable_starttls_auto: true
  
}