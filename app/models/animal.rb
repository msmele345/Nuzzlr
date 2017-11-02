class Animal < ApplicationRecord
  belongs_to :uploaded_owner, class_name: "User"
  has_many :nuzzles
  has_many :owners, through: :nuzzles




  def total_nuzzles
    self.nuzzles.map { |nuzzle| nuzzle.nuzzle_count }
  end

  def nuzzle_count
    total_nuzzles.reduce(0, :+)
  end
end
