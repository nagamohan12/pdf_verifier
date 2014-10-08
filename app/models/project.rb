class Project < ActiveRecord::Base
  belongs_to :organization
  has_many :test_runs
  has_many :pdf_xml_mappings
  has_many :reports , through: :test_runs
  has_one :last_test_run, -> { run_at_desc }, class_name: "TestRun"
  #has_many :last_runs, -> { last_run_at }, class_name: 'TestRun'
 
  accepts_nested_attributes_for :pdf_xml_mappings, allow_destroy: true
  # validates :next_run,
  # date: { after: Proc.new { Date.today }, message: 'must be after today' },
  # on: :create, on: :update
  validates_date :next_run, :on => :create, :on => :update, :on_or_after => :today,  message: 'must be after today'
  validates_presence_of :organization_id, :name, :pdf_folder,:input_folder
  validates_format_of :name, :with => /[\w \.\-@]+/,
  :message => "can only contain letters and numbers."
  validates_length_of :name, :within => 3..50, :too_long => "name is too long", :too_short => "name is too short"
  validates_uniqueness_of :name, scope: :organization_id

  def test_last_ran
  	self.last_test_run.run_at
  end

  def last_test_failed
  	self.last_test_run.failed > 0 ? false : true
  end

end
