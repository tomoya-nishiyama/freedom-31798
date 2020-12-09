class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :origin, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_origins, through: :likes, source: :origin
  def liked_by?(origin)
    self.likes.exists?(origin_id: origin.id)
  end
         
  validates :name, presence: true
         
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'

  
end
