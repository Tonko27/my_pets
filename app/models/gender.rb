class Gender < ActiveHash::Base
  # Active hashによる疑似モデル
  self.data = [
    { id: 1, name: '男の子' }, { id: 2, name: '女の子' }
  ]

  include ActiveHash::Associations
  has_many :pets
end
