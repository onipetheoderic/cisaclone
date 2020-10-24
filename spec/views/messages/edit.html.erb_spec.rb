require 'rails_helper'

RSpec.describe "messages/edit", type: :view do
  before(:each) do
    @message = assign(:message, Message.create!(
      :first_name => "MyString",
      :last_name => "MyString",
      :subject => "MyString",
      :message => "MyText"
    ))
  end

  it "renders the edit message form" do
    render

    assert_select "form[action=?][method=?]", message_path(@message), "post" do

      assert_select "input[name=?]", "message[first_name]"

      assert_select "input[name=?]", "message[last_name]"

      assert_select "input[name=?]", "message[subject]"

      assert_select "textarea[name=?]", "message[message]"
    end
  end
end
