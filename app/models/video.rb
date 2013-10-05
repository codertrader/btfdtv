class Video < ActiveRecord::Base
  belongs_to :stream
  acts_as_ordered_taggable
end
