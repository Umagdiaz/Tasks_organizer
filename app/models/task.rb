class Task < ApplicationRecord
  belongs_to :category

  validates :name, :description, presence: true
  validates :name, uniqueness: { case_insensitive: false }
  validate :due_date_validay

  def due_date_validay
    return if due_date.blank?
    return if due_date >= Date.today
    errors.add :due_date
  end


end
