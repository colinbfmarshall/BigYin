# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Topic.create!(title: 'US Presidential Election', description: 'The United States presidential election of 2016, scheduled for Tuesday, November 8, 2016, will be the 58th quadrennial U.S. presidential election.', location: 'United States of America', wikipedia: 'https://en.wikipedia.org/wiki/United_States_presidential_election,_2016', deadline: '08.11.2016')
# Admin.create!({:email => "admin1@email.com", :password => "admin1@email.com", :password_confirmation => "admin1@email.com" })
# User.create!({:email => "example1@email.com", :password => "example1@email.com", :password_confirmation => "example1@email.com" })

cities = City.create([
  { name: 'Aberdeen' }, { name: 'Bath' }, { name: 'Belfast' }, { name: 'Birmingham' }, { name: 'Bournemouth' }, { name: 'Bradford' }, { name: 'Brighton' }, { name: 'Bristol' }, 
  { name: 'Cambridge' }, { name: 'Cardiff' }, { name: 'Chester' }, { name: 'Coventry and Warks' }, { name: 'Derby' }, { name: 'Derry' }, { name: 'Dundee' }, 
  { name: 'Edinburgh' }, { name: 'Essex' }, { name: 'Exeter' }, { name: 'Falkirk and Stirling' }, { name: 'Gateshead' }, { name: 'Glasgow' }, { name: 'Gloucestershire' }, 
  { name: 'Hull' }, { name: 'Ipswich' }, { name: 'Jersey' }, { name: 'Leeds' }, { name: 'Leicester' }, { name: 'Lincolnshire' }, { name: 'Liverpool' }, { name: 'London' }, 
  { name: 'Kent' }, { name: 'Manchester' }, { name: 'Milton Keynes' }, { name: 'Newcastle' }, { name: 'Northampton' }, { name: 'Norwich' }, { name: 'Nottingham' }, 
  { name: 'Oxford' }, { name: 'Peterborough' }, { name: 'Plymouth' }, { name: 'Portsmouth' }, { name: 'Lancashire' }, { name: 'Reading' }, 
  { name: 'Sheffield' }, { name: 'Southampton' }, { name: 'Stoke-on-Trent' }, { name: 'Surrey' }, { name: 'Swansea' }, { name: 'Swindon' }, { name: 'Teesside' }, 
  { name: 'Watford' }, { name: 'Wolverhampton' }, { name: 'Worcestershire' }, { name: 'York' }
])


ages = Age.create([
  { name: 'Under 18'},
  { name: '18 - 24'},
  { name: '25 - 34'},
  { name: '35 - 44'},
  { name: '45 - 54'},
  { name: '55 - 64'},
  { name: '65 - 74'},
  { name: '75 or Above'},
])

occupations = Occupation.create([
  { name: 'Accountancy' }, { name: 'Administration' }, { name: 'Advertising' }, { name: 'Aerospace' }, { name: 'Automotive' }, 
  { name: 'Banking' }, { name: 'Call Centre' }, { name: 'Catering' }, { name: 'Charity' }, { name: 'Civil Service' }, { name: 'Construction' }, { name: 'Creative' }, { name: 'Customer Services' }, 
  { name: 'Digital' }, { name: 'Education' }, { name: 'Engineering' }, { name: 'Finance' }, { name: 'FMCG' }, 
  { name: 'Healthcare' }, { name: 'Hospitality' }, { name: 'HR' }, { name: 'Insurance' }, { name: 'IT' }, 
  { name: 'Legal' }, { name: 'Leisure' }, { name: 'Logistics' }, { name: 'Management Consultancy' }, { name: 'Manufacturing' }, { name: 'Marketing' }, { name: 'Media' }, 
  { name: 'Nursing' }, { name: 'Oil and Gas' }, { name: 'PA' }, { name: 'Pharmaceutical' }, { name: 'PR' }, { name: 'Property' }, { name: 'Public Sector' }, 
  { name: 'Recruitment' }, { name: 'Renewable Energy' }, { name: 'Retail' }, { name: 'Sales' }, { name: 'Science' }, { name: 'Secretarial' }, { name: 'Social Work' }, 
  { name: 'Teaching' }, { name: 'Telecoms' }, { name: 'Temporary' }, { name: 'Tourism' }, { name: 'Transport' }, { name: 'Travel' }, { name: 'Utilities' }, { name: 'Wholesale ' }, { name: 'Other' }
])

['Afghan', 'Albanian', 'Algerian', 'American', 'Andorran', 'Angolan', 'Antiguans', 'Argentinean', 'Armenian', 'Australian', 'Azerbaijani', 
  'Bahamian', 'Bahraini', 'Bangladeshi', 'Barbadian', 'Barbudans', 'Batswana', 'Belarusian', 'Belgian', 'Belizean', 'Beninese', 'Bhutanese', 'Bolivian', 'Bosnian', 'Brazilian', 'British', 'Bruneian', 'Bulgarian', 'Burkinabe', 'Burmese', 'Burundian', 
  'Cambodian', 'Cameroonian', 'Canadian', 'Cape Verdean', 'Central African', 'Chadian', 'Chilean', 'Chinese', 'Colombian', 'Comoran', 'Congolese', 'Costa Rican', 'Croatian', 'Cuban', 'Cypriot', 'Czech', 
  'Danish', 'Djibouti', 'Dominican', 'Dutch', 
  'East Timorese', 'Ecuadorean', 'Egyptian', 'Emirian', 'Equatorial Guinean', 'Eritrean', 'Estonian', 'Ethiopian', 
  'Fijian', 'Filipino', 'Finnish', 'French', 
  'Gabonese', 'Gambian', 'Georgian', 'German', 'Ghanaian', 'Greek', 'Grenadian', 'Guatemalan', 'Guinea-Bissauan', 'Guinean', 'Guyanese', 
  'Haitian', 'Herzegovinian', 'Honduran', 'Hungarian', 
  'I-Kiribati', 'Icelander', 'Indian', 'Indonesian', 'Iranian', 'Iraqi', 'Irish', 'Israeli', 'Italian', 'Ivorian', 
  'Jamaican', 'Japanese', 'Jordanian', 
  'Kazakhstani', 'Kenyan', 'Kittian', 'Kuwaiti', 'Kyrgyz', 
  'Laotian', 'Latvian', 'Lebanese', 'Liberian', 'Libyan', 'Liechtensteiner', 'Lithuanian', 'Luxembourger', 
  'Macedonian', 'Malagasy', 'Malawian', 'Malaysian', 'Maldivan', 'Malian', 'Maltese', 'Marshallese', 'Mauritanian', 'Mauritian', 'Mexican', 'Micronesian', 'Moldovan', 'Monacan', 'Mongolian', 'Moroccan', 'Mosotho', 'Motswana', 'Mozambican', 
  'Namibian', 'Nauruan', 'Nepalese', 'New Zealander', 'Nicaraguan', 'Nigerian', 'Nigerien', 'North Korean', 'Northern Irish', 'Norwegian', 
  'Omani', 
  'Pakistani', 'Palauan', 'Panamanian', 'Papua New Guinean', 'Paraguayan', 'Peruvian', 'Polish', 'Portuguese', 
  'Qatari', 
  'Romanian', 'Russian', 'Rwandan', 
  'Saint Lucian', 'Salvadoran', 'Samoan', 'San Marinese', 'Sao Tomean', 'Saudi', 'Senegalese', 'Serbian', 'Seychellois', 'Sierra Leonean', 'Singaporean', 'Slovakian', 'Slovenian', 'Solomon Islander', 'Somali', 'South African', 'South Korean', 'Spanish', 'Sri Lankan', 'Sudanese', 'Surinamer', 'Swazi', 'Swedish', 'Swiss', 'Syrian', 
  'Taiwanese', 'Tajik', 'Tanzanian', 'Thai', 'Togolese', 'Tongan', 'Trinidadian', 'Tobagonian', 'Tunisian', 'Turkish', 'Tuvaluan', 
  'Ugandan', 'Ukrainian', 'Uruguayan', 'Uzbekistani', 
  'Venezuelan', 'Vietnamese', 
  'Yemenite', 
  'Zambian', 'Zimbabwean'].each do |nationality|
  Nationality.find_or_create_by({name: nationality})
end