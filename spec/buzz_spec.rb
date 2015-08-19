require 'spec_helper'

describe Buzz::Notifier do
  subject { described_class.new }
  it { should have_attr_accessor(:buzz_api_key) }
  it { should have_attr_accessor(:buzz_api_key) }
  it { should have_attr_accessor(:endpoint) }

  context "default endpoint" do
    it "should be http://buzzerbox.herokuapp.com/api/track" do
      subject.endpoint.should == "http://buzzerbox.herokuapp.com/api/track"
    end
  end

  context "notify" do
    it "should get a 404 if is not able to notify" do
      described_class.notify("foo","bar","event").should == {status: 401}
    end

    it "should give a 200 if the data is properly entered" do
      Net::HTTP.stub(:post_form).and_return(Net::HTTPSuccess)
      described_class.notify("foo","bar","event").should == {status: 200}
    end

    it "should accept several params" do
      hash = {param1: "foo", param2: "bar"}
      described_class.notify("foo","bar","event", hash).should == {status: 401}
    end
  end
end
