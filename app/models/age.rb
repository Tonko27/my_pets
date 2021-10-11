class Age < ActiveHash::Base
  self.data = [
      {id: 1, name: '1才'}, {id: 2, name: '2才'}, {id: 3, name: '3才'},
      {id: 4, name: '4才'}, {id: 5, name: '5才'}, {id: 6, name: '6才'},
      {id: 7, name: '7才'}, {id: 8, name: '8才'}, {id: 9, name: '9才'},
      {id: 10, name: '10才'}, {id: 11, name: '11才'}, {id: 12, name: '12才'},
      {id: 13, name: '13才'}, {id: 14, name: '14才'}, {id: 15, name: '15才'},
      {id: 16, name: '16才'}, {id: 17, name: '17才'}, {id: 18, name: '18才'},
      {id: 19, name: '19才'}, {id: 20, name: '20才以上'}
  ]

  include ActiveHash::Associations
  has_many :pets
end