- create static controller - ok
- create each table with proper associations
- run migrations
- define validations on each table
- create stupid home page - OK

* create navbar with sign-in, etc
* create sessions controller
* create sign-in page
* create sign-up page
* create OAuth for linkedin(maybe facebook)
* create home for customer
* create home for admin
* fix all routes for user, including namespace
* use username for address
* create "make request"
* create request portal customer
* create request portal admin
* implement documents upload (customer/admin)
* implement documents dowload (customer/admin)
* implement progress

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
	- sector
		- sector
	- status
		- status

	- requests (belong_to company, and also to user through company, has_many products)
		- some financials (not sure yet, maybe balance of products, not sure if I need to create 				fiels or just sql sums and counts)
		- dates
		- status
		- user that made the request
		- admin responsible
	- status
		- status
	- products_requests (join table)
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

	- communications (belongs_to request, of course)
