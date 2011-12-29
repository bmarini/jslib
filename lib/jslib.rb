require "jslib/version"
require "pathname"
require "yaml"
require "net/http"

module Jslib
  extend self

  def lib(name)
    pathname = root + "#{name}.yml"

    if pathname.exist?
      metadata_from_pathname(pathname)
    else
      raise ArgumentError, "Could not find #{pathname} in jslibs dir"
    end
  end

  def libs
    pathnames.map { |pathname| metadata_from_pathname(pathname) }
  end

  def metadata_from_pathname(pathname)
    Metadata.new( YAML.load( pathname.read ) )
  end

  def pathnames
    Pathname.glob( root + "*.yml" )
  end

  def root
    Pathname.new File.expand_path("../jslib/jslibs", __FILE__)
  end
end

require "jslib/cli"
require "jslib/metadata"
