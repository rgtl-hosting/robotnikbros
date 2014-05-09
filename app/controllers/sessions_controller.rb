class SessionsController < ApplicationController

  before_filter :except => [:destroy] {|c| c.redirect_to root_path if c.current_user }


  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to :back
    else
      flash.now[:error] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to :back
  end


end
