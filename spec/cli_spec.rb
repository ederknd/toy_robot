require 'rspec'
require_relative '../src/cli'

RSpec.describe CLI do
  let(:subject) { CLI.new(File.open('examples/example_a.txt')) }

  describe '#initialize' do
    it 'should set status to ready to start' do
      expect(subject.status).to eq(:ready_to_start)
      expect(subject.input).to be_a(File)
    end
  end

  describe '#start' do
    it 'should outputs result' do
      expect { subject.start }.to output(/0,1,SOUTH/).to_stdout
    end
  end
end