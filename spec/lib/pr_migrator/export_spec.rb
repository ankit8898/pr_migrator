require "spec_helper"

RSpec.describe PrMigrator::Export do

  before do
    PrMigrator.configure do |config|
      config.source_access_token        = 'abcdef'
      config.destination_access_token   = 'xyz'
      config.github_enterprise_endpoint = 'https://github.move.com'
    end
  end

  subject { PrMigrator::Export.new(repo_name: 'foo/abc', pr_numbers: [1,2,3]) }

  it 'has repo_name' do
    expect(subject.repo_name).to eq('foo/abc')
  end

  it 'has client' do
    expect(subject.client).to be_kind_of(Octokit::Client)
  end

  it 'has pr numbers to be exported' do
    expect(subject.pr_numbers).to match_array([1,2,3])
  end

  it 'has folder name for exported files' do
    expect(subject.folder_name_for_exported_files).to include('export_')
  end

  it { expect(subject.failed_prs).to be_empty }
  it { expect(subject.exported_prs).to be_empty }

end
