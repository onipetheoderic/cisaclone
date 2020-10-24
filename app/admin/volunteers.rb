ActiveAdmin.register Volunteer do
  permit_params :full_name, :email, :telephone, :facebook_handle, :twitter_handle, :instagram_handle, :photo, :address, :description
    menu parent: 'Content Management'

  index do
    selectable_column
      column 'Photo' do |volunteer|
        image_tag(volunteer.photo.url, style: 'width:150px')
      end
      column :full_name
      column :email
      column :telephone
      column :facebook_handle
      column :twitter_handle
      column :instagram_handle
      actions
  end

  filter :full_name
  filter :email
  filter :telephone


  form do |f|
      f.inputs "Volunteer Details" do
        f.input :full_name
        f.input :email
        f.input :telephone
        f.input :description
        f.input :photo, as: :file, label: 'Photo'
        f.input :address
        f.input :facebook_handle
        f.input :twitter_handle
        f.input :instagram_handle

      end
      f.actions
  end

  show do
     panel "Volunteer Details" do
         div style: 'padding-top:20px' do
             columns do
                column span: 1 do
                    span  do
                      image_tag(volunteer.photo.url, style: 'width:150px;')
                    end
                end

                  column span: 4 do
                      table do
                          tr do
                              td  h4 b "Full Name:"
                              td  h4 volunteer.full_name
                          end
                          tr do
                            td h4 b "Email:"
                            td  h4 volunteer.email
                          end

                          tr do
                            td h4 b "Telephone:"
                            td h4 volunteer.telephone
                          end

                          tr do
                            td h4 b "Address:"
                            td h4 volunteer.address
                          end

                          tr do
                            td h4 b "Description:"
                            td h4 volunteer.description
                          end

                          tr do
                            td h4 b "Twitter:"
                            td h4 volunteer.twitter_handle

                          end

                          tr do
                            td h4 b "Facebook:"
                            td h4 volunteer.facebook_handle
                          end
                          tr do
                            td h4 b "Instagram:"
                            td h4 volunteer.instagram_handle
                          end
                      end # end table
                  end # end column 4
             end # end columns
         end # end div
     end #end panel

  end  # end of show

end
