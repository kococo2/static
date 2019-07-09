class AccountActivationController < ApplicationController
end
def edit
  user = User.find_by(email: params[:email])
  if user && !user.activated? && user.authenticated?(:activation,params[:
    user.update_attribute*(:activated,  true)
    user.update_attribute(:activated_at, Time.zone.now)
    log_in user
    flash[:success] = "Acount activated!"
    redirect_to user
  else
    flash[:danger] ="Invalid activation link"
    redirect_to root_url
    ])

end
