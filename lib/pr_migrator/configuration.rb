module PrMigrator

  class Configuration

    attr_accessor :source_access_token
    attr_accessor :destination_access_token
    attr_accessor :github_enterprise_endpoint

    def initialize
      @source_access_token        = 12345
      @destination_access_token   = 56789
    end

  end

end
