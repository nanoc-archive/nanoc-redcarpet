[![Build Status](https://travis-ci.org/nanoc/nanoc-redcarpet.png)](https://travis-ci.org/nanoc/nanoc-redcarpet)
[![Code Climate](https://codeclimate.com/github/nanoc/nanoc-redcarpet.png)](https://codeclimate.com/github/nanoc/nanoc-redcarpet)
[![Coverage Status](https://coveralls.io/repos/nanoc/nanoc-redcarpet/badge.png?branch=master)](https://coveralls.io/r/nanoc/nanoc-redcarpet)

# nanoc-redcarpet

This provides a [Redcarpet](https://github.com/vmg/redcarpet) filter for [nanoc](http://nanoc.ws).

## Installation

`gem install nanoc-redcarpet`

## Usage

```ruby
filter :redcarpet
```

This method optionally takes processing options to pass on to Redcarpet.

* `:options` (default: `{}`): a list of options to pass on to Redcarpet itself (not the renderer)

* `:renderer` (default: `::Redcarpet::Render::HTML`): the class of the renderer to use

* `:renderer_options` (default: `{}`): a list of options to pass on to the Redcarpet renderer
