class ContactsController < ApplicationController
  before_action :set_contacts, except: [:index, :new, :create]
  before_action :authenticate_user!

  def index
    @contacts = Contact.all
  end

  def new
    @contact = current_user.contacts.new
  end

  def edit
  end

  def create
    @contact = current_user.contacts.new(contacts_params)
    if @contact.save
      flash[:success] = "Contact created."
      redirect_to contacts_path
    else
      render 'new'
    end
  end

  def update
  end

  def destroy
  end

  private
  def set_contacts
    @contact = Contact.find(params[:id])
  end

  def contacts_params
    params.require(:contact).permit(:full_name, :email, :phone_number, :job_title)
  end

  

end
