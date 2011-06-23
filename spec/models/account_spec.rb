require File.dirname(__FILE__) + '/../spec_helper'

describe Account do
  self::APPS = [["twitter", "mark@twitter.com"]]
    
  it "should be valid" do
    Account.new.should be_valid
  end
  
  it "should have heroku accounts" do
    Heroku::Client.any_instance.stubs(:list).returns(APPS)
    account = Account.new :email => "jim@bongo.com", :password => "password"
    account.apps.should == APPS
  end
end
