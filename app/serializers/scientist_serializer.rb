class ScientistSerializer < ActiveModel::Serializer
  attributes :id, :name, :field_of_study, :avatar
  # has_many :planets
  # ^^^ THIS RELATIONSHIP MOVED TO THE CUSTOM SERIALIZER
  # WE LEAVE IT OUT HERE SO '/scientists' ONLY SHOWS SCIENTIST DATA
end
