# frozen_string_literal: true

module Api
  module V1
    class Base < Grape::API
      mount Api::V1::FetchCommits
    end
  end
end
