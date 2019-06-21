# frozen_string_literal: true

module Api
  module V1
    class FetchCommits < Api::V1::Base
      version 'v1', using: :path
      format :json
      prefix :api

      desc 'Fetch author commits from repo'
      params do
        requires :owner, type: String
        requires :repo, type: String
        requires :author_email, type: String
      end
      post :fetch_and_save_commits do
        error!(fetch_github_commits.body['message'], fetch_github_commits.status) unless fetch_github_commits.success
        save_commits
        paginate Commit.all
      end

      private

      def fetch_github_commits
        @fetch_github_commits ||=
          ApiGithub.new(url_path, params).perform_request
      end

      def url_path(params)
        "#{params[:owner]}/#{params[:repo]}/commits"
      end

      def save_commits
        Commit.delete_all
        fetch_github_commits.body.map do |commit|
          Commit.create!(data: commit)
        end
      end
    end
  end
end
