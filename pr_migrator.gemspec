Gem::Specification.new do |s|
  s.name        = 'pr_migrator'
  s.version     = '0.1.0'
  s.date        = '2016-01-05'
  s.summary     = "Github Pull request migrator"
  s.description = "Migrate Pull requests from one repo to other"
  s.authors     = ["Ankit Gupta"]
  s.email       = 'ankit.gupta8898@gmail.com'
  s.files       = ["lib/pr_migrator.rb"]
  s.homepage    =
    'http://rubygems.org/gems/hola'
  s.license       = 'MIT'
  s.add_runtime_dependency 'octokit' ,'~> 4.2'
  s.add_development_dependency 'rspec', '~> 3.4'

end
