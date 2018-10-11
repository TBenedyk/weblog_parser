# frozen_string_literal: true

require 'log_parser'
require 'log_entry'
require 'pry'

describe LogParser do
  subject { described_class.call(file: 'test.log') }

  describe '.call' do
    context 'with valid logs' do
      before do
        allow(File).to receive(:readlines).with('test.log').and_return(logs)
      end

      let(:logs) do
        [
          '/help_page/1 111.111.111.111',
          '/help_page/1 111.111.111.112',
          '/home 111.111.111.111',
          '/home 111.111.111.111',
          '/home 111.111.111.112'
        ]
      end

      it 'should return and process each line' do
        expect(subject.entries.count).to eq(5)
      end

      it 'should assign page and ip' do
        entries = subject.entries
        expect(entries[0].page).to eq('/help_page/1')
        expect(entries[0].ip_addr).to eq('111.111.111.111')
        expect(entries[1].page).to eq('/help_page/1')
        expect(entries[1].ip_addr).to eq('111.111.111.112')
      end
    end

    context 'with missing IP' do
      before do
        allow(File).to receive(:readlines).with('test.log').and_return(logs)
      end

      let(:logs) do
        [
          '/help_page/1',
          '/home 111.111.111.111'
        ]
      end

      it 'should print missing argument error' do
        expect(STDOUT).to receive(:puts).with('Error: IP is missing or invalid')
        subject
      end
    end

    context 'with invalid page path' do
      before do
        allow(File).to receive(:readlines).with('test.log').and_return(logs)
      end

      let(:logs) do
        [
          '/help_page/1 111.111.111.111',
          'home 111.111.111.111'
        ]
      end

      it 'should print missing argument error' do
        expect(STDOUT).to receive(:puts).with('Error: Page is missing or invalid')
        subject
      end
    end

    context 'with an invalid file' do
      before do
        allow(File).to receive(:readlines).with('test.log').and_raise(IOError)
      end

      it 'should print error response' do
        expect(STDOUT).to receive(:puts).with('Error: IOError')
        subject
      end
    end
  end
end
