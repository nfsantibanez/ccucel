ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

require 'bundler/setup' # Set up gems listed in the Gemfile.

# Setup languaje of DB
# ENV['NLS_LANG'] = 'AMERICAN_AMERICA.UTF8'
ENV['NLS_LANG'] = 'SPANISH_SPAIN.UTF8'
