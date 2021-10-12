class PetComment < ApplicationRecord
  belongs_to :customer#会員モデルに紐づけ
  belongs_to :pet#ペットモデルに紐づけ
end
