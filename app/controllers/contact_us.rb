def thank_you
	@name = params[:name]
	@email = params[:email]
	@message = params[:message]
	ActionMailer::Base.mail(:from => @email,
		:to => 'cjoiner20@hotmail.co.uk',
		:subject => "A new Whiteley Collection message from #{@name}",
		:body => @message).deliver_now
end
