class Country < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false };
  validates :alpha2_code, presence: true, length: { is: 2 }
  validates :alpha3_code, presence: true, length: { is: 3 }
end
