require 'rails_helper'

RSpec.describe "resources_customs/new", type: :view do
  before(:each) do
    assign(:resources_custom, ResourcesCustom.new(
      :title => "MyString",
      :description => "MyText",
      :published => false
    ))
  end

  it "renders new resources_custom form" do
    render

    assert_select "form[action=?][method=?]", resources_customs_path, "post" do

      assert_select "input[name=?]", "resources_custom[title]"

      assert_select "textarea[name=?]", "resources_custom[description]"

      assert_select "input[name=?]", "resources_custom[published]"
    end
  end
end
