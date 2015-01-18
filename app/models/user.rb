class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :firstname, presence: true
  validates :lastname,  presence: true
  validates :username,  presence: true, uniqueness: true
  validates :email,     presence: true,
                        uniqueness: true,
                        format: {
                          with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9\.-]+\.[A-Za-z]+\Z/
                        }
  validates :password,   presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
                         
  has_many :contacts
	has_many :image_galleries, :dependent => :destroy
	has_many :important_docs, :dependent => :destroy
	has_many :deals
  has_many :conversations, :foreign_key => :sender_id
  has_many :important_dates, :dependent => :destroy
  has_many :add_to_pipelines, :dependent => :destroy
  
end
