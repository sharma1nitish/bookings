class Hall < ApplicationRecord
  has_many :tables, dependent: :destroy
end
