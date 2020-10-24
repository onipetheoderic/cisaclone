require 'rails_helper'

RSpec.describe "resources_customs/index", type: :view do
  before(:each) do
    assign(:resources_customs, [
      ResourcesCustom.create!(
        :title => "Title",
        :description => "MyText",
        :published => false
      ),
      ResourcesCustom.create!(
        :title => "Title",
        :description => "MyText",
        :published => false
      )
    ])
  end

  it "renders a list of resources_customs" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
