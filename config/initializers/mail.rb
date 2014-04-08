# config/initializers/mail.rb  
ActionMailer::Base.delivery_method = :smtp  
ActionMailer::Base.smtp_settings = {  
    :address => "smtp.gmail.com",  
    :port => 587,  
    :domain => "studentdeal.com",  
    :authentication => :plain,  
    :user_name => "mikeymccann@gmail.com",  
    :password => "secret" 
}