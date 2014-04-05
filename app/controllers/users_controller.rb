class UsersController < ApplicationController
  # GET /users/new
  def new
    @user = User.new
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    @user.set_confirmation_token

    message =  if @user.save
      { notice: 'Te hemos añadido a la lista. Recibirás un correo de confirmación en unos minutos.' }
    else
      { alert: 'Tio, no podemos registrate. Si te habias registrado pero no has recibido el correo de confirmación, tienes un enlace para eso justo debajo.' }
    end
    
    redirect_to root_url, message
  end
  
  def confirm
    @user = User.find_by_confirmation_token params[:confirmation_token]
    @user.update_attribute(:confirmed_at, Time.now)
    redirect_to root_url, notice: 'Correo confirmado, shur. Te avisaremos cuando el registro de FC esté abierto.'
  end

  def resend_confirmation
    @user = User.find_by_email params[:user][:email]
    message =  if @user
      UserMailer.send_confirmation(@user)
      { notice: 'Recibirás un correo de confirmación en unos minutos, shur.' }
    else
      { alert: 'No cuela, no estás registrado, shur.' }
    end

    redirect_to root_url, message
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email)
    end
end
