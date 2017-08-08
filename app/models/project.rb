class Project < ApplicationRecord
  belongs_to :user

  scope :filter_by_user, ->(user_id) { where user_id: user_id }
end