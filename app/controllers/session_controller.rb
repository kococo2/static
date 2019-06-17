class SessionController < ApplicationController
  def new

  end
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      #ユーザーログイン後にユーザー情報のページにリダイレクトする
      log_in user
      redirect_to user
    else
      #エラーメッセージを作成する
      flash.now[:danger] = 'inalid email/password combination'
      render 'new'
    end
  end
  def destoroy
    log_out
    redirect_to root_url
  end
end
