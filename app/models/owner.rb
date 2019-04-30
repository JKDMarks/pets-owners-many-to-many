class Owner < ApplicationRecord
  has_many :pet_owners, dependent: :destroy
  has_many :pets, through: :pet_owners

  validates :first_name, presence: true, uniqueness: true
  validates :age, numericality: {greater_than_or_equal_to: 18}

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def self.petless_owners
    self.all.reload.select do |owner|
      owner.pets.reload.empty?
    end
  end
end
