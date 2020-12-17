class Like < ApplicationRecord
  belongs_to :origin, optional: true
  belongs_to :user, optional: true
  validates_uniqueness_of :origin_id, scope: :user_id
end
