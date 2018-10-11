# frozen_string_literal: true

class LogEntry
  attr_accessor :page, :ip_addr

  def initialize(page:, ip_addr:)
    run_validations!(page, ip_addr)
    @page = page
    @ip_addr = ip_addr
  end

  private

  def run_validations!(page, ip_addr)
    raise ArgumentError, 'Page is missing or invalid' unless valid_page?(page)
    raise ArgumentError, 'IP is missing or invalid' unless valid_ip?(ip_addr)
  end

  def valid_ip?(ip_addr)
    # TODO: implement IP validation using library e.g. resolv or ipaddr
    ip_addr =~ /\d{3}[.]\d{3}[.]\d{3}[.]\d{3}/
  end

  def valid_page?(page)
    page =~ %r{\/[a-z]+}
  end
end
