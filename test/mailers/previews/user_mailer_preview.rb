# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
	def contact_form
    	UserMailer.contact_form("chris-joiner89@gmail.com", "Chris", "Hi, this is a test email")
  	end
  	def welcome
  		UserMailer.welcome("chris-joiner89@gmail.com")
  	end
end