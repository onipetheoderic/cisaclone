ActiveAdmin.register Career do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :title, :skills, :duty, :description, :published, :closed, :responsibility, :slug

controller do
  defaults :finder => :find_by_slug
end

index do
  selectable_column
    column :title
    column :published
    column :closed
    actions
end

filter :title

form do |f|
    f.inputs "Job Details" do
      f.input :title
      f.input :description, as: :ckeditor
      f.input :responsibility, as: :ckeditor
      f.input :duty, as: :ckeditor
      f.input :skills, as: :ckeditor
      f.input :published
      f.input :closed
    end
    f.actions
end


end
