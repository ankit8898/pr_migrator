require 'pr_migrator/configuration'


module PrMigrator
  class << self
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    puts configuration
    yield(configuration)
  end
end
