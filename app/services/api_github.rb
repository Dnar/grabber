# frozen_string_literal: true

class ApiGithub
  extend Dry::Initializer

  param :path
  param :request_params

  def perform_request
    connection.get
  end

  def connection
    base_url = 'https://api.github.com/repos/'
    full_url = "#{base_url}#{path}?per_page=20?sha=master?author=#{request_params[:author_email]}"

    Faraday.new(url: full_url) do |faraday|
      faraday.request  :json
      faraday.response :json
      faraday.adapter :net_http
    end
  end
end
