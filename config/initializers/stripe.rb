Rails.configuration.stripe = {
  :publishable_key => 'pk_live_rq6l4GTMpih0OwHXMtd7ZEFZ',
  :secret_key      => 'sk_live_1og7FHTRNCoBsE3X4ccqGM31'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]