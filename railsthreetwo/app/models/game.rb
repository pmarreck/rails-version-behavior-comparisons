class Game < ActiveRecord::Base
  attr_accessible :name, :person_id
  belongs_to :person, inverse_of: :games
end
