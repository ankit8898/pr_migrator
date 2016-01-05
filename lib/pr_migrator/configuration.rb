module PrMigrator

  class Configuration

    attr_accessor :source_access_token, :destination_access_token
    def initialize
      @source_access_token      = 12345
      @destination_access_token = 56789
    end

  end

end
