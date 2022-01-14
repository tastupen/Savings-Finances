class Salary < ApplicationRecord
  belongs_to :user, optional: true
  validates :annual_income, presence: true
  validates :bonus, presence: true
  validates :rent, presence: true
end
