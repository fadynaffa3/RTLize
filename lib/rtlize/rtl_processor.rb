module Rtlize
  class RtlProcessor
    ALLOWED_EXTENSIONS = %w[css scss sass].freeze

    def self.call(input)
      filename = input[:filename]
      source   = input[:data]
      context  = input[:environment].context_class.new(input)

      result = run(filename, source, context)
      context.metadata.merge(data: result)
    end

    def self.run(filename, source, context)
      basename  = File.basename(filename)
      extension = basename.split('.').last
      if ALLOWED_EXTENSIONS.include?(extension) && context.logical_path.to_s.match?(/\.rtl/i)
        Rtlize::RTLizer.transform(source)
      else
        source
      end
    end
  end
end
