require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Duck" do

  it "should include all the libs" do
    Duck::API.new.class.to_s.should =~ /api/i
  end

end
