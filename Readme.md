## PR migrator

Pull requests Migrator. This is a little utility which helps in 2 ways

- Exporting Github PR's into JSON files .
- Creating PR's into another repo from the Export.

During the Github Migration we loose the PR content. This would help us to still get few things (Not all) and still keep things searchable.

## Installation

Add the gem to the Gemfile:

```ruby
gem "pr_migrator"    
```

bundle install

## Getting Started

Setup the config

```ruby

PrMigrator.configure do |config|
  config.source_access_token = 'xxxxx'
  config.destination_access_token = 'xxxxxx'
  config.github_enterprise_endpoint = 'https://your_org.github.com'
end

```

In the above configs

source_access_token: Is the acccess token of the Github account from where the Export is being made.
destination_access_token: Is the access token of the other Github Account (May be Enterprise). If it's on github.com use the same as `source_access_token`
github_enterprise_endpoint: This will be required when Migrating to Github enterprise.

## Exporting PR's 

```ruby
export_instance = PrMigrator::Export.new(repo_name: YOUR_REPO_NAME, pr_numbers: ARRAY_OF_PR_NUMBERS)
create_instance.start # Starts the export 

# Example
# PrMigrator::Export.new(repo_name: 'ankit8898/foo', pr_numbers: [1,2,3,4,5,6]) #array of PR's
# PrMigrator::Export.new(repo_name: 'ankit8898/foo', pr_numbers: (3..4).to_a) # Range of PR

```

After the export is run the files will we present in a `export_xxx` folder.

## Creating PR's 

Creating of PR's is not straight. :neutral_face:

The creation module Simulates the creation of PR as you would create manually. But it Updates the content of the PR with the ones from the exports. To get started 

NOTE: You have to create a Branch in the Repo where the PR's are getting migrated. We will Call this branch as `migrated`

```ruby

# Create an Instance of Create
create_instance = PrMigrator::Create.new(repo_name: 'agupta/new_foo', exported_pr_dir: 'PATH_TO_FILES/*',migration_branch: 'migrated')

create_instance.start # Starts the creation 

```