# frozen_string_literal: true

class ApiController < ActionController::API
  include ActionController::Serialization

  def render_paginate_collection(opts)
    meta = opts[:meta] || {}
    data = opts[:json].page(page).per(per_page)
    root = opts[:root] || :data
    if meta[:page].blank?
      meta[:page] = {
        number: data.current_page,
        size:   per_page,
        total:  data.total_pages
      }
    end
    render(opts.merge(json: data, meta: meta, root: root))
  end

  def per_page
    params.fetch(:per_page, 30).to_i
  end

  def page
    params.fetch(:page, 1).to_i
  end
end
