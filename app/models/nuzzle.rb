class Nuzzle < ApplicationRecord
  belongs_to :animal
  belongs_to :owner, class_name: "User"

end
