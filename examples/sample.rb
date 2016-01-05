require 'rubygems'
require 'pr_migrator'
# To Export the PRs

# Configure it

PrMigrator.configure do |config|
  config.source_access_token = '32b2d2e86d822efd83840a518747e1925740d9f0'
end


# Create a Instance of Export

export_instance = PrMigrator::Export.new(repo_name: 'MoveInc/FESLx', pr_numbers: (1..40).to_a)

# Start the export
export_instance.start
