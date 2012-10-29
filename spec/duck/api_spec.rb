require 'spec_helper'
require 'json'

describe Duck::API do

  subject { Duck::API.new }
  it { should respond_to :activities_info }
  its(:credentials) { should_not be_empty }
  its(:duck_sid) { should_not be_nil}
  its("duck_sid.size") { should == 32 }

  it "has #credentials" do
    subject.credentials.size.should == 2
  end

  it "has #activities_info" do
    subject.activities_info([]).size.should_not == 0
  end

  it "has #tickets_find" do
    subject.tickets_find(["citysocial"]).size.should_not == 0
  end

  it "has #calendar_months" do
    subject.calendar_months([]).size.should_not == 0
  end

end