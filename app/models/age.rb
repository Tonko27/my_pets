class Age < ActiveHash::Base
  self.data = [
    { id: 1, name: '1 才' }, { id: 2, name: '2 才' }, { id: 3, name: '3 才' },
    { id: 4, name: '4 才' }, { id: 5, name: '5 才' }, { id: 6, name: '6 才' },
    { id: 7, name: '7 才' }, { id: 8, name: '8 才' }, { id: 9, name: '9 才' },
    { id: 10, name: '10 才' }, { id: 11, name: '11 才' }, { id: 12, name: '12 才' },
    { id: 13, name: '13 才' }, { id: 14, name: '14 才' }, { id: 15, name: '15 才' },
    { id: 16, name: '16 才' }, { id: 17, name: '17 才' }, { id: 18, name: '18 才' },
    { id: 19, name: '19 才' }, { id: 20, name: '20 才以上' }
  ]

  include ActiveHash::Associations
  has_many :pets
end
