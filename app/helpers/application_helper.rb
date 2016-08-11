module ApplicationHelper

  def render_modal(opts)
    render layout: 'layouts/show_modal', partial: opts.delete(:partial), locals: {modal_size: ''}.merge(opts.delete(:locals) || {})
  end

  def enum_to_options(enum, prefix=nil)
    Hash[enum.map { |item| [enum_to_human(item[0], prefix), item[0]] }]
  end

  def enum_to_human(enum, prefix = nil)
    I18n.t(prefix.present? ? "enum.#{prefix}.#{enum}" : "enum.#{enum}", default: enum.to_s.humanize) unless enum.blank?
  end

end
