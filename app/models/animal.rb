class Animal < ApplicationRecord
  belongs_to :tutor, optional: true
end
