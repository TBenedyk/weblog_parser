# frozen_string_literal: true

require 'log_entry'

describe LogEntry do
  describe '#initialize' do
    context 'with valid attributes' do
      subject { described_class.new(page: '/home', ip_addr: '111.111.111.111') }

      it 'does not raise an error' do
        expect { subject }.to_not raise_error
      end
    end

    context 'with invalid page path' do
      subject { described_class.new(page: 'home', ip_addr: '111.111.111.111') }

      it 'raises error' do
        expect { subject }.to raise_error('Page is missing or invalid')
      end
    end

    context 'with invalid ip address' do
      subject { described_class.new(page: '/home', ip_addr: '111.111.111') }

      it 'raises error' do
        expect { subject }.to raise_error('IP is missing or invalid')
      end
    end
  end
end
