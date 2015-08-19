require 'spec_helper'

describe Buzz do
  it "should should have a notify class method" do
    Buzz::Notifier.methods.include?("notify").should be_truthy
  end

  it "should should have a notify class method" do
    Buzz::Notifier.methods.include?("delay").should be_truthy
  end
end

  # def test_to_deliver_notification
  #   assert_equal({status: 401}, Buzz.deliver('foo_key'))
