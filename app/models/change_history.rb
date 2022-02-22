class ChangeHistory < ApplicationRecord
  belongs_to :user
  belongs_to :vulnerability, -> { with_deleted }

  enum vulnerability_status: {identified:1, being_analyzed:2, fixed:3, deleted:4}
end
