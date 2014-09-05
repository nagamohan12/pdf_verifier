require 'rails_helper'

RSpec.describe "projects/edit", :type => :view do
  before(:each) do
    @project = assign(:project, Project.create!(
      :organization_id => 1,
      :name => "MyString",
      :description => "MyText",
      :input_folder => "MyString",
      :output_folder => "MyString",
      :run_frequency => "MyString"
    ))
  end

  it "renders the edit project form" do
    render

    assert_select "form[action=?][method=?]", project_path(@project), "post" do

      assert_select "input#project_organization_id[name=?]", "project[organization_id]"

      assert_select "input#project_name[name=?]", "project[name]"

      assert_select "textarea#project_description[name=?]", "project[description]"

      assert_select "input#project_input_folder[name=?]", "project[input_folder]"

      assert_select "input#project_output_folder[name=?]", "project[output_folder]"

      assert_select "input#project_run_frequency[name=?]", "project[run_frequency]"
    end
  end
end
