class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
  has_many :clock_records

  attr_writer :login
  attr_accessor :skip_password_validation

  def login
    @login || self.name || self.email
  end

  protected

  def password_required?
    return false if skip_password_validation
    super
  end

end
