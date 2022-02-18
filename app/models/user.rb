class User < ApplicationRecord
  validates :firstName, presence: true;
  validates :lastName, presence: true;
  validates :userName, presence: true, uniqueness: { case_sensitive: false };
  validates :email, presence: true, uniqueness: { case_sensitive: false };
  validates :password, presence: true;

  belongs_to :country
end
