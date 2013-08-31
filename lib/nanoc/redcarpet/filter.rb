# encoding: utf-8

require 'redcarpet'

module Nanoc::Redcarpet

  class Filter < Nanoc::Filter

    identifier :redcarpet

    def run(content, params={})
      options          = params[:options]          || {}
      renderer_class   = params[:renderer]         || ::Redcarpet::Render::HTML
      renderer_options = params[:renderer_options] || {}

      if options.is_a?(Array)
        warn 'WARNING: You are passing an array of options to the :redcarpet filter, but Redcarpet 2.x expects a hash instead. This will likely fail.'
      end

      if renderer_class == ::Redcarpet::Render::HTML_TOC
        renderer = renderer_class.new
      else
        renderer = renderer_class.new(renderer_options)
      end
      ::Redcarpet::Markdown.new(renderer, options).render(content)
    end

  end

end
