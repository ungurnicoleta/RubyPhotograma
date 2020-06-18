class Appointment < ApplicationRecord
  belongs_to :photographer, foreign_key: 'photographer_id', class_name: 'Photographer'
  belongs_to :user, foreign_key: 'user_id', class_name: 'User'
end
