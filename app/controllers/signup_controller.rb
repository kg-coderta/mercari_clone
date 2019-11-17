class SignupController < ApplicationController
  # before_action :authenticate_user!, except: :step1
  before_action :redirect_to_top, only: :step1
  before_action :set_category


  def step1
    @user = User.new
  end  

  def step2
    session[:nickname]                = user_params[:nickname]
    session[:email]                   = user_params[:email]
    session[:password]                = user_params[:password]
    session[:password_confirmation]   = user_params[:password_confirmation]
    session[:last_name]               = user_params[:last_name]
    session[:first_name]              = user_params[:first_name]
    session[:last_name_kana]          = user_params[:last_name_kana]
    session[:first_name_kana]         = user_params[:first_name_kana]
    session[:birth_year_id]           = user_params[:birth_year_id]
    session[:birth_month_id]          = user_params[:birth_month_id]
    session[:birth_day_id]            = user_params[:birth_day_id]
  end
  
  def step3
    @address = Address.new
  end
    
  def step4
    session[:postal_code]             = address_params[:postal_code]
    session[:prefecture_id]           = address_params[:prefecture_id]
    session[:city]                    = address_params[:city]
    session[:house_number]            = address_params[:house_number]
    session[:building_name]           = address_params[:building_name]
    session[:phone_number]            = address_params[:phone_number]

    # @card = Card.new
  end

  def create
    @user = User.new(
    nickname:              session[:nickname], 
    email:                 session[:email], 
    password:              session[:password], 
    password_confirmation: session[:password_confirmation], 
    last_name:             session[:last_name], 
    first_name:            session[:first_name], 
    last_name_kana:        session[:last_name_kana], 
    first_name_kana:       session[:first_name_kana], 
    birth_year_id:         session[:birth_year_id],
    birth_month_id:        session[:birth_month_id],
    birth_day_id:          session[:birth_day_id]
    )
    if @user.save
      @address = Address.create(
        user_id:               @user.id,
        postal_code:           session[:postal_code],
        prefecture_id:         session[:prefecture_id],  
        city:                  session[:city], 
        house_number:          session[:house_number], 
        building_name:         session[:building_name], 
        phone_number:          session[:phone_number],
      )
      session[:id] = @user.id
      redirect_to done_signup_index_path
    else
      redirect_to users_index_path  
    end

    def done
      sign_in User.find(session[:id]) unless user_signed_in?
    end
  end 
  
  
  private

  def user_params
    params.require(:user).permit(
      :nickname,:email,:password,:password_confirmation,
      :last_name, :first_name, :last_name_kana, :first_name_kana,
      :birth_year_id, :birth_month_id, :birth_day_id
    )
  end
  
  def address_params
    params.require(:address).permit(
      :postal_code,:prefecture_id,:city,
      :house_number,:building_name,:phone_number,
    )
  end

  def redirect_to_top
    redirect_to controller: 'items', action: 'index' if user_signed_in?
  end  
end
