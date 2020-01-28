class NextStep < ApplicationRecord
  belongs_to :step
  belongs_to :answer
end
