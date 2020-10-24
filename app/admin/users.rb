ActiveAdmin.register User do
  filter :firstname_or_lastname_cont , label: 'Firstname or Lastname Like'
  	filter :email_cont, label: "Email Like"
  	filter :created_at , label: 'Creation Date' , as: :date_range

    controller do
      defaults :finder => :find_by_slug
    end

  	index do
  		selectable_column
  		column :id
  		column :firstname
  		column :lastname
  		column :email
  		column :phone
  		actions
  	end

end
