ActiveAdmin.register Resource do

  permit_params :title, :description, :published

  index do
    selectable_column

    column :title
      column :published
      actions
  end

  filter :name

  form do |f|
      f.inputs "Resource Details" do
        f.input :title

        f.input :description, as: :ckeditor
        f.input :published
      end
      f.actions
  end

end
