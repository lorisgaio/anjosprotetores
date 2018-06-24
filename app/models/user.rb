class User < ApplicationRecord
  enum kind: [:helper, :manager]
  enum status: [:active, :inactive]
end
