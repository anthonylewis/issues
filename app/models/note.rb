class Note < ActiveRecord::Base
  belongs_to :issue
  belongs_to :user
end
