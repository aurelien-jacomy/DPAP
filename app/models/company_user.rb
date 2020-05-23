class CompanyUser < ApplicationRecord
  belongs_to :company
  belongs_to :user

  validates :user_id, uniquiness: true

  enum role: [:admin, :standard]
  enum status: [:pending, :active, :inactive]
end
