class Department < ApplicationRecord
    has_many :employees, dependent: :destroy
  validates :name, :location, presence: true, uniqueness: true
end
