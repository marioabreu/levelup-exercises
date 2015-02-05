class User < ActiveRecord::Base
  has_many :meetings

  validates :name, presence: true, uniqueness: true

end
