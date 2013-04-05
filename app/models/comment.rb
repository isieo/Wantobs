class Comment < ActiveRecord::Base
  attr_accessible :comment, :user_id, :wtb_id, :wts_id
  belongs_to :user
  belongs_to :wtb
  belongs_to :wts
end
