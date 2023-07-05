class Category < ApplicationRecord
    has_many :tasks

    before_destroy :view_tasks

    validates :name, :description, presence: true
    validates :name, uniqueness: { case_insensitive: false }

    private

    def view_tasks
        if tasks.any?
            errors.add(:base, 'You can destroy this category,has associated tasks.')
            throw :abort
        end
    end  
end
