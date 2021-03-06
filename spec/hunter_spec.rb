require 'spec_helper'
require 'vcr'

describe Hunter do
  let(:key) { "your_api_key" }

  it 'has a version number' do
    expect(Hunter::VERSION).not_to be nil
  end

  it 'search API expect status \'success\'' do
    VCR.use_cassette 'search API expect status \'success\'' do
      hunter = Hunter.new(key)
      expect(hunter.domain_search('google.com').status).to eq('success')
    end
  end

  it 'search API expect number of emails > 0' do
    VCR.use_cassette 'search API expect number of emails > 0' do
      hunter = Hunter.new(key)
      expect(hunter.domain_search('google.com').emails.count).to be > 0
    end
  end

  it 'verify API expect status \'success\'' do
    VCR.use_cassette 'verify API expect status \'success\'' do
      hunter = Hunter.new(key)
      expect(hunter.email_verifier('hello@prospect.io').score).to be > 0
    end
  end

  it 'search API expect first email type == generic with stripe.com domain' do
    VCR.use_cassette 'search API expect first email type == generic with stripe.com domain' do
      hunter = Hunter.new(key)
      expect(hunter.domain_search('stripe.com').emails.first[:type]).to be == "generic"
    end
  end

  it 'expect vincenzo@prospect.io API generate email' do
    VCR.use_cassette 'expect vincenzo@prospect.io API generate email' do
      hunter = Hunter.new(key)
      expect(hunter.email_finder('Vincenzo', 'Ruggiero', {domain: 'prospect.io'}).email).to eq('vincenzo@prospect.io')
    end
  end
end
