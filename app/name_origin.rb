require 'yaml'

class NameOrigin
  attr_reader :name

  NAME_ORIGIN_LIST = YAML.load_file('data/name_by_country.yml').tap { _1.default = []}

  def initialize(name)
    @name = name
  end

  def guess = NAME_ORIGIN_LIST[name]
end
