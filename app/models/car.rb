class Car < ApplicationRecord

  validates :name, presence: true

  belongs_to :user

  def user_text
    return self.user.name if self.user
  end

  def as_json(options={})
    options[:methods] = [:user_text]
    super
  end

end
