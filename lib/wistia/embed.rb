module Wistia
  module Embed
    VALID_KEYS = [:width, :height, :playbutton, :controls_visible,
                  :autoplay, :end_video_behavior, :ssl,
                  :interactive_transcript, :noscript_transcript]

    def self.media_embed_code(id, options={})
      raise RuntimeError, "a media-id is required" unless id.is_a?(Numeric)

      if Wistia::Base.password.empty?
        Wistia::Base.password  = Wistia.config.api.key
      end
      raise RuntimeError, "no password" unless Wistia::Base.password

      query = assemble_query(options)
      url = "#{Wistia::Base.site.to_s}medias/#{id}/embed?#{query}"
      Wistia::Base.connection.get(url).body
    end

    def self.assemble_query(options)
      query = options.map do |key, value|
        raise UnsupportedKeyError, "'#{key}' is not supported" unless VALID_KEYS.include?(key)

        if [true, false].include?(value)
          value = value ? '1' : '0'
        end
        "embed_code_options\[#{key}]\=#{value}"
      end
      query.join("&")
    end
  end # Embed
end # Wistia

class UnsupportedKeyError < RuntimeError; end
