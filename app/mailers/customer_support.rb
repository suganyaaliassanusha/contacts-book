class CustomerSupport < ActionMailer::Base
  default from: "sugukvs92@gmail.com"

  def customer_support(contact)
  	
  	mail(:to => contact.email,  :subject => "customer support from Report Bee")
  end

end
