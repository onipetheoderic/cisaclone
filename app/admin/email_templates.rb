ActiveAdmin.register EmailTemplate do

	permit_params :name, :subject, :sender_email_address, :variables, :content
menu parent: 'Site Settings'
    index do
        selectable_column
        column :name
        column :subject
        column :sender_email_address
        actions
    end

    form do |f|
		f.inputs "Email Templates" do
	      if controller.action_name == 'new'
	      	f.input :name
	      else
	      	f.input :name , :input_html => { :disabled => true }
	      end
	      f.input :sender_email_address , label: 'Sender Email Id'
	      f.input :subject
	      if controller.action_name == 'new'
	      	f.input :variables
	      else
	      	f.input :variables , :input_html => { :disabled => true }
	      end
	      f.input :content , :as => :ckeditor
	    end
	    f.actions
	end

     show do
	    panel "Email Templates" do
	      div :style=>"padding-top:20px" do
	        columns do
	          column span: 4 do
	            table do
	              tr do
	                td h4 b "Name:"
	                td width:"80%" do h4 email_template.name end
	              end
	              tr do
	                td h4 b "Sender Email Id:"
	                td width:"80%" do h4 email_template.sender_email_address end
	              end
	              if email_template.content
		        	tr do
	                  td h4 b "Content:"
	                  td width:"80%" do h4 email_template.content.html_safe end
	                end
	              end
	      		  tr do
	                td h4 b "Subject:"
	                td width:"80%" do h4 email_template.subject end
              	  end
	              tr do
	                td h4 b "Variables:"
	                td width:"80%" do h4 email_template.variables end
	              end
	            end
	          end
	        end
	      end
	    end
	end


end
