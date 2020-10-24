require 'rails_helper'

RSpec.describe "resources_customs/edit", type: :view do
  before(:each) do
    @resources_custom = assign(:resources_custom, ResourcesCustom.create!(
      :title => "MyString",
      :description => "MyText",
      :published => false
    ))
  end

  it "renders the edit resources_custom form" do
    render

    assert_select "form[action=?][method=?]", resources_custom_path(@resources_custom), "post" do

      assert_select "input[name=?]", "resources_custom[title]"

      assert_select "textarea[name=?]", "resources_custom[description]"

      assert_select "input[name=?]", "resources_custom[published]"
    end
  end
end
