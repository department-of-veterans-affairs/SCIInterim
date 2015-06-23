class AnnualEvaluation < ActiveRecord::Base
  acts_as :episode_of_care

  enum bladder_drainage_method: {
    'BA - Bladder Augmentation' => 1,
    'EC - Condom/External Catheter' => 2,
    'IC - Intermittent Catheterization' => 3,
    'IN - Indwelling Catheter' => 4,
    'IP - Ileal Pouch' => 5,
    'SC - Suprapubic Catheter' => 6,
    'SS - Surgical Stent' => 7,
    'VV - Voluntary Voiding' => 8
  }
  enum neuro_zone_of_preservation1: {
    'ML - Motor Left' => 1,
    'MR - Motor Right' => 2,
    'SL - Sensory Left' => 3,
    'SR - Sensory Right' => 4,
  }
  enum neuro_zone_of_preservation2: {
    'C - Cervical' => 1,
    'T - Thoracic' => 2,
    'L - Lumbar' => 3,
    'S - Sacral' => 4,
  }
end
