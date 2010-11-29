require 'sinatra'

module Tilt

  # Scss template implementation.
  #
  # Scss templates do not support object scopes, locals, or yield.
  class ScssTemplate < Template
    def initialize_engine
      return if defined? ::Sass::Engine
      require_template_library 'sass'
    end

    def prepare
      @engine = ::Sass::Engine.new(data, scss_options)
    end

    def evaluate(scope, locals, &block)
      @output ||= @engine.render
    end

    private
    def scss_options
      options.merge(:filename => eval_file, :line => line, :syntax => :scss)
    end
  end
  register 'scss', ScssTemplate

end

