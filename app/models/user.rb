class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
          enum role: [:user, :admin, :manager]
          after_initialize :set_default_role, :if => :new_record?
          def set_default_role
            self.role ||= :user
          end
          has_many :agrovets
          
          validates :firstname, presence: true, uniqueness: { case_sensitive: false }, length: {maximum: 20}
          validates :lastname, presence: true, uniqueness: { case_sensitive: false }, length: {maximum: 20}   
          
          def sign_in
            # Your authentication logic to verify the user's identity (e.g., email and password)
            user = User.find_by(email: params[:email])
          
            if user && user.valid_password?(params[:password])
              sign_in_user(user) # Your sign-in method
          
              if user.manager?
                redirect_to pages_manager_path
              else
                redirect_to pages_salesrep_path
              end
            else
              # Handle invalid login
            end
          end
end
