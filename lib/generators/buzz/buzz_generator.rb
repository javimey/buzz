require 'rails/generators'
require 'rails/generators/named_base'

module Buzz
  module Generators
    class BuzzGenerator < ::Rails::Generators::Base
      argument :access_token, :type => :string, :banner => 'access_token', :default => :use_env_sentinel

      source_root File.expand_path(File.join(File.dirname(__FILE__), 'templates'))

      def create_initializer
        say "creating initializer..."
        if access_token_configured?
          say "It looks like you've already configured Buzzerbox."
          say "To re-create the config file, remove it first: config/initializers/buzzerbox.rb"
          exit
        end

        begin
          require 'ey_config'
        rescue LoadError
        end

        if defined? EY::Config
            say "Access token will be read from Engine Yard configuration"
        else
          if access_token === :use_env_sentinel
            say "Generator run without an access token; assuming you want to configure using an environment variable."
            say "You'll need to add an environment variable BUZZERBOX_API_KEY with your access token:"
            say "\n$ export BUZZERBOX_API_KEY=yourapikeyhere"
            say "Also you need to set the SECRET_API_KEY too, so you'll need to add another environment variable BUZZERBOX_SECRET_TOKEN with your access token:"
            say "\n$ export BUZZERBOX_SECRET_TOKEN=yoursecretokenhere"
            say "\nIf that's not what you wanted to do:"
            say "\n$ rm config/initializers/buzzerbox.rb"
            say "$ rails generate buzzerbox yourapikeyhere yoursecretokenhere"
            say "\n"
          else
            say "access token: " << access_token
          end
        end

        template 'initializer.rb', 'config/initializers/buzzerbox.rb',
          :assigns => { :access_token => access_token_expr }

        # TODO run rake test task
      end

      def access_token_expr
        if access_token === :use_env_sentinel
          "ENV['BUZZERBOX_API_KEY']"
        else
          "'#{access_token}'"
        end
      end

      def access_token_configured?
        File.exists?('config/initializers/buzzerbox.rb')
      end
    end
  end
end
