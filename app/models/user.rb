class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
	       :recoverable, :rememberable, :trackable, :validatable, :lockable, :timeoutable, :timeout_in => 30.minutes
	has_many :orders
	has_many :comments
end


