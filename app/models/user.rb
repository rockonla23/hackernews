class User < ActiveRecord::Base
  # Remember to create a migration!

  has_many :posts
  has_many :comments

  validates_uniqueness_of :email
  validates :password, :email, :username, presence: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
  validates :username, length: { minimum: 5 }

  def self.authenticate(email, password)
    # if email and password correspond to a valid user, return that user
    # otherwise, return nil
    user = self.where email: email #find_by can't use count
    if user.count != 0
      if user[0].password == password
        return user[0]
      end
    end
    return nil
  end
end
