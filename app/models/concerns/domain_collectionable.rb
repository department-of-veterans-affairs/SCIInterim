module DomainCollectionable
    extend ActiveSupport::Concern
  included do
    def self.cached_all
      @cached_all ||= all
    end
  end
  def to_s
    name
  end
end
