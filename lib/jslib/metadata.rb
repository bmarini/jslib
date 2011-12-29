module Jslib
  class Metadata
    class Version
      attr_reader :version, :minified, :uncompressed

      def initialize(data)
        @version      = data['version']
        @minified     = data['minified']
        @uncompressed = data['uncompressed']
      end

      def has_minified?
        !( @minified.nil? || @minified.empty? )
      end

      def has_uncompressed?
        !( @uncompressed.nil? || @uncompressed.empty? )
      end

      def resolved_name
        has_minified? ? "#{@version}.min" : @version
      end

      def resolved_url
        has_minified? ? minified : uncompressed
      end

      def to_s
        @version
      end
    end

    attr_reader :name, :versions

    def initialize(data)
      @name     = data['name']
      @versions = data['versions'].map { |v| Version.new(v) }
    end

    def resolved_name
      @name + "." + @versions.first.resolved_name + ".js"
    end

    def resolved_url
      @versions.first.resolved_url
    end
  end
end