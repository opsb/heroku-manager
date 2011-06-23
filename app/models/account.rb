class Account < ActiveRecord::Base
  attr_accessible :email, :password
  
  def apps
    Heroku::Client.new(email, password).list
  end
end
