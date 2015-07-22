class Asia < ActiveRecord::Base
  belongs_to :has_asia, polymorphic: true

  enum classification: { 'A' => 1, 'B' => 2, 'C' => 3, 'D' => 4 }
  LEVEL_OF_INJURIES = {
      "" => 0,
      "C2" => 1,
      "C3" => 2,
      "C4" => 3,
      "C5" => 4,
      "C6" => 5,
      "C7" => 6,
      "C8" => 7,
      "T1" => 8,
      "T2" => 9,
      "T3" => 10,
      "T4" => 11,
      "T5" => 12,
      "T6" => 13,
      "T7" => 14,
      "T8" => 15,
      "T9" => 16,
      "T10" => 17,
      "T11" => 18,
      "T12" => 19,
      "L1" => 20,
      "L2" => 21,
      "L3" => 22,
      "L4" => 23,
      "L5" => 24,
      "S1" => 25,
      "S2" => 26,
      "S3" => 27,
      "S4-5" => 28
    }
  LEVEL_OF_INJURIES_INVERT = LEVEL_OF_INJURIES.invert

  def self.level_of_injuries
    LEVEL_OF_INJURIES
  end

  def level_of_injury_to_int(value)
    raise "Invalid Level of Injury" unless LEVEL_OF_INJURIES.has_key?(value)
    LEVEL_OF_INJURIES[value]
  end

  def int_to_level_of_injury(value)
    return nil if value.nil?
    raise "Invalid Level of Injury" unless LEVEL_OF_INJURIES_INVERT.has_key?(value)
    LEVEL_OF_INJURIES_INVERT[value]
  end

  def neurological_sensory_level_left
    int_to_level_of_injury(read_attribute(:neurological_sensory_level_left))
  end
  def neurological_sensory_level_left=(value)
    write_attribute(:neurological_sensory_level_left, level_of_injury_to_int(value))
  end

  def neurological_sensory_level_right
    int_to_level_of_injury(read_attribute(:neurological_sensory_level_right))
  end
  def neurological_sensory_level_right=(value)
    write_attribute(:neurological_sensory_level_right, level_of_injury_to_int(value))
  end

  def neurological_motor_level_left
    int_to_level_of_injury(read_attribute(:neurological_motor_level_left))
  end
  def neurological_motor_level_left=(value)
    write_attribute(:neurological_motor_level_left, level_of_injury_to_int(value))
  end

  def neurological_motor_level_right
    int_to_level_of_injury(read_attribute(:neurological_motor_level_right))
  end
  def neurological_motor_level_right=(value)
    write_attribute(:neurological_motor_level_right, level_of_injury_to_int(value))
  end

  def preservation_sensory_left
    int_to_level_of_injury(read_attribute(:preservation_sensory_left))
  end
  def preservation_sensory_left=(value)
    write_attribute(:preservation_sensory_left, level_of_injury_to_int(value))
  end

  def preservation_sensory_right
    int_to_level_of_injury(read_attribute(:preservation_sensory_right))
  end
  def preservation_sensory_right=(value)
    write_attribute(:preservation_sensory_right, level_of_injury_to_int(value))
  end

  def preservation_motor_left
    int_to_level_of_injury(read_attribute(:preservation_motor_left))
  end
  def preservation_motor_left=(value)
    write_attribute(:preservation_motor_left, level_of_injury_to_int(value))
  end

  def preservation_motor_right
    int_to_level_of_injury(read_attribute(:preservation_motor_right))
  end
  def preservation_motor_right=(value)
    write_attribute(:preservation_motor_right, level_of_injury_to_int(value))
  end

  validates_each(:neurological_sensory_level_left, :neurological_sensory_level_right,
                 :neurological_motor_level_left, :neurological_motor_level_right,
                 :preservation_sensory_left, :preservation_sensory_right,
                 :preservation_motor_left, :preservation_motor_right) do |record, attr, value|
    record.errors.add(attr, "Invalid Level of Injury") unless LEVEL_OF_INJURIES.has_key?(value)
  end

  validate :neurological_sensory_level_left, :ensure_symmetry
  validate :neurological_sensory_level_right, :ensure_symmetry
  validate :neurological_motor_level_left, :ensure_symmetry
  validate :neurological_motor_level_right, :ensure_symmetry
  validate :preservation_sensory_left, :ensure_symmetry
  validate :preservation_sensory_right, :ensure_symmetry
  validate :preservation_motor_left, :ensure_symmetry
  validate :preservation_motor_right, :ensure_symmetry

  def ensure_symmetry
    if !has_motor_or_sensory_asymmetry
      errors.add(:neurological_motor_level_right, "does not match left") unless neurological_motor_level_left == neurological_motor_level_right
      errors.add(:neurological_sensory_level_right, "does not match left") unless neurological_sensory_level_left == neurological_sensory_level_right
      errors.add(:preservation_motor_right, "does not match left") unless preservation_motor_left == preservation_motor_right
      errors.add(:preservation_sensory_right, "does not match left") unless preservation_sensory_left == preservation_sensory_right
    end
  end
  
end
