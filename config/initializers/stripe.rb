# frozen_string_literal: true

Rails.configuration.stripe = {
  publisher_key: 'pk_test_M7wZ08sCITKpRHWLyuyNNUGL00ksPgnT05',
  secret_key: 'sk_test_9OvDkzuktP6IHXSdkdbf9NwD00KOpqBBRA'
}
Stripe.api_key = Rails.configuration.stripe[:secret_key]
