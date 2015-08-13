require 'test_helper'

class CoreExtTest < ActiveSupport::TestCase
  def test_to_deliver_notification
    assert_equal({status: 401}, Buzz.deliver('foo_key'))
  end
end
