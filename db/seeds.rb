# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Admin.create(username: 'admin', email: 'admin@example.com', password: 'password')
BillingInterval.create(billing_interval_name: 'Yearly', interval_month: '1')
BillingInterval.create(billing_interval_name: 'Yearly', interval_month: '2')
BillingInterval.create(billing_interval_name: 'Yearly', interval_month: '3')
BillingInterval.create(billing_interval_name: 'Yearly', interval_month: '4')
BillingInterval.create(billing_interval_name: 'Yearly', interval_month: '5')
BillingInterval.create(billing_interval_name: 'Yearly', interval_month: '6')
BillingInterval.create(billing_interval_name: 'Yearly', interval_month: '7')
BillingInterval.create(billing_interval_name: 'Yearly', interval_month: '8')
BillingInterval.create(billing_interval_name: 'Yearly', interval_month: '9')
BillingInterval.create(billing_interval_name: 'Yearly', interval_month: '10')
BillingInterval.create(billing_interval_name: 'Yearly', interval_month: '11')
BillingInterval.create(billing_interval_name: 'Yearly', interval_month: '12')

BillingInterval.create(billing_interval_name: 'Quarterly', interval_month: '1')
BillingInterval.create(billing_interval_name: 'Quarterly', interval_month: '2')
BillingInterval.create(billing_interval_name: 'Quarterly', interval_month: '3')
BillingInterval.create(billing_interval_name: 'Quarterly', interval_month: '4')

BillingInterval.create(billing_interval_name: 'Monthly', interval_month: '1')

Caseworker.create(name: 'Unassigned', phone: '0000000000', fax: '0000000000')

SystemType.create(system_type: 'Unassigned')
TransmitterType.create(transmitter_type: 'Unassigned')

