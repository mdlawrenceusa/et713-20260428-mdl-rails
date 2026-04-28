class Supplier < ApplicationRecord
      has_many :beans, dependent: :destroy
end
