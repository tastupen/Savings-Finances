class Salary < ApplicationRecord
  validates :annual_income, presence: true
  validates :bonus, presence: true
  validates :rent, presence: true
end
