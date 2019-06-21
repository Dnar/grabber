# frozen_string_literal: true

module Api
  module V1
    class FetchCommits < Base
      version 'v1', using: :path
      format :json
      prefix :api

      desc 'get all commits'
      get :index do
        paginate per_page: 10, max_per_page: 200, enforce_max_per_page: true
        paginate Commit.all
      end

      desc 'Fetch author commits from repo'
      params do
        requires :owner, type: String
        requires :repo, type: String
        requires :author_email, type: String
      end
      post :fetch_and_save_commits do
        url_path = "#{params[:owner]}/#{params[:repo]}/commits"
        fetch_github_commits = ApiGithub.new(url_path, params).perform_request

        unless fetch_github_commits.success?
          error!(fetch_github_commits.body['message'], fetch_github_commits.status)
        end

        Commit.delete_all
        fetch_github_commits.body.map do |commit|
          Commit.create!(data: commit)
        end
      end
    end
  end
end
