class Request < ActiveRecord::Base
  belongs_to :user

  has_many :offers

  paginates_per 2
end
