require 'octokit'
require 'json'
require 'parallel'
require 'securerandom'
require 'pr_migrator/configuration'
require 'pr_migrator/export'
require 'pr_migrator/create'

module PrMigrator
  class << self
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end
