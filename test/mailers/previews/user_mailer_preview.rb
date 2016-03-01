# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
	def contact_form
    	UserMailer.contact_form("cjoiner20@hotmail.co.uk", "Chris", "Hi, this is a test email")
  	end
  	def welcome
  		UserMailer.welcome("cjoiner20@hotmail.co.uk")
  	end
end