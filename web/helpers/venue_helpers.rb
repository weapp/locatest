# frozen_string_literal: true

App.helpers do
  def from_platform(client, **base)
    base.merge(client.instance.venue.ok_then(&:to_standard).as_json)
  end

  def schema_venue
    # App.debug Dry::Types['strict.string']
    Dry::Validation.Params do
      required(:name).filled { str? }
      required(:lat) { filled? & decimal? & gt?(-90) & lt?(90) }
      required(:lng) { filled? & decimal? & gt?(-180) & lt?(180) }
      required(:category_id) { int? & gt?(0) & lt?(200) }
      required(:closed) { bool? }
      required(:website).filled { str? }
      required(:phone_number).filled { str? }
      required(:address_line_1).filled { str? }
      required(:address_line_2).filled { str? }
      required(:hours).each do
        schema do
          required(:starts_at).filled { str? & format?(/^([0-1]?[0-9]|2[0-3]):[0-5][0-9]$/) }
          required(:ends_at).filled { str? & format?(/^([0-1]?[0-9]|2[0-3]):[0-5][0-9]$/) }
        end
      end

      rule(items_size: [:hours]) do |items|
        items.size? 7
      end
    end
  end
end
