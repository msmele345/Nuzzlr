class Animal < ApplicationRecord
  belongs_to :uploaded_owner, class_name: "User"
  has_many :nuzzles
  has_many :owners, through: :nuzzles
end
