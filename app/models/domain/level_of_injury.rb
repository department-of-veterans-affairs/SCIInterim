class Domain::LevelOfInjury < ActiveRecord::Base
  include DomainCollectionable, Comparable

  #############################################################################
  ## <=>
  ## Rocket ship returns -1 id self < other, 0 if self == other, or +1 if 
  ## self > other. Allows spinal vertebra to be compared.
  #############################################################################
  def <=>(other)
  	s = segment(name) <=> segment(other.name)
  	l = level(name) <=> level(other.name)

  	s == 0 ? l : s
  end

  #############################################################################
  ## segment
  ## Extracts the vertebral segment from the name.
  #############################################################################
  def segment(str)
  	return str.nil? ? "" : str[0]
  end

  #############################################################################
  ## level
  ## Extracts the vertebral segment level from the name
  #############################################################################
  def level(str)
  	return str.nil? ? 0 : str[1]
  end
end
