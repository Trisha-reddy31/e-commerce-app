require 'active_merchant'
class GalleryController < ApplicationController
  def index
    @toy_gallery=Toystore.all

  end
  def search
    word = '%' + params[:keyword] + '%'
    @search_results = Toystore.where("name LIKE ?", "%#{params[:keyword]}%")

  end




  def checkout
    amount_to_charge = session[:amount].to_i
    if request.post?
      ActiveMerchant::Billing::Base.mode = :test
      # ActiveMerchant accepts all amounts as Integer values in cents
      credit_card = ActiveMerchant::Billing::CreditCard.new(
      :first_name         => params[:first_name],
      :last_name          => params[:last_name],
      :number             => params[:credit_card_no].to_i,
      :month              => params[:check][:month].to_i,
      :year               => params[:check][:year].to_i,
      :verification_value => params[:verification_number].to_i)
  
      # Validating the card automatically detects the card type
      gateway =ActiveMerchant::Billing::TrustCommerceGateway.new(
      :login => 'TestMerchant',
      :password =>'password',
      :test => 'true' )
  
      response = gateway.authorize(amount_to_charge , credit_card)
      #response = gateway.purchase(amount_to_charge, credit_card)
      puts response.inspect
        if response.success?
          gateway.capture(amount_to_charge, response.authorization)
          #UserNotifier.purchase_complete(session[:user],current_cart).deliver
          #flash[:notice]="Thank You for using Pink Flowers. The oreder details are sent to your mail"
          session[:cart_id]=nil
          session[:amount]=nil
          redirect_to :action=>:purchase
        else
          flash[:notice]= "Something went wrong.Try again"
          render :action => "checkout",status: :unprocessable_entity 
        end
      end
     end
    end