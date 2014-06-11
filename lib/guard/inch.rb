require "guard/inch/version"
require 'guard'
require 'guard/plugin'

module Guard
  class Inch < Plugin
    def initialize(options = {})
      super
      @options = options
      @all_on_start
      @all_type = options[:all_type] || :none
    end

    def start
      message = 'Guard::Inch is running'
      message << ' in pedantic mode' if options[:pedantic]
      ::Guard::UI.info message
      run_all if options[:all_on_start]
    end

    def run_all
      return unless options[:all_type]
      args = case options[:all_type]
             when :stats
               'stats'
             when :list
               'list'
             when :suggest
               'suggest'
             end
      args << ' .'
      run_inch args
    end
    def run_on_changes(paths)
      flags = ''
      flags << '--pedantic ' if options[:pedantic]
      run_inch "#{flags} #{paths.join(' ')}"
    end
    
    private

    # run the inch tool with the specified argument string
    def run_inch(arg_string)
      puts `inch #{arg_string}`
    end
  end
end

