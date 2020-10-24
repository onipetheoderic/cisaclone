ActiveAdmin.register Seo do
  permit_params :name, :content
  menu parent: 'Site Settings'

end
