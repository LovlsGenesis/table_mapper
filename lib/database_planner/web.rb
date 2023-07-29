require 'erb'

require 'table_mapper/web/application'
require 'table_mapper/web/router'

module DatabasePlanner
  class Web
    ROOT = File.expand_path("#{File.dirname(__FILE__)}/../../web")
    VIEWS = "#{ROOT}/views".freeze
    LOCALES = ["#{ROOT}/locales"].freeze
    LAYOUT = "#{VIEWS}/layout.erb".freeze
    ASSETS = "#{ROOT}/assets".freeze

    def locales
      @locales ||= LOCALES
    end

    def views
      @views ||= VIEWS
    end
  end

  ERB.new <<-EOF
    Hello World
  EOF
end
