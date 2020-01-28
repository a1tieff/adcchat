class Step < ApplicationRecord
  has_many :replicas
  has_many :answers
end
