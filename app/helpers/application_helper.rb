module ApplicationHelper
  def render_modal(opts)
    render layout: 'layouts/show_modal', partial: opts.delete(:partial), locals: {modal_size: ''}.merge(opts.delete(:locals) || {})
  end
end
