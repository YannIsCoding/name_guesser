require 'yaml'

class NameOrigin
  attr_reader :name

  # Load the name_by_country in a Constant to avoid GC between request.
  NAME_ORIGIN_LIST = YAML.load_file('data/name_by_country.yml').tap { _1.default = [] }

  def initialize(name)
    @name = name.downcase.capitalize
  end

  def guess = NAME_ORIGIN_LIST[name]
end
