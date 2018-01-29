#   Example
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Users CHL and ARG

users = User.create!([
  {name: 'Constanza', last_name: 'Calderon Sanchez', national_id:'13362555-0', email:'nisanti@ccu.cl',
    jobtitle: 'Operario de Maquinas', supervisor: 'Nicolas Santibanez', country: 'CHL',
    supervisor_email: 'nisanti@ccu.cl', deptname: '290766000', location: '30_VITA',
    company: '13', job_family: 'OO'},
  {name: 'Sebastian', last_name: 'Claren Rubio', national_id:'16054341-8', email: 'sclaren@ccu.cl',
    jobtitle: 'Vendedor Santiago', supervisor: 'Felipe Diaz', country: 'ARG',
    supervisor_email: 'nisanti@ccu.cl', deptname: '290501500', location: '10_CERV',
    company: '13', job_family: 'VE'},
  {name: 'Claudia', last_name: 'Bonilla Toro', national_id: '14121031-9', email: 'cbonil@ccu.cl',
    jobtitle: 'Gerente Tecnologia', supervisor: 'Marco Rios', country: 'CHL',
    supervisor_email: 'nisanti@ccu.cl', deptname: '290501100', location: '20_EMBOT',
    company: '23', job_family: 'GE'},
  {name: 'Yerko', last_name: 'Araos Ramirez', national_id: '16095197-4', email: 'yaraos@ccu.cl',
    jobtitle: 'Vendedor Region', supervisor: 'Nicolas Santibanez', country: 'ARG',
    supervisor_email: 'nisanti@ccu.cl', deptname: '290106000', location: '30_VITA',
    company: '13', job_family: 'VE'},
  {name: 'Rodrigo', last_name: 'Monardes Nitrihual', national_id: '13679739-5', email: 'rmonar@ccu.cl',
    jobtitle: 'Jefe Laboratorio', supervisor: 'Felipe Diaz', country: 'CHL',
    supervisor_email: 'nisanti@ccu.cl', deptname: '290108000', location: '10_CERV',
    company: '23', job_family: 'PT'},
  {name: 'Guillermo', last_name: 'Giaconi Rodriguez', national_id: '16943369-0', email: 'ggiaconi@ccu.cl',
    jobtitle: 'Subgerente systemas', supervisor: 'Marco Rios', country: 'ARG',
    supervisor_email: 'nisanti@ccu.cl', deptname: '290051000', location: '20_EMBOT',
    company: '13', job_family: 'EJ'},
  {name: 'Javier', last_name: 'Castro Maldonado', national_id: '8208182-8', email: 'jcastro@ccu.cl',
    jobtitle: 'Gerente Informatica', supervisor: 'Nicolas Santibanez', country: 'CHL',
    supervisor_email: 'nisanti@ccu.cl', deptname: '290776000', location: '30_VITA',
    company: '23', job_family: 'GE'},
  {name: 'Carmen Gloria', last_name: 'Utili Escudero', national_id: '5192357-K', email: 'cutili@ccu.cl',
    jobtitle: 'Ejecutiva Aprovisionamiento', supervisor: 'Felipe Diaz', country: 'ARG',
    supervisor_email: 'nisanti@ccu.cl', deptname: '540796000', location: '10_CERV',
    company: '13', job_family: 'PT'},
  {name: 'Marcelo', last_name: 'Cabrera Rubio', national_id: '16371090-0', email: 'mcabrera@ccu.cl',
    jobtitle: 'Ingeniero de Televenta', supervisor: 'Marco Rios', country: 'CHL',
    supervisor_email: 'nisanti@ccu.cl', deptname: '290501500', location: '20_EMBOT',
    company: '23', job_family: 'PT'},
  {name: 'Anain', last_name: 'Venegas Mondaca', national_id: '8634532-3', email: 'avenega@ccu.cl',
    jobtitle: 'Tecnico de redes', supervisor: 'Nicolas Santibanez', country: 'ARG',
    supervisor_email: 'nisanti@ccu.cl', deptname: '290845000', location: '30_VITA',
    company: '13', job_family: 'PT'},
  {name: 'Rodolfo', last_name: 'Williams Inostroza', national_id: '18293586-0', email: 'rwilli@ccu.cl',
    jobtitle: 'Alumno Practicante', supervisor: 'Felipe Diaz', country: 'CHL',
    supervisor_email: 'nisanti@ccu.cl', deptname: '103845490', location: '10_CERV',
    company: '23', job_family: 'EE'},
  {name: 'Cecilia', last_name: 'Caceres Diaz', national_id: '8634532-3', email: 'ccace@ccu.cl',
    jobtitle: 'Alumno Practicante', supervisor: 'Marco Rios', country: 'ARG',
    supervisor_email: 'nisanti@ccu.cl', deptname: '229442940', location: '20_EMBOT',
    company: '13', job_family: 'EE'}
])

puts(users)

# Sims CHL and ARG
sims = Sim.create!([
  {phone_number: 82099147, country: 'CHL'},
  {phone_number: 93192570, country: 'ARG'},
  {phone_number: 84099131, country: 'CHL'},
  {phone_number: 51999216, country: 'ARG'},
  {phone_number: 93192661, country: 'CHL'},
  {phone_number: 97991465, country: 'ARG'},
  {phone_number: 76681990, country: 'CHL'},
  {phone_number: 62082805, country: 'ARG'},
  {phone_number: 66285644, country: 'CHL'},
  {phone_number: 99158447, country: 'ARG'},
  {phone_number: 82593542, country: 'CHL'},
  {phone_number: 82491446, country: 'ARG'},
  {phone_number: 93185497, country: 'CHL'},
  {phone_number: 42178031, country: 'ARG'},
  {phone_number: 93186475, country: 'CHL'}
])
puts(sims)

# Smartphones Catalog CHL
smartphones = Smartphone.create!([
  {model: 'Samsung Galaxy S8', category: 'GE', price: 200836, code: '106616',
    state: 'catalog', country: 'CHL'},
  {model: 'Samsung Galaxy S8', category: 'EJ', price: 200836, code: '106616',
    state: 'catalog', country: 'CHL'},
  {model: 'Samsung Galaxy S7', category: 'GE', price: 158820, code: '106553',
    state: 'catalog', country: 'CHL'},
  {model: 'Samsung Galaxy S7', category: 'EJ', price: 158820, code: '106553',
    state: 'catalog', country: 'CHL'},
  {model: 'Samsung Galaxy S7', category: 'VE', price: 158820,
    code: '106553', state: 'catalog', country: 'CHL'},
  {model: 'Samsung Galaxy J7', category: 'PT', price: 50417,
    code: '106586', state: 'catalog', country: 'CHL'},
  {model: 'Samsung Galaxy J5', category: 'EE', price: 40333,
    code: '106583', state: 'catalog', country: 'CHL'},
  {model: 'Samsung Galaxy J5', category: 'OO', price: 40333, code: '106583',
    state: 'catalog', country: 'CHL'},
  {model: 'Own F1035', category: 'ALL', price: 0, code: '162050',
    state: 'catalog', country: 'CHL'}
])
puts(smartphones)

# Smartphones Catalog ARG
smartphones = Smartphone.create!([
  {model: 'iPhone X', category: 'GE', price: 200836, code: '205616',
    state: 'catalog', country: 'ARG'},
  {model: 'iPhone X', category: 'EJ', price: 200836, code: '205616',
    state: 'catalog', country: 'ARG'},
  {model: 'iPhone 8 Plus', category: 'GE', price: 158820, code: '205553',
    state: 'catalog', country: 'ARG'},
  {model: 'iPhone 8 Plus', category: 'EJ', price: 158820, code: '205553',
    state: 'catalog', country: 'ARG'},
  {model: 'iPhone 8', category: 'VE', price: 158820,
    code: '205553',state: 'catalog', country: 'ARG'},
  {model: 'iPhone 7 Plus', category: 'PT', price: 50417,
    code: '205586', state: 'catalog', country: 'ARG'},
  {model: 'iPhone 7', category: 'PT', price: 50417,
    code: '205586', state: 'catalog', country: 'ARG'},
  {model: 'iPhone 6', category: 'EE', price: 40333,
    code: '205583', state: 'catalog', country: 'ARG'},
  {model: 'iPhone 6', category: 'OO', price: 40333, code: '205583',
    state: 'catalog', country: 'ARG'},
  {model: 'Own F1035', category: 'ALL', price: 0, code: '205050',
    state: 'catalog', country: 'ARG'}
])
puts(smartphones)

# Smartphones to CHL users
smartphones = Smartphone.create!([
  {model: 'Samsung Galaxy S8', category: 'GE', imei:'353227075802167',
    price: 200836, code: '106616', state: 'used',
    country: 'CHL', phone_number: 98738446},
  {model: 'Samsung Galaxy S8', category: 'GE', imei:'359878069666630',
    price: 200836, code: '106616', state: 'used',
    country: 'CHL', phone_number: 98172663},
  {model: 'Samsung Galaxy S7', category: 'EJ', imei:'35688706001064',
    price: 158820, code: '106553', state: 'used',
    country: 'CHL', phone_number: 98837465},
  {model: 'Samsung Galaxy J7', category: 'PT', imei:'35881306155560',
    price: 50417, code: '106586', state: 'used',
    country: 'CHL', phone_number: 98918207},
  {model: 'Samsung Galaxy J7', category: 'PT', imei:'52141079023186',
    price: 50417, code: '106586', country: 'CHL', phone_number: 98293847},
  {model: 'Samsung Galaxy S7', category: 'VE', imei:'359878063788620',
    price: 158820, code: '106553', country: 'CHL', phone_number: 98172663},
  {model: 'Samsung Galaxy S7', category: 'VE', imei:'35687805120863',
    price: 158820, code: '106553', country: 'CHL', phone_number: 98928374},
  {model: 'Samsung Galaxy J5', category: 'EE', imei:'359878069666481',
    price: 40333, code: '106583', state: 'used',
    country: 'CHL', phone_number: 98993847},
  {model: 'Samsung Galaxy J5', category: 'OO', imei:'35214073409175',
    price: 40333, code: '106583', country: 'CHL', phone_number: 98101920},
  {model: 'Samsung Galaxy J5', category: 'ALL', imei:'359048050341094',
    price: 40333, code: '106583', state: 'used',
    country: 'CHL', phone_number: 98938432}
])
puts(smartphones)

# Smartphones to ARG users
smartphones = Smartphone.create!([
  {model: 'iPhone X', category: 'GE', imei:'783227075802167',
    price: 200836, code: '106616', state: 'used',
    country: 'ARG', phone_number: 87172663},
  {model: 'iPhone X', category: 'GE', imei:'789878069666630',
    price: 200836, code: '106616', state: 'used',
    country: 'ARG', phone_number: 87921834},
  {model: 'iPhone 8 Plus', category: 'EJ', imei:'78688706001064',
    price: 158820, code: '106553', state: 'used',
    country: 'ARG', phone_number: 87291837},
  {model: 'iPhone 7 Plus', category: 'PT', imei:'78881306155560',
    price: 50417, code: '106586', state: 'used',
    country: 'ARG', phone_number: 87364955},
  {model: 'iPhone 7', category: 'PT', imei:'78141079023186',
    price: 50417, code: '106586', country: 'ARG', phone_number: 87167584},
  {model: 'iPhone 8', category: 'VE', imei:'789878063788620',
    price: 158820, code: '106553', country: 'ARG', phone_number: 87456833},
  {model: 'iPhone 8', category: 'VE', imei:'78687805120863',
    price: 158820, code: '106553', country: 'ARG', phone_number: 87807886},
  {model: 'iPhone 6s', category: 'EE', imei:'789878069666481',
    price: 40333, code: '106583', state: 'used',
    country: 'ARG', phone_number: 87146351},
  {model: 'iPhone 6s', category: 'OO', imei:'78214073409175',
    price: 40333, code: '106583', country: 'ARG', phone_number: 87183932},
  {model: 'iPhone 6', category: 'ALL', imei:'789048050341094',
    price: 40333, code: '106583', state: 'used',
    country: 'ARG', phone_number: 870468977}
])
puts(smartphones)

# Bams Catalog ARG
bams = Bam.create!([
  {model: 'Huaewi E5573', price: 35990, code: '205167', state: 'catalog', country: 'ARG'},
  {model: 'Huaewi E8372', price: 55990, code: '205250', state: 'catalog', country: 'ARG'}
])
puts(bams)

# Bams Catalog CHL
bams = Bam.create!([
  {model: 'BAM E8372H LTE', price: 0, code: '133167', state: 'catalog', country: 'CHL'}
])
puts(bams)

# Bams CHL
bams = Bam.create!([
  {model: 'BAM E8372H LTE', imei:'952427835802167', price: 0, code: '133167',
    state: 'used', country: 'CHL'},
  {model: 'BAM E8372H LTE', imei:'984557575805360', price: 0, code: '133167',
    state: 'used', country: 'CHL'},
  {model: 'BAM E8372H LTE', imei:'996883330106421', price: 0, code: '133167', country: 'CHL'},
  {model: 'BAM E8372H LTE', imei:'918813063325600', price: 0, code: '133167', country: 'CHL'},
  {model: 'BAM E8372H LTE', imei:'932414072893167', price: 0, code: '133167',
    state: 'used', country: 'CHL'}
])
puts(bams)

# Bams ARG
bams = Bam.create!([
  {model: 'Huawei E5573', imei:'882427835802167', price: 35990, code: '205167',
    state: 'used', country: 'ARG'},
  {model: 'Huawei E5573', imei:'884557575805360', price: 35990, code: '205167',
    state: 'used', country: 'ARG'},
  {model: 'Huawei E5573', imei:'886883330106421', price: 35990, code: '205167', country: 'ARG'},
  {model: 'Huawei E8372', imei:'888813063325600', price: 55990, code: '205250', country: 'ARG'},
  {model: 'Huawei E8372', imei:'882414072893167', price: 55990, code: '205250', state: 'used', country: 'ARG'}
])
puts(bams)

# plans/bags CHL for bams and roaming
# Bams Plans CHL
plans = Plan.create!([
  {item: 'bam', name:'1452 BAM Pro 4 Gb Normal', price: 15882, country: 'CHL', plan_type: 'plan',
    detail:' El plan incluye: 2 Gb / vel. descarga nacional promedio: 3 Mbps (nacional) y 2,2 Mbps (internacional) '},
  {item: 'bam', name:'1453 BAM Pro 8 Gb Normal', price: 20924, country: 'CHL', plan_type: 'plan',
    detail:' El plan incluye: 4 Gb / vel. descarga nacional promedio: 3 Mbps (nacional) y 2,2 Mbps (internacional) '},
  {item: 'bam', name:'1454 BAM Pro 12 Gb Normal', price: 24286, country: 'CHL', plan_type: 'plan',
    detail:' El plan incluye: 6 Gb / vel. descarga nacional promedio: 5,8 Mbps (nacional) y 4,7 Mbps (internacional) '},
  {item: 'bam', name:'1455 BAM Pro 20 Gb Normal', price: 30168, country: 'CHL', plan_type: 'plan',
    detail:' El plan incluye: 10 Gb / vel. descarga nacional promedio: 5,8 Mbps (nacional) y 4,7 Mbps (internacional) '},
  {item: 'bam', name:'1456 BAM Pro 30 Gb Normal', price: 37807, country: 'CHL', plan_type: 'plan',
    detail:' El plan incluye: 15 Gb / vel. descarga nacional promedio: 5,8 Mbps (nacional) y 4,7 Mbps (internacional) '}
])
puts(plans)

# Bams Plans ARG
plans = Plan.create!([
  {item: 'bam', name:'BAM Utra 8 Gb', price: 10882, country: 'ARG', plan_type: 'plan',
    detail:' El plan incluye: 8 Gb / vel. descarga nacional promedio: 2,5 Mbps (nacional) y 1,5 Mbps (internacional) '},
  {item: 'bam', name:'BAM Ultra 15 Gb', price: 15924, country: 'ARG', plan_type: 'plan',
    detail:' El plan incluye: 15 Gb / vel. descarga nacional promedio: 2,5 Mbps (nacional) y 1,5 Mbps (internacional) '},
  {item: 'bam', name:'BAM Ultra 20 Gb', price: 19286, country: 'ARG', plan_type: 'plan',
    detail:' El plan incluye: 20 Gb / vel. descarga nacional promedio: 4,5 Mbps (nacional) y 3,5 Mbps (internacional) '},
  {item: 'bam', name:'BAM Ultra 25 Gb', price: 25168, country: 'ARG', plan_type: 'plan',
    detail:' El plan incluye: 25 Gb / vel. descarga nacional promedio: 5,5 Mbps (nacional) y 5,0 Mbps (internacional) '},
  {item: 'bam', name:'BAM Ultra 30 Gb', price: 32807, country: 'ARG', plan_type: 'plan',
    detail:' El plan incluye: 30 Gb / vel. descarga nacional promedio: 5,5 Mbps (nacional) y 5,0 Mbps (internacional) '}
])
puts(plans)

# Roaming Plans CHL
plans = Plan.create!([
  {item: 'roaming', name:'Programa Viajero 150 MB', price: 9990, country: 'CHL',
    plan_type: 'plan', detail:'El plan incluye: 150 MB + WHATSAPP ILIMITADO'},
  {item: 'roaming', name:'Programa Viajero Pro 150 MB', price: 12990, country: 'CHL',
    plan_type: 'plan', detail:'El plan incluye: 150 MB + 15 MIN + 15 SMS + WHATSAPP ILIMITADO'},
  {item: 'roaming', name:'Programa Viajero 300 MB', price: 17990, country: 'CHL',
    plan_type: 'plan', detail:'El plan incluye: 300 MB + WHATSAPP ILIMITADO'},
  {item: 'roaming', name:'Programa Viajero Pro 300 MB', price: 22990, country: 'CHL',
    plan_type: 'plan', detail:'El plan incluye: 300 MB + 30 MIN + 30 SMS + WHATSAPP ILIMITADO'}
])
puts(plans)

# Roaming Plans ARG
plans = Plan.create!([
  {item: 'roaming', name:'Viajero 200', price: 4990, country: 'ARG',
    plan_type: 'plan', detail:'El plan incluye: 200 MB + WhatsApp Y Twitter ILIMITADO'},
  {item: 'roaming', name:'Viajero Pro 200', price: 17990, country: 'ARG',
    plan_type: 'plan', detail:'El plan incluye: 200 MB + 15 MIN + 15 SMS + Redes Sociales ILIMITADO'},
  {item: 'roaming', name:'Viajero 500', price: 12990, country: 'ARG',
    plan_type: 'plan', detail:'El plan incluye: 500 MB + WhatsApp Y Twitter ILIMITADO'},
  {item: 'roaming', name:'Viajero Pro 500', price: 17990, country: 'ARG',
    plan_type: 'plan', detail:'El plan incluye: 500 MB + 30 MIN + 30 SMS + Redes Sociales ILIMITADO'}
])
puts(plans)

# Roaming Bags CHL
plans = Plan.create!([
  {item: 'roaming', name:'Bolsa 30 Dias Roaming 15MB', price: 29990, country: 'CHL',
    plan_type: 'bag', detail:'Bolsa solo incluye plan de datos y duración de 30 dias'},
  {item: 'roaming', name:'Bolsa 30 Dias Roaming 25MB', price: 45990, country: 'CHL',
    plan_type: 'bag', detail:'Bolsa solo incluye plan de datos y duración de 30 dias'},
  {item: 'roaming', name:'Bolsa 30 Dias Roaming 50MB', price: 79990, country: 'CHL',
    plan_type: 'bag', detail:'Bolsa solo incluye plan de datos y duración de 30 dias'},
  {item: 'roaming', name:'Bolsa 30 Dias Roaming 100MB', price: 144990, country: 'CHL',
    plan_type: 'bag', detail:'Bolsa solo incluye plan de datos y duración de 30 dias'},
  {item: 'roaming', name:'Bolas 30 Dias Roaming 200MB', price: 239990, country: 'CHL',
    plan_type: 'bag', detail:'Bolsa solo incluye plan de datos y duración de 30 dias'},
  {item: 'roaming', name:'Bolsa 30 Dias Roaming 400MB', price: 449990, country: 'CHL',
    plan_type: 'bag', detail:'Bolsa solo incluye plan de datos y duración de 30 dias'}
])
puts(plans)

# Roaming Bags ARG
plans = Plan.create!([
  {item: 'roaming', name:'Bolsa Roaming 15MB', price: 9990, country: 'ARG',
    plan_type: 'bag', detail:'Bolsa solo incluye plan de datos y duración de 30 dias'},
  {item: 'roaming', name:'Bolsa Roaming 25MB', price: 25990, country: 'ARG',
    plan_type: 'bag', detail:'Bolsa solo incluye plan de datos y duración de 30 dias'},
  {item: 'roaming', name:'Bolsa Roaming 50MB', price: 59990, country: 'ARG',
    plan_type: 'bag', detail:'Bolsa solo incluye plan de datos y duración de 30 dias'},
  {item: 'roaming', name:'Bolsa Roaming 100MB', price: 104990, country: 'ARG',
    plan_type: 'bag', detail:'Bolsa solo incluye plan de datos y duración de 30 dias'},
  {item: 'roaming', name:'Bolsa Roaming 200MB', price: 159990, country: 'ARG',
    plan_type: 'bag', detail:'Bolsa solo incluye plan de datos y duración de 30 dias'},
  {item: 'roaming', name:'Bolsa Roaming 400MB', price: 229990, country: 'ARG',
    plan_type: 'bag', detail:'Bolsa solo incluye plan de datos y duración de 30 dias'}
])
puts(plans)

# user
if Rails.env.test?
  user1 = User.find_by_national_id('13362555-0')
  user2 = User.find_by_national_id('16054341-8')
elsif Rails.env.development?
  user1 = User.find_by_national_id('15680498-3')
  user2 = User.find_by_national_id('10299224-5')
end
puts(user1,user2)

# Smartphone
sp1 = Smartphone.find_by_imei('359878069666481')
sp2 = Smartphone.find_by_imei('789878063788620')
puts(sp1,sp2)

# Bam
bam1 = Bam.find_by_imei('952427835802167')
bam2 = Bam.find_by_imei('882427835802167')
puts(bam1,bam2)

# Sim
sim1 = Sim.find_by_phone_number(82099147)
sim2 = Sim.find_by_phone_number(93192570)
puts(sim1,sim2)

# Bam plan
plan1 = Plan.find_by_name('1452 BAM Pro 4 Gb Normal')
plan2 = Plan.find_by_name('BAM Utra 8 Gb')
puts(plan1,plan2)

# Add to user1
user1.update_attributes(smartphone_id: sp1.id, bam_id: bam1.id, sim_id: sim1.id, plan_id: plan1.id)
sp1.update_attributes(available: false)
bam1.update_attributes(available: false)
sim1.update_attributes(available: false)

# Add to user2
user2.update_attributes(smartphone_id: sp2.id, bam_id: bam2.id, sim_id: sim2.id, plan_id: plan2.id)
sp2.update_attributes(available: false)
bam2.update_attributes(available: false)
sim2.update_attributes(available: false)
