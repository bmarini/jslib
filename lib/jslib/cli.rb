require "thor"

module Jslib
  class CLI < Thor

    desc "install JSLIB", "Install one or more javascript libraries"
    method_option :version, :type => :string, :aliases => "-v", :banner => "Version of javascript library to install"
    def install(*jslibs)
      jslibs.each do |jslib|
        lib      = Jslib.lib(jslib)
        raw      = Net::HTTP.get( URI( lib.versions.last.minified ) )
        filename = "#{lib.name}.#{lib.versions.last}.min.js"

        File.open(filename, "w") do |f|
          f.write(raw)
        end

        puts "Installed #{filename}"
      end
    end

    desc "list", "List all known javascript libraries"
    def list
      Jslib.libs.each do |lib|
        puts lib.name
        lib.versions.each do |version|
          puts "- %s" % version
          puts "  minified:     %s" % version.minified if version.has_minified?
          puts "  uncompressed: %s" % version.uncompressed if version.has_uncompressed?
        end
        puts ""
      end
    end

    desc "search", "Search for a javascript library"
    def search
    end
  end
end