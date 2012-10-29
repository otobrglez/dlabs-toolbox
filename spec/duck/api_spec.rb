require 'spec_helper'
require 'json'

describe Duck::API do

  subject { Duck::API.new }
  it { should respond_to :activities_info }
  its(:credentials) { should_not be_empty }
  its(:duck_sid) { should_not be_nil}
  its("duck_sid.size") { should == 32 }

  it "credentials" do
    subject.credentials.size.should == 2
  end


  context "activities_info" do
    it do
      subject.should respond_to :activities_info
      response = subject.activities_info
      response.should_not be_nil
      response.keys.should include "today", "month"
    end
  end

end