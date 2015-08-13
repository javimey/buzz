require 'buzz'

Buzz.configure do |config|

<%- if (defined? EY::Config) -%>
  # Here we'll disable in 'test' and 'development':
  if Rails.env.test? or Rails.env.development?
    config.enabled = false
  else
    config.buzz_api_key = EY::Config.get('buzz_api_key', 'BUZZERBOX_API_KEY')
    config.buzz_secret_token = EY::Config.get('buzz_secret_token', 'BUZZERBOX_SECRET_TOKEN')
  end
<%- else -%>
  config.buzz_api_key = <%= buzz_api_key %>
  config.buzz_secret_token = <%= buzz_secret_token %>

    # Here we'll disable in 'test':
  if Rails.env.test?
    config.enabled = false
  end
<%- end -%>

end
