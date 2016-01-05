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