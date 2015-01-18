class ContactsController < ApplicationController
  before_action :set_contacts, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @contacts = current_user.contacts.all
  end

  def new
    @contact = current_user.contacts.new
    if flash[:success]
      flash[:success] = "Contact created."
      redirect_to contacts_path
    end
  end

  def edit
  end

  def show
    redirect_to contacts_path
  end

  def create
    @contact = current_user.contacts.new(contacts_params)
    if @contact.save
      flash[:success] = "Contact created."
      redirect_to :back
    else
      render 'new'
    end
  end

  def update
    if @contact.update_attributes(contacts_params)
      flash[:success] = "Contact updated."
      redirect_to contacts_path
    else
      render 'edit'
    end
  end

  def destroy
    @contact.destroy
    flash[:success] = "Contact deleted."
    redirect_to :back
  end

  private
  def set_contacts
    @contact = Contact.find(params[:id])
  end

  def contacts_params
    params.require(:contact).permit(:full_name, :email, :phone_number, :job_title, :company)
  end

  def correct_user
    @contact = Contact.find(params[:id])
    unless current_user == @contact.user
      redirect_to root_path
      flash[:danger] = "You can't do that."
    end
  end     

end
