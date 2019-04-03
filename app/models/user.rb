class User < ApplicationRecord
  has_many :orders
  validates :email, uniqueness: { case_sensitive: false }, presence: true,
                    format: { with: /\A([^@\s]+)@((?:[a-z0-9-]+\.)+[a-z]{2,})\z/i }
  validates :phone_number, length: { in: 9..12 }
  validates :password, presence: true, length: { in: 6..20 },
                       format: { with: /\A[a-zA-Z0-9]*\z//i }


end
