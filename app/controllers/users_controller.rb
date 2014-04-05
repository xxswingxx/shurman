class UsersController < ApplicationController
  # GET /users/new
  def new
    @user = User.new
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to root_url, notice: 'Te hemos añadido a la lista. Recibirás un correo de confirmación en unos minutos' }
      else
        flash.now[:alert] = 'Tio, no podemos registrate. Si te habias registrado pero no has recibido el correo de confirmación, tienes un enlace para eso justo debajo.'
        format.html { render action: 'new' }
      end
    end
  end
  
  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email)
    end
end
