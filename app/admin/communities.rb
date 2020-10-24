ActiveAdmin.register Community do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :name, :short_description
  menu parent: 'Content Management'
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

form do |f|
  f.inputs "Community Details" do
    f.input :name
    f.input :short_description, as: :ckeditor
  end
  f.actions
end

end
