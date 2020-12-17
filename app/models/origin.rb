class Origin < ApplicationRecord
  belongs_to :user
  has_many :likes, foreign_key: "origin_id", dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  def like_user(user_id)
    likes.find_by(user_id: user_id)
   end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  with_options presence: true do
    validates :book_title
    validates :text
    validates :category_id
  end

  with_options numericality: { other_than: 0 } do
    validates :category_id
    
  end

  def self.search(search)
    Origin.where('text LIKE(?)', "%#{search}%").or(Origin.where('book_title LIKE(?)', "%#{search}%"))
  end

  def self.csearch(category_id)
    Origin.where('category_id = ?', category_id)
  end

  def self.allsearch(category_id, search)
    Origin.where("(category_id = ?) AND ((text LIKE(?)) OR (book_title LIKE(?)))", "#{category_id}", "%#{search}%", "%#{search}%")
  end

end



# def self.search(search)
#   if search != ""
#     Origin.where('text LIKE(?)', "%#{search}%").or(Origin.where('book_title LIKE(?)', "%#{search}%").or(Origin.where('category_id LIKE(?)', "%#{search}%"))
#   elsif
#     Origin.all
#   end
# end