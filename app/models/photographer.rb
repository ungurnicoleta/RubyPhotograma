class Photographer < ApplicationRecord
  rolify
  belongs_to :user
  belongs_to :address
end
