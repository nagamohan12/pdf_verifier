require 'rails_helper'

RSpec.describe "projects/show", :type => :view do
  before(:each) do
    @project = assign(:project, Project.create!(
      :organization_id => 1,
      :name => "Name",
      :description => "MyText",
      :input_folder => "Input Folder",
      :output_folder => "Output Folder",
      :run_frequency => "Run Frequency"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Input Folder/)
    expect(rendered).to match(/Output Folder/)
    expect(rendered).to match(/Run Frequency/)
  end
end
