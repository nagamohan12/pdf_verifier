require 'rails_helper'

RSpec.describe "projects/index", :type => :view do
  before(:each) do
    assign(:projects, [
      Project.create!(
        :organization_id => 1,
        :name => "Name",
        :description => "MyText",
        :input_folder => "Input Folder",
        :output_folder => "Output Folder",
        :run_frequency => "Run Frequency"
      ),
      Project.create!(
        :organization_id => 1,
        :name => "Name",
        :description => "MyText",
        :input_folder => "Input Folder",
        :output_folder => "Output Folder",
        :run_frequency => "Run Frequency"
      )
    ])
  end

  it "renders a list of projects" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Input Folder".to_s, :count => 2
    assert_select "tr>td", :text => "Output Folder".to_s, :count => 2
    assert_select "tr>td", :text => "Run Frequency".to_s, :count => 2
  end
end
