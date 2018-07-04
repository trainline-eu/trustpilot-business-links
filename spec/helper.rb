require "simplecov"
require "simplecov-rcov"
SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  SimpleCov::Formatter::RcovFormatter
]
SimpleCov.start
require "rspec"
require "rspec/its"
require "rack/test"

require 'pry'

# Load libs
require "trustpilot-business-links"
