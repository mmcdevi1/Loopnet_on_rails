class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :contacts
	has_many :image_galleries, :dependent => :destroy
	has_many :important_docs, :dependent => :destroy
	has_many :deals
  has_many :conversations, :foreign_key => :sender_id
  has_many :important_dates, :dependent => :destroy
end
