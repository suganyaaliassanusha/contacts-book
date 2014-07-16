ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
	:address => "smtp.gmail.com",
	:port => 587,
	:user_name => "sugukvs92@gmail.com",
	:password => "selvarajkv",
	:authentication => "plain",
	:enable_starttls_auto => true
}

