class User < ApplicationRecord
  validates :userName, presence: true, uniqueness: { case_sensitive: false };
  validates :firstName, presence: true;
  validates :firstName, presence: true;
  validates :email, presence: true, uniqueness: { case_sensitive: false };
  validates :password, presence: true;
end
