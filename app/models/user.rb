class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
          enum role: [:salesrep, :admin, :manager]
          after_initialize :set_default_role, :if => :new_record?
          def set_default_role
            if self.email == 'safiorganics1@gmail.com'
              self.role ||= :admin
            elsif self.email == 'joycekamande54@gmail.com'
              self.role ||= :manager
            else
              self.role ||= :salesrep
            end
          end
          has_many :agrovets
          
          validates :firstname, presence: true, uniqueness: { case_sensitive: false }, length: {maximum: 20}
          validates :lastname, presence: true, uniqueness: { case_sensitive: false }, length: {maximum: 20}   
          
          def sign_in 
            user = User.find_by(email: params[:email])
          
            if user && user.valid_password?(params[:password])
              sign_in_user(user) # Your sign-in method
          
              if user.email == 'joycekamande54@gmail.com'
                redirect_to pages_manager_path
              elsif user.email == 'safiorganics1@gmail.com'
                redirect_to pages_admin_path
              else
                redirect_to pages_salesrep_path
              end
            else
              # Handle invalid login
            end
          end
end
