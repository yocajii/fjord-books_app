# frozen_string_literal: true

class ApplicationController < ActionController::Base
  private

  def default_url_options(options = {})
    options.reverse_merge(locale: I18n.locale)
  end
end
