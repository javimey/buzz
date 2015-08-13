require 'buzz'
Buzz.configure do |config|
  # Without configuration, Rollbar is enabled in all environments.
  # To disable in specific environments, set config.enabled=false.

<%- if (defined? EY::Config) -%>
  # Here we'll disable in 'test' and 'development':
  if Rails.env.test? or Rails.env.development?
    config.enabled = false
  else
    config.access_token = EY::Config.get('buzz', 'BUZZERBOX_API_KEY')
  end
<%- else -%>
  config.access_token = <%= access_token_expr %>

  # Here we'll disable in 'test':
  if Rails.env.test?
    config.enabled = false
  end
<%- end -%>

end
