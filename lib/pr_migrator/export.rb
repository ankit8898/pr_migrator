module PrMigrator

  attr_accessor :source_access_token

  class Export


    def source_token
      Configuration.source_access_token
    end
  end

end
