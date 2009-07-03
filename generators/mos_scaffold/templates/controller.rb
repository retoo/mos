class <%= controller_class_name %>Controller < ApplicationController
  make_resourceful do
    actions :all
  end

  protected

  def check_rights
    case action_name
    when "index"
      needs_right :<%= singular_name %>_index
    when "show"
      needs_right :<%= singular_name %>_show
    when "update", "edit", "new", "create"
      needs_right :<%= singular_name %>_mgt
    when "destroy"
      needs_right :<%= singular_name %>_destroy
    else
      raise "unknown action #{action_name}"
    end
  end
end
