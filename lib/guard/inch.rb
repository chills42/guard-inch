require "guard/inch/version"
require 'guard'
require 'guard/plugin'

module Guard
  class Inch < Plugin
    def initialize(options = {})
      super
    end

    def run_on_changes(paths)
      puts `inch #{paths.join(' ')}`
    end
  end
end

