class Stream < ActiveRecord::Base

  has_many :attachments

  has_many :videos

end
