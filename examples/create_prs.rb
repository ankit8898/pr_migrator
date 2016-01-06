require 'rubygems'
require 'pr_migrator'

# To Export the PRs

# Configure it

PrMigrator.configure do |config|
  config.source_access_token        = 'ACCESS_TOKEN' #replace with the actual access token
  config.destination_access_token   = 'ACCESS_TOKEN' #replace with the actual access token
  config.github_enterprise_endpoint = 'https://github.your_company.com/api/v3/'
end

# Create an Instance of Create

create_instance = PrMigrator::Create.new(repo_name: 'agupta/rdc-next',
                                         exported_pr_dir: 'PATH_TO_EXPORT/*')

create_instance.start
