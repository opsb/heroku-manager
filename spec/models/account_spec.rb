require File.dirname(__FILE__) + '/../spec_helper'

describe Account do
  self::APPS = [["twitter", "mark@twitter.com"]]
  self::APP = "zenslap"  
    
  it{ should validate_presence_of(:email) }  
  it{ should validate_presence_of(:password) }    
  
  it "should have heroku accounts" do
    Heroku::Client.any_instance.stubs(:list).returns(APPS)
    account = Account.new :email => "jim@bongo.com", :password => "password"
    account.apps.should == APPS
  end
  
  it "should destroy a heroku app" do
    account = Account.new :email => "jim@bongo.com", :password => "password"    
    Heroku::Client.any_instance.stubs(:destroy)
    account.destroy_app(APP)
    Heroku::Client.any_instance.should have_received(:destroy).with(APP)
  end
end
