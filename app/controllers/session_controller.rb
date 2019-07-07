class SessionController < ApplicationController
  def new
    
  end
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      #ユーザーログイン後にユーザー情報のページにリダイレクトする
      log_in user
      params[:session][:remember_me] == '1' ? remember_user(user) : forget(user)
      redirect_back_or user
    else
      #エラーメッセージを作成する
      flash.now[:danger] = 'invalid email/password combination'
      render 'new'
    end
  end
  def destoroy
    log_out if logged_in?
    redirect_to root_url
  end
end
