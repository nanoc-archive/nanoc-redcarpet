# encoding: utf-8

require 'helper'

class Nanoc::Redcarpet::FilterTest < Minitest::Test

  def test_find
    refute Nanoc::Filter.named(:redcarpet).nil?
  end

  def test_filter
    # Create filter
    filter = ::Nanoc::Redcarpet::Filter.new

    # Run filter
    result = filter.run("> Quote")
    assert_match(/<blockquote>\s*<p>Quote<\/p>\s*<\/blockquote>/, result)
  end

  def test_with_extensions
    # Create filter
    filter = ::Nanoc::Redcarpet::Filter.new

    # Run filter
    if ::Redcarpet::VERSION > '2'
      input           = "this is ~~good~~ bad"
      output_expected = /this is <del>good<\/del> bad/
      output_actual   = filter.run(input, :options => { :strikethrough => true })
    else
      input           = "The quotation 'marks' sure make this look sarcastic!"
      output_expected = /The quotation &lsquo;marks&rsquo; sure make this look sarcastic!/
      output_actual   = filter.run(input, :options => [ :smart ])
    end
    assert_match(output_expected, output_actual)
  end

  def test_html_by_default
    # Create filter
    filter = ::Nanoc::Redcarpet::Filter.new

    # Run filter
    input           = "![Alt](/path/to/img 'Title')"
    output_expected = %r{<img src="/path/to/img" alt="Alt" title="Title">}
    output_actual   = filter.run(input)
    assert_match(output_expected, output_actual)
  end

  def test_xhtml_if_requested
    # Create filter
    filter = ::Nanoc::Redcarpet::Filter.new

    # Run filter
    input           = "![Alt](/path/to/img 'Title')"
    output_expected = %r{<img src="/path/to/img" alt="Alt" title="Title"/>}
    if ::Redcarpet::VERSION > '2'
      output_actual   = filter.run(input, :renderer_options => { :xhtml => true })
    else
      output_actual   = filter.run(input, :options => [ :xhtml ])
    end
    assert_match(output_expected, output_actual)
  end

  def test_html_toc
    # Create filter
    filter = ::Nanoc::Redcarpet::Filter.new

    # Run filter
    input = "# Heading 1\n## Heading 2\n"
    filter.run(input, :renderer => Redcarpet::Render::HTML_TOC)
  end

end
