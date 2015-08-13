# module Buzz
#   module ActsAsBuzz
#     extend ActiveSupport::Concern
#
#     included do
#     end
#
#     module ClassMethods
#       def acts_as_buzz(options = {})
#         cattr_accessor :yaffle_text_field
#         self.buzz_text_field = (options[:buzz_text_field] || :last_squawk).to_s
#
#         include Buzz::ActsAsBuzz::LocalInstanceMethods
#       end
#     end
#
#     module LocalInstanceMethods
#       def notify(string)
#         return "true"
#         write_attribute(self.class.buzz_text_field, string.to_squawk)
#       end
#     end
#   end
# end
#
# ActiveRecord::Base.send :include, Buzz::ActsAsBuzz
