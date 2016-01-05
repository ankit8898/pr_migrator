require "spec_helper"

RSpec.describe PrMigrator do

  describe '#configure' do

    before do
      PrMigrator.configure do |config|
        config.source_access_token        = 'abcdef'
        config.destination_access_token   = 'xyz'
        config.github_enterprise_endpoint = 'https://github.move.com'
      end
    end

    it 'has the source_access_token set in config' do
      expect(PrMigrator.configuration.source_access_token).to eq('abcdef')
    end

    it 'has the source_access_token set in config' do
      expect(PrMigrator.configuration.destination_access_token).to eq('xyz')
    end

    it 'has the github_enterprise_endpoint set in config' do
      expect(PrMigrator.configuration.github_enterprise_endpoint).to eq('https://github.move.com')
    end
  end
end
