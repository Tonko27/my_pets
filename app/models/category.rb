class Category < ActiveHash::Base
  # Active hashによる疑似モデル
  self.data = [
    { id: 1, name: '犬' }, { id: 2, name: '猫' }, { id: 3, name: '小動物' },
    { id: 4, name: '魚' }, { id: 5, name: '鳥' }, { id: 6, name: '爬虫類' },
    { id: 7, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :pets
end
