class Game < ActiveRecord::Base
  belongs_to :person, inverse_of: :games
end
