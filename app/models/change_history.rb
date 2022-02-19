class ChangeHistory < ApplicationRecord
  belongs_to :user
  belongs_to :vulnerability
end
