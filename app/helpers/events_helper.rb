module EventsHelper
  def action_buttons(event)
    return "" unless current_member.admin?
    if event.approved?
      (link_to 'Edit', edit_event_path(event), class: 'btn btn-mini') +
      (link_to 'Destroy', event_path(event), :method => :delete, :confirm => 'Are you sure?', class: 'btn btn-mini btn-danger')
    else
      button_to 'Approve', approve_event_path(event), :method => 'put', class: 'btn btn-mini'
    end
  end
end
