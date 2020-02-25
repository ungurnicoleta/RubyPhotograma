class User < ApplicationRecord
  has_many :photo_projects
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable
  # self.skip_session_storage = [:http_auth, :params_auth]
  devise :database_authenticatable,
           :jwt_authenticatable, jwt_revocation_strategy: JwtBlacklist
  self.skip_session_storage = [:http_auth, :params_auth]
end
