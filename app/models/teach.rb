class Teach < ApplicationRecord
  belongs_to :lecturer
  belongs_to :course
end
