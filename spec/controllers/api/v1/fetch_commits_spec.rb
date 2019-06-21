require 'rails_helper'

describe Api::V1::FetchCommits, type: :request do
  base_url = '/api/v1/fetch_and_save_commits'

  describe 'POST /fetch_and_save_commits' do
    context '#success' do
      let(:params) { { owner: 'Dnar', repo: 'grabber', author_email: 'chanky@list.ru' } }
      before { post base_url, params: params }

      it 'will update Commit and return 2xx' do
        expect(response).to have_http_status(:success)
        expect(Commit.count).to eq JSON.parse(response.body).count
      end
    end

    context '#failure' do
      let(:params) { { owner: 'Dnar', repo: 'grabber00', author_email: 'chanky@list.ru' } }
      before { post base_url, params: params }

      it 'will not update Commit and return 404' do
        expect(response).to have_http_status(:not_found)
        expect(Commit.count).to eq 0
      end
    end
  end
end
