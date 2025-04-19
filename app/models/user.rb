class User < ApplicationRecord
    has_many :task
    has_many :participants
    has_many :note

    validates :email, presence: true, uniqueness: true

    def accesible_tasks
        Task.(owner: User.id)
    end
end
