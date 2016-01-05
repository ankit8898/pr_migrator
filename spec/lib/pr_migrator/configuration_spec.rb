require "spec_helper"

RSpec.describe PrMigrator::Configuration do

  subject { PrMigrator::Configuration.new }

  it 'has default source_access_token' do
    expect(subject.source_access_token).to eq(12345)
  end

  it 'has default destination_access_token' do
    expect(subject.destination_access_token).to eq(56789)
  end
end
