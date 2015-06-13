class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :appointments
  has_many :businesses, through: :appointments
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
