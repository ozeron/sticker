module VK
  class WallPost < ActiveRecord::Base
    validates :date, :text, presence: true
  end
end
