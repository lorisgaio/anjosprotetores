class Animal < ApplicationRecord
  belongs_to :tutor, optional: true
  enum gender: [:macho, :femea]
end
