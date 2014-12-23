# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(first_name: "Lloyd", last_name: "Larkin", email: "spq2461@gmail.com", phonenumber: "(555) 555-5555", password: "password", agency_id: "1", created_at: Time.now, updated_at: Time.now, active: true)
User.create(first_name: "Rheem", last_name: "Marketing", email: "spq24@drexel.edu", phonenumber: "(555) 555-5555", password: "password", brand_id: "1", created_at: Time.now, updated_at: Time.now, active: true)
User.create(first_name: "Jeff", last_name: "Fante", email: "steve@hvacgaspedal.com", phonenumber: "(555) 555-5555", password: "password", company_id: "1", created_at: Time.now, updated_at: Time.now, active: true)
User.create(first_name: "Steve", last_name: "Quatrani", email: "stevesem@hvacgaspedal.com", phonenumber: "(555) 555-5555", password: "password", kinertia_employee: true, cl_user: true, created_at: Time.now, updated_at: Time.now, active: true)

Company.create(company_name: "Fante's hvac", address_one: "35 Charleston Rd.", city: "Willingboro", state: "NJ", postcode: "08046", country: "USA", phonenumber: "(215) 205-5322", admin_notes: "notes and stuff", website_url: "www.fanteshvac.com", google_account: "emails@fanteshvac.com", google_password: "ocnj844", google_maps_status: "Verified Complete", google_maps_notes: "notes and stuff", google_maps_url: "https://www.google.com/+FantesPlumbingHeatingAirIncWillingboro")

Agency.create(company_name: "P&N Distribution", address_one: "306 Connecticut Drive", address_two: "Suite 200", city: "Burlington Township", state: "NJ", postcode: "(609) 835-1512")


#Agency.create(company_name:"P&N Distribution", address_one: "306 Connecticut Drive", address_two: "Suite 200", city: "Burlington Township", state: "NJ", postcode: "08046", country: "USA", phonenumber: "(609) 835-1512", created_at: Time.now, updated_at: Time.now)

#Brand.create(company_name:"Rheem Manufacturing", address_one: "1100 Abernathy Rd NE", address_two: "Suite 299", city: "Atlanta", state: "GA", postcode: "30328", country: "USA", phonenumber: "(770) 351-3000", created_at: Time.now, updated_at: Time.now)


Opportunity.create(customer_code: "www.fanteshvac.com", tracking_number: "(609) 952-6271", target_number: "(215) 205-5322", customer_name: "Fante's HVAC", customer_address: "AL", call_recording_link: "https://kinertia.calltrackingapp.com/api/v1/accounts/8146/calls/CAa48e71059beaaf876b51d474e469f815/recording", caller_phone_number: "(513) 381-3575", duration: "457", call_status: "completed", opportunity_name: "const personnel", company_id: "1")
Opportunity.create(customer_code: "www.fanteshvac.com", tracking_number: "(609) 952-6271", target_number: "(215) 205-5322", customer_name: "Fante's HVAC", customer_address: "AL", call_recording_link: "https://kinertia.calltrackingapp.com/api/v1/accounts/8146/calls/CAa48e71059beaaf876b51d474e469f815/recording", caller_phone_number: "(513) 381-3575", duration: "457", call_status: "completed", opportunity_name: "const personnel", company_id: "1")
Opportunity.create(customer_code: "www.fanteshvac.com", tracking_number: "(609) 952-6271", target_number: "(215) 205-5322", customer_name: "Fante's HVAC", customer_address: "AL", call_recording_link: "https://kinertia.calltrackingapp.com/api/v1/accounts/8146/calls/CAa48e71059beaaf876b51d474e469f815/recording", caller_phone_number: "(513) 381-3575", duration: "457", call_status: "completed", opportunity_name: "const personnel", company_id: "1")
Opportunity.create(customer_code: "www.fanteshvac.com", tracking_number: "(609) 952-6271", target_number: "(215) 205-5322", customer_name: "Fante's HVAC", customer_address: "AL", call_recording_link: "https://kinertia.calltrackingapp.com/api/v1/accounts/8146/calls/CAa48e71059beaaf876b51d474e469f815/recording", caller_phone_number: "(513) 381-3575", duration: "457", call_status: "completed", opportunity_name: "const personnel", company_id: "1")
Opportunity.create(customer_code: "www.fanteshvac.com", tracking_number: "(609) 952-6271", target_number: "(215) 205-5322", customer_name: "Fante's HVAC", customer_address: "AL", call_recording_link: "https://kinertia.calltrackingapp.com/api/v1/accounts/8146/calls/CAa48e71059beaaf876b51d474e469f815/recording", caller_phone_number: "(513) 381-3575", duration: "457", call_status: "completed", opportunity_name: "const personnel", company_id: "1")
Opportunity.create(customer_code: "www.fanteshvac.com", tracking_number: "(609) 952-6271", target_number: "(215) 205-5322", customer_name: "Fante's HVAC", customer_address: "AL", call_recording_link: "https://kinertia.calltrackingapp.com/api/v1/accounts/8146/calls/CAa48e71059beaaf876b51d474e469f815/recording", caller_phone_number: "(513) 381-3575", duration: "457", call_status: "completed", opportunity_name: "const personnel", company_id: "1")
Opportunity.create(customer_code: "www.fanteshvac.com", tracking_number: "(609) 952-6271", target_number: "(215) 205-5322", customer_name: "Fante's HVAC", customer_address: "AL", call_recording_link: "https://kinertia.calltrackingapp.com/api/v1/accounts/8146/calls/CAa48e71059beaaf876b51d474e469f815/recording", caller_phone_number: "(513) 381-3575", duration: "457", call_status: "completed", opportunity_name: "const personnel", company_id: "1")
Opportunity.create(customer_code: "www.fanteshvac.com", tracking_number: "(609) 952-6271", target_number: "(215) 205-5322", customer_name: "Fante's HVAC", customer_address: "AL", call_recording_link: "https://kinertia.calltrackingapp.com/api/v1/accounts/8146/calls/CAa48e71059beaaf876b51d474e469f815/recording", caller_phone_number: "(513) 381-3575", duration: "457", call_status: "completed", opportunity_name: "const personnel", company_id: "1")
Opportunity.create(customer_code: "www.fanteshvac.com", tracking_number: "(609) 952-6271", target_number: "(215) 205-5322", customer_name: "Fante's HVAC", customer_address: "AL", call_recording_link: "https://kinertia.calltrackingapp.com/api/v1/accounts/8146/calls/CAa48e71059beaaf876b51d474e469f815/recording", caller_phone_number: "(513) 381-3575", duration: "457", call_status: "completed", opportunity_name: "const personnel", company_id: "1")
Opportunity.create(customer_code: "www.fanteshvac.com", tracking_number: "(609) 952-6271", target_number: "(215) 205-5322", customer_name: "Fante's HVAC", customer_address: "AL", call_recording_link: "https://kinertia.calltrackingapp.com/api/v1/accounts/8146/calls/CAa48e71059beaaf876b51d474e469f815/recording", caller_phone_number: "(513) 381-3575", duration: "457", call_status: "completed", opportunity_name: "const personnel", company_id: "1")
Opportunity.create(customer_code: "www.fanteshvac.com", tracking_number: "(609) 952-6271", target_number: "(215) 205-5322", customer_name: "Fante's HVAC", customer_address: "AL", call_recording_link: "https://kinertia.calltrackingapp.com/api/v1/accounts/8146/calls/CAa48e71059beaaf876b51d474e469f815/recording", caller_phone_number: "(513) 381-3575", duration: "457", call_status: "completed", opportunity_name: "const personnel", company_id: "1")
Opportunity.create(customer_code: "www.fanteshvac.com", tracking_number: "(609) 952-6271", target_number: "(215) 205-5322", customer_name: "Fante's HVAC", customer_address: "AL", call_recording_link: "https://kinertia.calltrackingapp.com/api/v1/accounts/8146/calls/CAa48e71059beaaf876b51d474e469f815/recording", caller_phone_number: "(513) 381-3575", duration: "457", call_status: "completed", opportunity_name: "const personnel", company_id: "1")
Opportunity.create(customer_code: "www.fanteshvac.com", tracking_number: "(609) 952-6271", target_number: "(215) 205-5322", customer_name: "Fante's HVAC", customer_address: "AL", call_recording_link: "https://kinertia.calltrackingapp.com/api/v1/accounts/8146/calls/CAa48e71059beaaf876b51d474e469f815/recording", caller_phone_number: "(513) 381-3575", duration: "457", call_status: "completed", opportunity_name: "const personnel", company_id: "1")
Opportunity.create(customer_code: "www.fanteshvac.com", tracking_number: "(609) 952-6271", target_number: "(215) 205-5322", customer_name: "Fante's HVAC", customer_address: "AL", call_recording_link: "https://kinertia.calltrackingapp.com/api/v1/accounts/8146/calls/CAa48e71059beaaf876b51d474e469f815/recording", caller_phone_number: "(513) 381-3575", duration: "457", call_status: "completed", opportunity_name: "const personnel", company_id: "1")
Opportunity.create(customer_code: "www.fanteshvac.com", tracking_number: "(609) 952-6271", target_number: "(215) 205-5322", customer_name: "Fante's HVAC", customer_address: "AL", call_recording_link: "https://kinertia.calltrackingapp.com/api/v1/accounts/8146/calls/CAa48e71059beaaf876b51d474e469f815/recording", caller_phone_number: "(513) 381-3575", duration: "457", call_status: "completed", opportunity_name: "const personnel", company_id: "1")
Opportunity.create(customer_code: "www.fanteshvac.com", tracking_number: "(609) 952-6271", target_number: "(215) 205-5322", customer_name: "Fante's HVAC", customer_address: "AL", call_recording_link: "https://kinertia.calltrackingapp.com/api/v1/accounts/8146/calls/CAa48e71059beaaf876b51d474e469f815/recording", caller_phone_number: "(513) 381-3575", duration: "457", call_status: "completed", opportunity_name: "const personnel", company_id: "1")
Opportunity.create(customer_code: "www.fanteshvac.com", tracking_number: "(609) 952-6271", target_number: "(215) 205-5322", customer_name: "Fante's HVAC", customer_address: "AL", call_recording_link: "https://kinertia.calltrackingapp.com/api/v1/accounts/8146/calls/CAa48e71059beaaf876b51d474e469f815/recording", caller_phone_number: "(513) 381-3575", duration: "457", call_status: "completed", opportunity_name: "const personnel", company_id: "1")
Opportunity.create(customer_code: "www.fanteshvac.com", tracking_number: "(609) 952-6271", target_number: "(215) 205-5322", customer_name: "Fante's HVAC", customer_address: "AL", call_recording_link: "https://kinertia.calltrackingapp.com/api/v1/accounts/8146/calls/CAa48e71059beaaf876b51d474e469f815/recording", caller_phone_number: "(513) 381-3575", duration: "457", call_status: "completed", opportunity_name: "const personnel", company_id: "1")
Opportunity.create(customer_code: "www.fanteshvac.com", tracking_number: "(609) 952-6271", target_number: "(215) 205-5322", customer_name: "Fante's HVAC", customer_address: "AL", call_recording_link: "https://kinertia.calltrackingapp.com/api/v1/accounts/8146/calls/CAa48e71059beaaf876b51d474e469f815/recording", caller_phone_number: "(513) 381-3575", duration: "457", call_status: "completed", opportunity_name: "const personnel", company_id: "1")
Opportunity.create(customer_code: "www.fanteshvac.com", tracking_number: "(609) 952-6271", target_number: "(215) 205-5322", customer_name: "Fante's HVAC", customer_address: "AL", call_recording_link: "https://kinertia.calltrackingapp.com/api/v1/accounts/8146/calls/CAa48e71059beaaf876b51d474e469f815/recording", caller_phone_number: "(513) 381-3575", duration: "457", call_status: "completed", opportunity_name: "const personnel", company_id: "1")
Opportunity.create(customer_code: "www.fanteshvac.com", customer_name: "dorota", lead_email: "spq2461@gmail.com", lead_interest: "air conditioning", lead_phone_number: "(215) 205-5322", lead_comments: "We are interested in installing a new furnace as well as new AC system. Can I please schedule a home visit for cost estimate? Do you offer a military discount? Also, do you offer financing? Thank you Looking forward to hearing from you.", company_id: "1")
Opportunity.create(customer_code: "www.fanteshvac.com", customer_name: "dorota", lead_email: "spq2461@gmail.com", lead_interest: "air conditioning", lead_phone_number: "(215) 205-5322", lead_comments: "We are interested in installing a new furnace as well as new AC system. Can I please schedule a home visit for cost estimate? Do you offer a military discount? Also, do you offer financing? Thank you Looking forward to hearing from you.", company_id: "1")
Opportunity.create(customer_code: "www.fanteshvac.com", customer_name: "dorota", lead_email: "spq2461@gmail.com", lead_interest: "air conditioning", lead_phone_number: "(215) 205-5322", lead_comments: "We are interested in installing a new furnace as well as new AC system. Can I please schedule a home visit for cost estimate? Do you offer a military discount? Also, do you offer financing? Thank you Looking forward to hearing from you.", company_id: "1")
Opportunity.create(customer_code: "www.fanteshvac.com", customer_name: "dorota", lead_email: "spq2461@gmail.com", lead_interest: "air conditioning", lead_phone_number: "(215) 205-5322", lead_comments: "We are interested in installing a new furnace as well as new AC system. Can I please schedule a home visit for cost estimate? Do you offer a military discount? Also, do you offer financing? Thank you Looking forward to hearing from you.", company_id: "1")
Opportunity.create(customer_code: "www.fanteshvac.com", customer_name: "dorota", lead_email: "spq2461@gmail.com", lead_interest: "air conditioning", lead_phone_number: "(215) 205-5322", lead_comments: "We are interested in installing a new furnace as well as new AC system. Can I please schedule a home visit for cost estimate? Do you offer a military discount? Also, do you offer financing? Thank you Looking forward to hearing from you.", company_id: "1")
Opportunity.create(customer_code: "www.fanteshvac.com", customer_name: "dorota", lead_email: "spq2461@gmail.com", lead_interest: "air conditioning", lead_phone_number: "(215) 205-5322", lead_comments: "We are interested in installing a new furnace as well as new AC system. Can I please schedule a home visit for cost estimate? Do you offer a military discount? Also, do you offer financing? Thank you Looking forward to hearing from you.", company_id: "1")