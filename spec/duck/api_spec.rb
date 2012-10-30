require 'spec_helper'
require 'json'

describe Duck::API do

  subject { Duck::API.new }
  it { should respond_to :activities_info }
  its(:credentials) { should_not be_empty }
  its(:duck_sid) { should_not be_nil}
  its("duck_sid.size") { should == 32 }

  it "#credentials" do
    subject.credentials.size.should == 2
  end

  it "#activities_info" do
    subject.activities_info([]).size.should_not == 0
  end

  it "#tickets_find" do
    subject.tickets_find(["citysocial"]).size.should_not == 0
  end

  it "#calendar_months" do
    subject.calendar_months([]).size.should_not == 0
  end

  it "#projects_fetch" do
    subject.projects_fetch([]).size.should_not == 0
  end

  it "#projects_fetch_with_details" do
    subject.projects_fetch_with_details([]).size.should_not == 0
  end

  it "#teams_fetch" do
    subject.teams_fetch([]).size.should_not == 0
  end

  it "#workers_fetch" do
    subject.workers_fetch.size.should_not == 0
  end

  it "#workers_get_monthly_vacation_summary" do
    expect {
      subject.workers_get_monthly_vacation_summary([]).size.should_not == 0
    }.to raise_error Duck::API::Error
  end

end