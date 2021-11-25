class EmailsController < ApplicationController
  def index
    @emails = Email.all.sort 

  end

  def create
    @email = Email.new(object: Faker::Games::Witcher.quote, body: Faker::Lorem.paragraph)
    if @email.save
      respond_to do |format|
        format.html {redirect_to root_path}
        format.js {}
      end
    else
      redirect_to root_path
      flash[:notice] = "Please try again"
    end
  end

  def show
    puts  params
    @emails = Email.all
    @email = Email.find(params[:id])
    @email.update(read: true)
    respond_to do |format|
      format.html {redirect_to root_path}
      format.js {}
    end
  end 


  def destroy
    @email = Email.find(params[:id])
    respond_to do |format|
      format.html {redirect_to root_path}
      format.js {}
    end
    @email.destroy  

  end



  def update
    @email = Email.find(params[:id])
    @email.update(read: false)
    respond_to do |format|
      format.html {redirect_to root_path}
      format.js {}
    end
  end
end
