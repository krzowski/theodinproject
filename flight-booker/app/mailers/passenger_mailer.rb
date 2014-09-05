class PassengerMailer < ActionMailer::Base
  default from: "from@example.com"

  def thank_you_email(passenger)
    @passenger = passenger
    @url = 'http://localhost:3000'
    mail(to: @passenger.email, subject: 'Thank you for booking a ticket')
  end
end
