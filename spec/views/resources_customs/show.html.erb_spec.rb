require 'rails_helper'

RSpec.describe "resources_customs/show", type: :view do
  before(:each) do
    @resources_custom = assign(:resources_custom, ResourcesCustom.create!(
      :title => "Title",
      :description => "MyText",
      :published => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/false/)
  end
end
