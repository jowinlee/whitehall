module PublishingApiPresenters
  class TakePart < Item
  private

    def document_format
      "take_part"
    end

    def details
      {
        body: body,
        image: {
          url: Whitehall.asset_root + item.image_url(:s300),
          alt_text: item.image_alt_text,
        }
      }
    end

    def description
      item.summary
    end

    def public_updated_at
      item.updated_at
    end

    def body
      Whitehall::GovspeakRenderer.new.govspeak_to_html(item.body)
    end

    def rendering_app
      "government-frontend"
    end
  end
end