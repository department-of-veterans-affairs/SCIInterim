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
    "Assisted living" => 3,
    "Nursing home" => 4,
    "Shelter" => 5,
    "Group Home" => 6,
    "Board and Care" => 7
  }
end
