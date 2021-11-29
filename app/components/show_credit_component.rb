# frozen_string_literal: true

class ShowCreditComponent < ViewComponent::Base
  def initialize(item:)
    @item = item
  end
end
