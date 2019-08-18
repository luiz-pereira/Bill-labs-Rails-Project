# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Role.create({role: "admin_analyst"})
Role.create({role: "admin_owner"})
Role.create({role: "admin_master"})
Role.create({role: "customer_owner"})
Role.create({role: "customer_admin"})
Role.create({role: "customer_view_only"})

User.create({name: 'Luiz Pereira',username: 'luizpereira',email: 'luizfper@bill-labs.com',role: Role.find_by(role: 'admin_owner'),company: Company.find_by(name: 'Bill-Labs'),position: 'owner',password: '123'})
User.create({name: 'Erika Boas',username: 'erikaboas',email: 'erikaboas@bill-labs.com',role: Role.find_by(role: 'admin_master'),company: Company.find_by(name: 'Bill-Labs'),position: 'director',password: '123'})
User.create({name: 'Omer Buranga',username: 'omerburanga',email: 'omerburanga@bill-labs.com',role: Role.find_by(role: 'admin_analyst'),company: Company.find_by(name: 'Bill-Labs'),position: 'analyst',password: '123'})

Product.create ({name: "IP VPN"})
Product.create ({name: "1FL Business Lines"})
Product.create ({name: "PRI"})
Product.create ({name: "Internet Dedicated"})
Product.create ({name: "Internet"})

Sector.create({sector: 'Telecommunications'})
Sector.create({sector: 'Telecommunications Consultancy'})

Company.create({name: 'Luiz Co.', sector: Sector.find_by(sector:'Telecommunications')})
Company.create({name: 'Bill-Labs', sector: Sector.find_by(sector:'Telecommunications Consultancy')})

Status.create({status: 'New'})
Status.create({status: 'Received'})
Status.create({status: 'In progress'})
Status.create({status: 'Pending documentation'})
Status.create({status: 'Report complete'})
Status.create({status: 'Sent to provider'})
Status.create({status: 'Finished'})

