# README
a) nested forms
B) nested resources
c) asset pipeline
d) OAuth
e) CSS
f) Associations
g) use username instead of id

Summary:
Bill-labs is a company to provide telecommunications savings to medium-sized companies. The website will present the services and allow for communication with the company. It will also have a customer portal for submitting documents and accompanying progress. I intend to allow log in with linkedin

desired outcome:
- A nice home page explaining the service. Later to be migrated to Javascript
- A Navbar that allows for signing in/signing up/log out
- A customer's portal
	- on this portal , he'll be able to submit requests and monitor their progress
	- I intend to allow for uploading of files (blob database)
- An admin portal
	- here the admin will be able to download documents and update progress for user
	- admin will also be able to send communications to the customer
	- log on all activities

* Ruby version
	2.6.3

* database tables:
	- users
		- name
		- phone
		- company
		- e-mail
		- position
		- timestamps
		- role (for accesses, both the customer's and the admins)
	- roles (which will be used for access)
		- role
	- companies (has_many users)
		- name
		- financial situation
		- sector
	- requests (belong_to company, and also to user through company, has_many products)
		- some financials (not sure yet, maybe balance of products, not sure if I need to create 				fiels or just sql sums and counts)
		- dates
		- status
		- user that made the request
		- admin responsible
	- products (IP VPN for now)
	- product types * maybe later
	- product subtypes * maybe later
	- product subsubtypes * maybe later
	- product bandwidths * maybe later
	- product location_type * maybe later
	- product/type/etc prices * maybe later
	- log (to monitor request progress and present to customer/admin)
		- event description
	- documents (belongs to requests, of course)
		- Blob (don't know how to do it)
		- dates
		* encrypt to protect the company

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions
	- just bundle install and rails s, you should be directed to the root_path



