class Car < ApplicationRecord

  validates :name, presence: true

   belongs_to :user
  #attr_accessor :password

  def user_text
     return self.user.name if self.user
  end
end
