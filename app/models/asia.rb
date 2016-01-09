class Asia < ActiveRecord::Base
  include AttributeExportable

  belongs_to :neurological_sensory_level_left, class_name: Domain::LevelOfInjury
  belongs_to :neurological_sensory_level_right, class_name: Domain::LevelOfInjury
  belongs_to :neurological_motor_level_left, class_name: Domain::LevelOfInjury
  belongs_to :neurological_motor_level_right, class_name: Domain::LevelOfInjury
  belongs_to :preservation_sensory_level_left, class_name: Domain::LevelOfInjury
  belongs_to :preservation_sensory_level_right, class_name: Domain::LevelOfInjury
  belongs_to :preservation_motor_level_left, class_name: Domain::LevelOfInjury
  belongs_to :preservation_motor_level_right, class_name: Domain::LevelOfInjury
  belongs_to :impairment_scale, class_name: Domain::AsiaClassification

  validate :neurological_sensory_level_left, :ensure_symmetry
  validate :neurological_sensory_level_right, :ensure_symmetry
  validate :neurological_motor_level_left, :ensure_symmetry
  validate :neurological_motor_level_right, :ensure_symmetry
  validate :preservation_sensory_level_left, :ensure_symmetry
  validate :preservation_sensory_level_right, :ensure_symmetry
  validate :preservation_motor_level_left, :ensure_symmetry
  validate :preservation_motor_level_right, :ensure_symmetry

  def ensure_symmetry
    if !has_motor_or_sensory_asymmetry
      errors.add(:neurological_motor_level_right, "does not match left") unless neurological_motor_level_left == neurological_motor_level_right
      errors.add(:neurological_sensory_level_right, "does not match left") unless neurological_sensory_level_left == neurological_sensory_level_right
      errors.add(:preservation_motor_level_right, "does not match left") unless preservation_motor_level_left == preservation_motor_level_right
      errors.add(:preservation_sensory_level_right, "does not match left") unless preservation_sensory_level_left == preservation_sensory_level_right
    end
  end

  def motor_symmetry
    if neurological_motor_level_left.nil? && neurological_motor_level_right.nil?
      "No Prior Assessment"
    elsif neurological_motor_level_left.try(:name) == neurological_motor_level_right.try(:name)
      "Left/Right: #{neurological_motor_level_left.try(:name)}"
    else
      "Left: #{neurological_motor_level_left.try(:name)}, Right: #{neurological_motor_level_right.try(:name)}"
    end      
  end

  def sensory_symmetry
    if neurological_sensory_level_left.nil? && neurological_sensory_level_right.nil?
      "No Prior Assessment"
    elsif neurological_sensory_level_left.try(:name) == neurological_sensory_level_right.try(:name)
      "Left/Right: #{neurological_sensory_level_left.try(:name)}"
    else
      "Left: #{neurological_sensory_level_left.try(:name)}, Right: #{neurological_sensory_level_right.try(:name)}"
    end      
  end
end
