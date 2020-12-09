class Category < ActiveHash::Base
  self.data = [
    { id: 0, name: 'カテゴリー' },
    { id: 1, name: 'ビジネス・経済' },
    { id: 2, name: '文学・評論' },
    { id: 3, name: '人文・思想' },
    { id: 4, name: '投資・金融・会社経営' },
    { id: 5, name: 'コンピュータ・IT' },
    { id: 6, name: 'コミック' },
    { id: 7, name: 'エンターテイメント' },
    { id: 8, name: '雑誌' },
    { id: 9, name: '趣味・実用' },
    { id: 10, name: 'ライトノベル' },
    { id: 11, name: '絵本・児童書' }
  ]

  include ActiveHash::Associations
  has_many :origins
end
