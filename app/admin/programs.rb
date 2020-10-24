ActiveAdmin.register Program do

  permit_params :title,:starts_at, :ends_at, :short_description, :image, :location, :published, :active, :upcoming, :description, :goal, :completed

  controller do
    defaults :finder => :find_by_slug
  end

  index do
    selectable_column
      column 'Image' do |program|
        image_tag(program.image.url, style: 'width:150px')
      end
      column :title
      column :starts_at
      column :ends_at
      column :title
      column :goal
      column :raised
      column :location
      column :completed
      column :published
      column :active
      column :upcoming
      actions
  end

  filter :title
  filter :location
  filter :published
  filter :active
  filter :upcoming


  form do |f|
      f.inputs "Program Details" do
        f.input :title
        f.input :location
        f.input :goal
        f.input :completed
        f.input :short_description, as: :ckeditor
        f.input :description, as: :ckeditor
        f.input :starts_at, as: :datepicker
        f.input :ends_at, as: :datepicker
        f.input :published
        f.input :active
        f.input :upcoming
        f.input :image, as: :file, label: 'Image'
      end
      f.actions
  end


  # # show do
  # #    panel "Program Details" do
  # #        div style: 'padding-top:20px' do
  # #            columns do
  # #               column span: 1 do
  # #                   span  do
  # #                     image_tag(program.image.url, style: 'width:150px;')
  # #                   end
  # #               end
  # #
  # #                 column span: 4 do
  # #                     table do
  # #                         tr do
  # #                             td h4 b "Location:"
  # #                             td width:"80%" do h4 program.location end
  # #                         end
  # #                         tr do
  # #                             td h4 b "Display Order:"
  # #                             td width:"80%" do h4 program.short_description end
  # #                         end
  # #                     end
  # #                 end
  # #            end
  # #        end
  # #    end
  #
  # end

end
