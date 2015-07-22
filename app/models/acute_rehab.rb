class AcuteRehab < ActiveRecord::Base
  acts_as :episode_of_care
  has_many :transfers, dependent: :destroy

  has_one :start_asia_assessment, class_name: 'Asia', as: :has_asia
  accepts_nested_attributes_for :start_asia_assessment
  validates_associated :start_asia_assessment

  has_one :finish_asia_assessment, class_name: 'Asia', as: :has_asia
  accepts_nested_attributes_for :finish_asia_assessment
  validates_associated :finish_asia_assessment

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
