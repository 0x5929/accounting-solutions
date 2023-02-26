ActiveAdmin.register Document do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :user_id, :file_name, :file_location
  #
  # or
  #
  # permit_params do
  #   permitted = [:user_id, :file_name, :file_location]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  permit_params :user_id, :file_name, :file_location
end
