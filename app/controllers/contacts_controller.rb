class ContactsController < ApplicationController

  def index
  	@contacts = Contact.all
  end

  def new
  	@contact = Contact.new
  end

  def create
     @contact = Contact.new(contact_params)
     
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
    CustomerSupport.customer_support(@contact).deliver
  end

  def edit
    @contact= Contact.find(params[:id])
  end

  def search
    @contacts = Contact.where("firstname LIKE ? or lastname LIKE ?", "#{params[:firstname]}%", "#{params[:firstname]}%")
    render json: @contacts.as_json 
  end

  def searchresults
    @contacts = Contact.where(firstname: "#{params[:firstname]}" )
  end

  def male
    @contacts = Contact.where(gender: "Male")
    render 'male'
  end

  def female
    @contacts = Contact.where(gender:  "Female")
   render 'female'
  end

  def update
  	@contact=Contact.find(params[:id])
        name=params[:contact][:photo].original_filename
        @contact.update(:photo => name)

  	if @contact.update(contact_params)
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
    params.require(:contact).permit(:firstname, :lastname, :email, :mobilenumber, :address, :gender)
  end

end
