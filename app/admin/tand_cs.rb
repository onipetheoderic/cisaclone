ActiveAdmin.register TandC do
  permit_params  :content
  menu parent: 'Content Management', label: "Terms & Conditions"

# truncate resource.description, length: 200

index do
  selectable_column
  column :id
    column 'Content' do |tandc|
      truncate tandc.content, length: 100
    end
    column :created_at
    column :updated_at
    actions
end

  form do |f|
      f.inputs "Terms & Conditions" do
        f.input :content, as: :ckeditor
      end
      f.actions
  end

end
