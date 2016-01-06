require 'rubygems'
require 'pr_migrator'
# To Export the PRs

# Configure it

PrMigrator.configure do |config|
  config.source_access_token        = 'ACCESS_TOKEN' #replace with the actual access token
  config.destination_access_token   = 'ACCESS_TOKEN' #replace with the actual access token
  config.github_enterprise_endpoint = 'https://github.your_company.com/api/v3/'
end

# Create a Instance of Export

export_instance = PrMigrator::Export.new(repo_name: 'ankit8898/FESLx', pr_numbers: (1..40).to_a)

# Start the export
export_instance.start
