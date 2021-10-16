class Favorite < ApplicationRecord
  belongs_to :customer#会員モデルと紐づけ
  belongs_to :pet#ペットモデルと紐づけ

end
