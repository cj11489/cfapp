if Rails.env.production?
  Rails.configuration.stripe = {
    :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
    :secret_key => ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    :publishable_key => 'pk_test_IXd8N2uDn5U62Won2pHsx3NA',
    :secret_key => 'sk_test_Y13y4DpXihhQP6e8qLmnkXLz'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]