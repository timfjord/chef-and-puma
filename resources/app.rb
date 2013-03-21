actions :add, :remove

attribute :path, kind_of: String, name_attribute: true
attribute :user, kind_of: String, default: 'root'
attribute :config, kind_of: String
attribute :log, kind_of: String

def initialize(*args)
  super
  @action = :add
end