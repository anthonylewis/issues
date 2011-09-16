class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, 
    :remember_me, :username, :role

  ROLES = ['admin', 'moderator', 'user']

  has_many :issues
  has_many :notes
  has_many :assigned_issues, :class_name => "Issue",
    :foreign_key => "assignee_id"
end
