class Bean < ApplicationRecord
  belongs_to :supplier
    self.inheritance_column = :_type_disabled
end
