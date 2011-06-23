require 'spec_helper'

describe AppsController do
  context "delete app" do
    self::APP = "zenslap"
    
    before do
      @account = Account.make!
      Account.stubs(:find).with(@account.id).returns(@account)
      @account.stubs(:destroy_app)
      delete :destroy, :account_id => @account.id, :id => APP      
    end
    
    it "should delete app from heroku account" do
      @account.should have_received(:destroy_app).with(APP)
    end
    
    it { should redirect_to(account_path(@account)) }
    
    it "should notify user that app has been destroyed" do
      flash[:notice].should == "Destroyed #{APP}"
    end
  end
end