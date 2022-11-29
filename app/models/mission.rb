class Mission < ApplicationRecord
  belongs_to :planet
  belongs_to :scientist

  # validates_presence_of :name, :scientist_id, :planet_id
  # validates :scientist_id, uniqueness: true

  validates :name, presence: true
  validates :scientist, uniqueness: { scope: :name }
end
