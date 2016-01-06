Gem::Specification.new do |s|
  s.name        = 'pr_migrator'
  s.version     = '0.1.0'
  s.date        = '2016-01-05'
  s.summary     = "Github Pull request migrator"
  s.description = "Migrate Pull requests from one repo to other"
  s.authors     = ["Ankit Gupta"]
  s.email       = 'ankit.gupta8898@gmail.com'
  s.files       = ["lib/pr_migrator.rb",
                   "lib/pr_migrator/configuration.rb",
                   "lib/pr_migrator/export.rb",
                   "lib/pr_migrator/create.rb"
                 ]
  s.homepage    = 'http://rubygems.org/gems/pr_migrator'
  s.license       = 'MIT'
  s.add_runtime_dependency 'octokit' ,'~> 4.2'
  s.add_runtime_dependency 'parallel' ,'~> 1.6'
  s.add_development_dependency 'rspec', '~> 3.4'

end
