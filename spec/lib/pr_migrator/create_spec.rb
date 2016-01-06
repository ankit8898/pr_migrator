require "spec_helper"

RSpec.describe PrMigrator::Create do

  before do
    PrMigrator.configure do |config|
      config.source_access_token        = 'abcdef'
      config.destination_access_token   = 'xyz'
      config.github_enterprise_endpoint = 'https://github.move.com'
    end
  end

  subject { PrMigrator::Create.new(repo_name: 'foo/abc', exported_pr_dir: '/foo') }

  it 'has repo_name' do
    expect(subject.repo_name).to eq('foo/abc')
  end

  it 'has exported_pr_dir' do
    expect(subject.exported_pr_dir).to eq('/foo')
  end

  it 'has all the files' do
    expect(subject.files).to be_empty
  end

end
