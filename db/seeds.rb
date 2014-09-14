# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Create Organization
@org = Organization.create(name: 'Techsophy')

#create Users
@admin = User.create(email: 'admin@test.com',username: 'Admin',password: 'test@123',role: 'admin',organization_id: @org.id)
@super_admin = User.create(email: 'super_admin@test.com',username: 'Super Admin',password: 'test@123',role: 'super_admin',organization_id: @org.id)
@user = User.create(email: 'user@test.com',username: 'Test',password: 'test@123',role: 'registered',organization_id: @org.id)

#create Projects
project_name = ['Appolo','Medicare','techrains','softzone','care','suraksha','rabbit','pharmacy','janasena','bloodbank']
10.times do |i| 
	Project.create(organization_id: @org.id,name: project_name[i],input_folder: 'username/'+project_name[i]+'/xml',pdf_folder: 'usernmae/'+project_name[i]+'/pdf',active: true, run_frequency: 'daily', first_run: "#{Time.now}", next_run: "#{Time.now}")
end

#create Test Runs
Project.all.each do |project|
	2.times do |i|
		test_run = TestRun.create(project_id: project.id , status: 'success', total: i, failures: 0 , run_at: i.day.from_now)
		i.times do |r|
			Report.create(pdf_name: project.name+r.to_s+'.pdf', xml_node: 'xml_node'+i.to_s+r.to_s, reason: nil, test_run_id: test_run.id, is_passed: true)
		end
	end
	2.times do |i|
		test_run = TestRun.create(project_id: project.id , status: 'failure', total: i, failures: i , run_at: i.day.from_now)
		i.times do |r|
			Report.create(pdf_name: project.name+r.to_s+'.pdf', xml_node: 'xml_node'+i.to_s+r.to_s, reason: 'failed'+project.name+i.to_s+r.to_s+'a-z', test_run_id: test_run.id, is_passed: false)
		end
	end
end
