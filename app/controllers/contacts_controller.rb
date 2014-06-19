class ContactsController < ApplicationController
  def index
  	@contacts=Contact.all
  end
  def new
  end
  def create
     @contact = Contact.new(contact_params)

     @contact.save
     redirect_to @contact
  end
  def show
  	@contact = Contact.find(params[:id])
  end
  def edit
    @contact= Contact.find(params[:id])
  end
  def update
  	@contact=Contact.find(params[:id])

  	if@contact.update(contact_params)
  		redirect_to @contact
  	else
  		render 'new'
  	end
  end
  def destroy
  	@contact = Contact.find(params[:id])
  	@contact.destroy

  	redirect_to contacts_path
  end

  private
  def contact_params
  	params.require(:contact).permit(:firstname, :lastname, :email, :mobilenumber, :address)
  end
end
