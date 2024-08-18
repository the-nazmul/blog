module Jekyll
  module AddIdsToH2
    def add_ids_to_h2(input)
      # Regex to find h2 tags and capture the inner text
      input.gsub(/<h2>(.*?)<\/h2>/) do |match|
        text = $1
        # Convert text to a slug-like id
        id = text.strip.downcase.gsub(/[^\w]+/, '-')
        # Return h2 with an id attribute
        "<h2 id=\"#{id}\">#{text}</h2>"
      end
    end
  end
end

Liquid::Template.register_filter(Jekyll::AddIdsToH2)
