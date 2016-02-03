class UserMailer < ApplicationMailer
	default from: "from@example.com"
	
	def thank_you
		@name = params[:name]
		@email = params[:email]
		@message = params[:message]
		UserMailer.contact_form(@name, @email, @message).deliver_now
	end
	
	def contact_form(email, name, message)
	@message = message
		mail(:from => email, 
			:to => 'cjoiner20@hotmail.co.uk',
			:subject => "An new contact form message from #{@name}")
	end

end
