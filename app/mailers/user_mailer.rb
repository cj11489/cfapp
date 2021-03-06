class UserMailer < ApplicationMailer
	default from: "info@thewhiteleycollection.com"
	
	def contact_form(email, name, message)
	@message = message
		mail(:from => email, 
			:to => 'cjoiner20@hotmail.co.uk',
			:subject => "An new contact form message from #{@name}")
	end

	def thank_you
		@name = params[:name]
		@email = params[:email]
		@message = params[:message]
		UserMailer.contact_form(@name, @email, @message).deliver_now
	end

	def welcome(user)
		@user = user
		@url = "https://thewhiteleycollection.herokuapp.com"
		@appname = "The Whiteley Collection"
		mail( :to => user.email, :subject => "Welcome to #{@appname}")
	end

end
