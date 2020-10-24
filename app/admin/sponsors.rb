ActiveAdmin.register Sponsor do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
menu parent: 'Content Management'
    permit_params :name, :display_order, :logo, :url

    index do
      selectable_column
        column 'Logo' do |sponsor|
          image_tag(sponsor.logo.url, style: 'width:150px')
        end
        column :name
        column :url
        column :display_order
        actions
    end

    filter :name
    filter :url


    form do |f|
        f.inputs "Sponsor Details" do
          f.input :name
          f.input :url
          f.input :display_order
          f.input :logo, as: :file, label: 'Logo'
        end
        f.actions
    end


    show do
       panel "Sponsor Details" do
           div style: 'padding-top:20px' do
               columns do
                  column span: 1 do
                      span  do
                        image_tag(sponsor.logo.url, style: 'width:150px;')
                      end
                  end

                    column span: 4 do
                        table do
                            tr do
                                td h4 b "Url:"
                                td width:"80%" do h4 sponsor.url end
                            end
                            tr do
                                td h4 b "Display Order:"
                                td width:"80%" do h4 sponsor.display_order end
                            end
                        end
                    end
               end
           end
       end

    end

end
