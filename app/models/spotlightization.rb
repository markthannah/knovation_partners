class Spotlightization < ActiveRecord::Base
  belongs_to :spotlight
  belongs_to :resource
end
