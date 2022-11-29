class Scientist < ApplicationRecord
    has_many :missions
    has_many :planets, through: :missions

    validates_presence_of :name, :field_of_study
    validates :name, uniqueness: true
end
