ActiveAdmin.register SliderContent do
  menu parent: 'Content Management'
      permit_params :caption, :display_order, :banner, :rider

      index do
        selectable_column
          column 'Logo' do |slider_content|
            image_tag(slider_content.banner.url, style: 'width:150px')
          end
          column :caption
          column :display_order
          actions
      end

      filter :caption
      filter :rider


      form do |f|
          f.inputs "Slide Details" do
            f.input :caption, as: :ckeditor
            f.input :rider, as: :ckeditor
            f.input :display_order
            f.input :banner, as: :file, label: 'Banner'
          end
          f.actions
      end


      show do
         panel "Slide Details" do
             div style: 'padding-top:20px' do
                 columns do
                    column span: 1 do
                        span  do
                          image_tag(slider_content.banner.url, style: 'width:150px;')
                        end
                    end

                      column span: 4 do
                          table do
                              tr do
                                  td h4 b "Caption:"
                                  td width:"80%" do h4 slider_content.caption end
                              end
                              tr do
                                  td h4 b "Rider:"
                                  td width:"80%" do h4 slider_content.rider end
                              end
                              tr do
                                  td h4 b "Display Order:"
                                  td width:"80%" do h4 slider_content.display_order end
                              end
                          end
                      end
                 end
             end
         end

      end
end
