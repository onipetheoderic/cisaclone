ActiveAdmin.register PrivacyPolicy do
  permit_params  :content
  menu parent: 'Content Management', label: "Privacy Policy"


index do
  selectable_column
  column :id
    column 'Content' do |policy|
      truncate policy.content, length: 100
    end
    column :created_at
    column :updated_at
    actions
end

  form do |f|
      f.inputs "Privacy Policy Content" do
        f.input :content, as: :ckeditor
      end
      f.actions
  end
end
