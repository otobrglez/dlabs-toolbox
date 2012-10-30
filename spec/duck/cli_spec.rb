require "spec_helper"

describe Duck::CLI do

  context "parse_command" do

    context "projects" do
      subject { Duck::CLI.new.parse_command("projects") }
      it { subject[:command].should == :projects_fetch }
    end

    context "citysoci" do
      subject { Duck::CLI.new.parse_command("citysoci") }
      it { subject[:command].should == :tickets_find }
    end

    context "quack" do
      subject { Duck::CLI.new.parse_command("quack") }
      it { subject[:command].should == :quack }
    end

    context "q" do
      subject { Duck::CLI.new.parse_command("q") }
      it { subject[:command].should == :quack }
    end
  end
end
