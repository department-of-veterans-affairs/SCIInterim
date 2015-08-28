module DomainCollectionable
    extend ActiveSupport::Concern
  included do
    def self.collection 
      @collection ||= self.all.reject{ |obj| obj.name.empty? }
    end
  end

  def to_s
    name
  end
end
