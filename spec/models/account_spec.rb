require File.dirname(__FILE__) + '/../spec_helper'

describe Account do
  self::APPS = [["twitter", "mark@twitter.com"]]
    
  it{ should validate_presence_of(:email) }  
  it{ should validate_presence_of(:password) }    
  
  it "should have heroku accounts" do
    Heroku::Client.any_instance.stubs(:list).returns(APPS)
    account = Account.new :email => "jim@bongo.com", :password => "password"
    account.apps.should == APPS
  end
end
