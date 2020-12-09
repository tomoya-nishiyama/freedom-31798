class Origin < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :liked_users, through: :likes, source: :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

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