# frozen_string_literal: true

require 'log_stats'

describe LogStats do
  subject { described_class.new(entries: entries) }

  describe '#analyze' do
    let(:entries) do
      [
        LogEntry.new(page: '/about', ip_addr: '111.111.111.111'),
        LogEntry.new(page: '/about', ip_addr: '111.111.111.111'),
        LogEntry.new(page: '/about', ip_addr: '111.111.111.112'),
        LogEntry.new(page: '/home',  ip_addr: '111.111.111.113'),
        LogEntry.new(page: '/home',  ip_addr: '111.111.111.113')
      ]
    end

    context 'non-unique stats' do
      it 'returns array of ordered stats' do
        expect(subject.analyze(unique: false)).to eq([['/about', 3], ['/home', 2]])
      end
    end

    context 'unique stats' do
      it 'returns array of ordered stats' do
        expect(subject.analyze(unique: true)).to eq([['/about', 2], ['/home', 1]])
      end
    end
  end
end
