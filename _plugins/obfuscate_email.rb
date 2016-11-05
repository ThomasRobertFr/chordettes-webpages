module Jekyll
  class ObfuscateEmail < Liquid::Tag

    def initialize(tag_name, text, tokens)
      super
      @text = text
    end

    def render(context)
      out = context[@text.strip]
      out = out.gsub(".", "|").gsub("@", "!").reverse.split("")
      "#{out}"
    end
  end
end

Liquid::Template.register_tag('obfuscate_email', Jekyll::ObfuscateEmail)
