class SignupController < ApplicationController
  # before_action :authenticate_user!, except: :step1
  before_action :redirect_to_top, only: :step1

  def step1
    @user = User.new(
      uid: session[:uid],
      provider: session[:provider],
      email: session[:email]
      )
  end 

  def step2
    unless verify_recaptcha(model: @user)
      redirect_to step1_signup_index_path
    end  
    
    if user_params[:password] == nil
      session[:nickname]                = user_params[:nickname]
      session[:email]                   = user_params[:email]
      session[:last_name]               = user_params[:last_name]
      session[:first_name]              = user_params[:first_name]
      session[:last_name_kana]          = user_params[:last_name_kana]
      session[:first_name_kana]         = user_params[:first_name_kana]
      session[:birth_year_id]           = user_params[:birth_year_id]
      session[:birth_month_id]          = user_params[:birth_month_id]
      session[:birth_day_id]            = user_params[:birth_day_id]
      session[:password]                = Devise.friendly_token[0, 20]
      session[:password_confirmation]   = session[:password]
    else
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
    @card = Card.new
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
    birth_day_id:          session[:birth_day_id],
    uid:                   session[:uid],
    provider:              session[:provider],
    password:              session[:password],
    password_confirmation: session[:password_confirmation]
    )
    if @user.save
      @address = Address.create( 
        user_id:               @user.id,
        postal_code:           session[:postal_code],
        prefecture_id:         session[:prefecture_id],  
        city:                  session[:city], 
        house_number:          session[:house_number], 
        building_name:         session[:building_name], 
        phone_number:          session[:phone_number]
      )
      if @address.save
        Payjp.api_key = 'sk_test_5d0971e062081646be8df08b'
        customer = Payjp::Customer.create(
          card: params['payjp-token']
          )
        @card = Card.new(user_id: @user.id, customer_id: customer.id, card_id: customer.default_card)
        session[:id] = @user.id
        if @card.save
          redirect_to done_signup_index_path
        else
          @user.destroy
          @address.destroy
          redirect_to step4_signup_path
        end
      else
        @user.destroy
        redirect_to step3_signup_index_path
      end
    else
      redirect_to step1_signup_index_path  
    end
  end

  def done
    sign_in User.find(session[:id]) unless user_signed_in?
  end

  private

  def user_params
    params.require(:user).permit(
      :nickname,:email,:password,:password_confirmation,
      :last_name, :first_name, :last_name_kana, :first_name_kana,
      :birth_year_id, :birth_month_id, :birth_day_id, :uid, :provider
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
