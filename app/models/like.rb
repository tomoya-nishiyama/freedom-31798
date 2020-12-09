class Like < ApplicationRecord
  belongs_to :origin
  belongs_to :user
  validates_uniqueness_of :origin_id, scope: :user_id
end
