class Tour < ApplicationRecord
  # Direct associations

  has_many   :locations,
             :dependent => :destroy

  belongs_to :user

  # Indirect associations

  # Validations

end
