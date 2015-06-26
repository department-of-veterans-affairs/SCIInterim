class AcuteRehab < ActiveRecord::Base
  acts_as :episode_of_care
  has_many :transfers, dependent: :destroy

  enum reason_for_admission: {
    "Newly injured" => 1,
    "Deconditioned" => 2,
    "Transition to home" => 3,
    "Other" => 4
  }

  enum residence_type: {
    "Own" => 1,
    "Rent" => 2,
    "Homeless" => 3,
    "Assisted living" => 4,
    "Nursing home" => 5,
    "Shelter" => 6,
    "Group Home" => 7,
    "Board and Care" => 8,
  }
end
