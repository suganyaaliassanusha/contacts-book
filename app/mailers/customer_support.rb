class CustomerSupport < ActionMailer::Base
  default from: "sugukvs92@gmail.com"

  def customer_support(contact)
  	attachments['Help.pdf'] = File.read('public/data/EconomicTimes.pdf')
  	mail(:to => contact.email,  :subject => "customer support from Report Bee")
  end

end
