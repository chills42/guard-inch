require "guard/inch/version"
require 'guard'
require 'guard/plugin'

# The guard namespace
module Guard
  # A guard plugin for the Inch documentation lint tool
  class Inch < Plugin
    # configure a new instance of the plugin
    # @param [Hash] options the guard plugin options
    def initialize(options = {})
      super
      @options = options
      @all_on_start
      @all_type = options[:all_type] || :none
    end

    # On start, display a message and optionally run the documentation lint
    def start
      message = 'Guard::Inch is running'
      message << ' in pedantic mode' if options[:pedantic]
      ::Guard::UI.info message
      run_all if options[:all_on_start]
    end

    # Run all of the documentation lints
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

    # Run the lints for changes files
    # @param [Array<String>] paths the paths of changed files
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

