class Pet < ApplicationRecord
  has_many :pet_owners, dependent: :destroy
  has_many :owners, through: :pet_owners

  validates :name, presence: true
  validates :species, presence: true, inclusion: {in: ["dog", "cat", "bird"]}

  def self.ownerless_pets
    self.all.reload.select do |pet|
      pet.owners.reload.empty?
    end
  end
end
