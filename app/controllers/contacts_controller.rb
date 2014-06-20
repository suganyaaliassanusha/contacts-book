class ContactsController < ApplicationController
  def index
  	@contacts=Contact.all
  end
  def new
  end
  def create
     @contact = Contact.new(contact_params)
     puts params[:contact][:photo]
      name=params[:contact][:photo].original_filename
       @contact.photo = name
       if @contact.save
         @contact.update(:photo => name)
         redirect_to @contact
       else
          render 'new'
        end
   end
  def show
  	@contact = Contact.find(params[:id])
  end
  def edit
    @contact= Contact.find(params[:id])
  end
  def update
  	@contact=Contact.find(params[:id])
        name=params[:contact][:photo].original_filename
        @contact.update(:photo => name)

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

  def fullname
    name=params[:contact][:photo].original_filename
    directory= "public/data"
     return path = File.join(directory,name)
  end
  def contact_params
    File.open(fullname, "wb") { |f| f.write(params[:contact][:photo].read) }
    params.require(:contact).permit(:firstname, :lastname, :email, :mobilenumber, :address, :photo)
  end
end
