class EmailsController < ApplicationController
  before_action :authenticate_user!

  def create
    @email = Email.create(
      object: Faker::Games::Pokemon.name,
      body: Faker::TvShows::HowIMetYourMother.quote)

    respond_to do |format|
      format.html { redirect_to root_path}
      format.js {}
    end
    flash[:notice] = "Email created"
    
  end

  def show
   
    @email = Email.find(params[:id])
      
      respond_to do |format|
        format.html {redirect_to emails_path}
        format.js {}
      end
  end 



  def edit
    @email = Email.find(params[:id])
  end

  def update
    @email = Email.find(params[:id])
    @email.update(email_params)
    redirect_to emails_path
    flash[:notice] = "Email edited"
  end

  def index
    @emails = Email.all
  end

  def destroy
    @email = Email.find(params[:id])
    @email.destroy

    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
    end
   
  end


  private

  def email_params
    params.permit(:object, :body)
  end


end
