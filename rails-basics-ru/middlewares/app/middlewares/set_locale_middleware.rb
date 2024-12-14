# frozen_string_literal: true

class SetLocaleMiddleware
  def initialize(app)
    @app = app
  end

  # BEGIN
  def call(env)
    status, headers, response = @app.call(env)

    accept_language = env['HTTP_ACCEPT_LANGUAGE']
    locale = get_locale_from_accept_language_header(accept_language)
    I18n.locale = locale

    puts '=' * 25
    puts I18n.locale
    puts '=' * 25

    headers['Content-Language'] = I18n.locale.to_s

    [status, headers, response]
  end

  private

  def get_locale_from_accept_language_header(header_value)
    return I18n.default_locale if header_value.nil?

    user_lang = header_value.scan(/^[a-z]{2}/).find do |lang|
      I18n.available_locales.map(&:to_s).include? lang
    end

    user_lang || I18n.default_locale
  end
  # END
end
