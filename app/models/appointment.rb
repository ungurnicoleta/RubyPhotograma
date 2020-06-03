class Appointment < ApplicationRecord
  belongs_to :photographer
  belongs_to :user
end
