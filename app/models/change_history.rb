class ChangeHistory < ApplicationRecord
  belongs_to :user
  belongs_to :vulnerability

  enum status: {identified:1, being_analyzed:2, fixed:3}
end
