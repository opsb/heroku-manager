class AppsController < ApplicationController
  def destroy
    account = Account.find(params[:account_id])
    account.destroy_app(params[:id])
    redirect_to account_path(account), :notice => "Destroyed #{params[:id]}"
  end
end