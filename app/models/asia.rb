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

  has_one :patient 
  before_save :ensure_symmetry

  # validate :neurological_sensory_level_left, :ensure_symmetry
  # validate :neurological_sensory_level_right, :ensure_symmetry
  # validate :neurological_motor_level_left, :ensure_symmetry
  # validate :neurological_motor_level_right, :ensure_symmetry
  # validate :preservation_sensory_level_left, :ensure_symmetry
  # validate :preservation_sensory_level_right, :ensure_symmetry
  # validate :preservation_motor_level_left, :ensure_symmetry
  # validate :preservation_motor_level_right, :ensure_symmetry

  # def ensure_symmetry
    # if !has_motor_or_sensory_asymmetry
    #   errors.add(:neurological_motor_level_right, "does not match left") unless neurological_motor_level_left == neurological_motor_level_right
    #   errors.add(:neurological_sensory_level_right, "does not match left") unless neurological_sensory_level_left == neurological_sensory_level_right
    #   errors.add(:preservation_motor_level_right, "does not match left") unless preservation_motor_level_left == preservation_motor_level_right
    #   errors.add(:preservation_sensory_level_right, "does not match left") unless preservation_sensory_level_left == preservation_sensory_level_right
    # end
  # end

  def ensure_symmetry
    if is_unimpaired?
      self.has_motor_or_sensory_asymmetry = false

      wnl = Domain::LevelOfInjury.where(name: "WNL").first
      self.neurological_motor_level_left = self.neurological_sensory_level_left = wnl
      self.preservation_motor_level_left = self.preservation_sensory_level_left = wnl
    end

    if !has_motor_or_sensory_asymmetry
      self.neurological_motor_level_right = neurological_motor_level_left
      self.neurological_sensory_level_right = neurological_sensory_level_left

      self.preservation_motor_level_left = preservation_motor_level_left
      self.preservation_sensory_level_right = preservation_sensory_level_left
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

  #############################################################################
  ## is_complete
  #############################################################################
  def is_complete?
    impairment_scale.try(:name).try(:downcase) == "a"
  end

  #############################################################################
  ## is_impaired
  #############################################################################
  def is_impaired?
    impairment_scale.try(:name).try(:downcase) != "e"
  end

  #############################################################################
  ## is_unimpaired
  #############################################################################
  def is_unimpaired?
    !is_impaired?
  end

  #############################################################################
  ## neurological_level_of_injury
  ## Computes the neurological level of injury as a single value defined as:
  ##   The most caudal segment of the spinal cord with normal sensory and motor
  ##   function. When asymmetical findings are present, the single level of
  ##   injury is the most rostral of the 4 findings.
  #############################################################################
  def neurological_level_of_injury
    [
      neurological_motor_level_left, neurological_motor_level_right,
      neurological_sensory_level_left, neurological_sensory_level_right
    ].sort.first
  end
end
