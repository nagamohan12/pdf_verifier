class User < ActiveRecord::Base
	ROLES = [:registered, :admin]
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
				 :recoverable, :rememberable, :trackable, :validatable

	belongs_to :organization
	validates_presence_of :organization_id

	def admin?
    self.try(:role) == 'admin'
  end

  def super_admin?
    self.try(:role) == 'super_admin'
  end
end
