#   Example
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Users CHL and ARG

users = User.create!([
  {name: 'Constanza', last_name: 'Calderon Sanchez', national_id:'13362555-0', email:'ccalde@ccu.cl',
    jobtitle: 'Operario de Maquinas', supervisor: 'Nicolas Santibanez', nid_country: 'CHL',
    supervisor_email: 'nisanti@ccu.cl', deptname: '290766000', location: '30_VITA',
    company: '13', jobcode: 'empleado/operario'},
  {name: 'Sebastian', last_name: 'Claren Rubio', national_id:'16054341-8', email: 'sclaren@ccu.cl',
    jobtitle: 'Vendedor Santiago', supervisor: 'Felipe Diaz', nid_country: 'ARG',
    supervisor_email: 'nisanti@ccu.cl', deptname: '290501500', location: '10_CERV',
    company: '13', jobcode: 'jefe de venta/vendedor'},
  {name: 'Claudia', last_name: 'Bonilla Toro', national_id: '14121031-9', email: 'cbonil@ccu.cl',
    jobtitle: 'Gerente Tecnologia', supervisor: 'Marco Rios', nid_country: 'CHL',
    supervisor_email: 'nisanti@ccu.cl', deptname: '290501100', location: '20_EMBOT',
    company: '23', jobcode: 'gerente'},
  {name: 'Yerko', last_name: 'Araos Ramirez', national_id: '16095197-4', email: 'yaraos@ccu.cl',
    jobtitle: 'Vendedor Region', supervisor: 'Nicolas Santibanez', nid_country: 'ARG',
    supervisor_email: 'nisanti@ccu.cl', deptname: '290106000', location: '30_VITA',
    company: '13', jobcode: 'jefe de venta/vendedor'},
  {name: 'Rodrigo', last_name: 'Monardes Nitrihual', national_id: '13679739-5', email: 'rmonar@ccu.cl',
    jobtitle: 'Jefe Laboratorio', supervisor: 'Felipe Diaz', nid_country: 'CHL',
    supervisor_email: 'nisanti@ccu.cl', deptname: '290108000', location: '10_CERV',
    company: '23', jobcode: 'profesional/tecnico'},
  {name: 'Guillermo', last_name: 'Giaconi Rodriguez', national_id: '16943369-0', email: 'ggiaconi@ccu.cl',
    jobtitle: 'Subgerente systemas', supervisor: 'Marco Rios', nid_country: 'ARG',
    supervisor_email: 'nisanti@ccu.cl', deptname: '290051000', location: '20_EMBOT',
    company: '13', jobcode: 'subgerente'},
  {name: 'Javier', last_name: 'Castro Maldonado', national_id: '8208182-8', email: 'jcastro@ccu.cl',
    jobtitle: 'Gerente Informatica', supervisor: 'Nicolas Santibanez', nid_country: 'CHL',
    supervisor_email: 'nisanti@ccu.cl', deptname: '290776000', location: '30_VITA',
    company: '23', jobcode: 'gerente'},
  {name: 'Carmen Gloria', last_name: 'Utili Escudero', national_id: '5192357-K', email: 'cutili@ccu.cl',
    jobtitle: 'Ejecutiva Aprovisionamiento', supervisor: 'Felipe Diaz', nid_country: 'ARG',
    supervisor_email: 'nisanti@ccu.cl', deptname: '540796000', location: '10_CERV',
    company: '13', jobcode: 'profesional/tecnico'},
  {name: 'Marcelo', last_name: 'Cabrera Rubio', national_id: '16371090-0', email: 'mcabrera@ccu.cl',
    jobtitle: 'Ingeniero de Televenta', supervisor: 'Marco Rios', nid_country: 'CHL',
    supervisor_email: 'nisanti@ccu.cl', deptname: '290501500', location: '20_EMBOT',
    company: '23', jobcode: 'profesional/tecnico'},
  {name: 'Anain', last_name: 'Venegas Mondaca', national_id: '8634532-3', email: 'avenega@ccu.cl',
    jobtitle: 'Tecnico de redes', supervisor: 'Nicolas Santibanez', nid_country: 'ARG',
    supervisor_email: 'nisanti@ccu.cl', deptname: '290845000', location: '30_VITA',
    company: '13', jobcode: 'profesional/tecnico'},
  {name: 'Rodolfo', last_name: 'Williams Inostroza', national_id: '18293586-0', email: 'rwilli@ccu.cl',
    jobtitle: 'Alumno Practicante', supervisor: 'Felipe Diaz', nid_country: 'CHL',
    supervisor_email: 'nisanti@ccu.cl', deptname: '103845490', location: '10_CERV',
    company: '23', jobcode: 'multiusuario'},
  {name: 'Cecilia', last_name: 'Caceres Diaz', national_id: '8634532-3', email: 'ccace@ccu.cl',
    jobtitle: 'Alumno Practicante', supervisor: 'Marco Rios', nid_country: 'ARG',
    supervisor_email: 'nisanti@ccu.cl', deptname: '229442940', location: '20_EMBOT',
    company: '13', jobcode: 'multiusuario'}
])

puts(users)

# Sims CHL and ARG
sims = Sim.create!([
  {phone_number: 82099147, last_owner: 'Constanza Cabrera', country: 'CHL'},
  {phone_number: 93192570, last_owner: 'Norma Acuna', country: 'ARG'},
  {phone_number: 84099131, last_owner: 'Victor Santibanez', country: 'CHL'},
  {phone_number: 51999216, last_owner: 'Carmen Castro', country: 'ARG'},
  {phone_number: 93192661, last_owner: 'Jose Luis Cabrera', country: 'CHL'},
  {phone_number: 97991465, country: 'ARG'},
  {phone_number: 76681990, country: 'CHL'},
  {phone_number: 62082805, country: 'ARG'},
  {phone_number: 66285644, country: 'CHL'},
  {phone_number: 99158447, country: 'ARG'},
  {phone_number: 82593542, country: 'CHL'},
  {phone_number: 82491446, country: 'ARG'},
  {phone_number: 93185497, last_owner: 'Felipe Castro', country: 'CHL'},
  {phone_number: 42178031, last_owner: 'Gonzalo Inostroza', country: 'ARG'},
  {phone_number: 93186475, last_owner: 'Claudia Munoz', country: 'CHL'}
])
puts(sims)

# Smartphones Catalog CHL
smartphones = Smartphone.create!([
  {model: 'Samsung Galaxy S8', category: 'gerente', price: 200836, code: '106616',
    state: 'catalog', country: 'CHL'},
  {model: 'Samsung Galaxy S8', category: 'subgerente', price: 200836, code: '106616',
    state: 'catalog', country: 'CHL'},
  {model: 'Samsung Galaxy S7', category: 'gerente', price: 158820, code: '106553',
    state: 'catalog', country: 'CHL'},
  {model: 'Samsung Galaxy S7', category: 'subgerente', price: 158820, code: '106553',
    state: 'catalog', country: 'CHL'},
  {model: 'Samsung Galaxy S7', category: 'jefe de venta/vendedor', price: 158820,
    code: '106553', country: 'CHL'},
  {model: 'Samsung Galaxy J7', category: 'profesional/tecnico', price: 50417,
    code: '106586', state: 'catalog', country: 'CHL'},
  {model: 'Samsung Galaxy J5', category: 'empleado/operario', price: 40333,
    code: '106583', state: 'catalog', country: 'CHL'},
  {model: 'Samsung Galaxy J5', category: 'otro', price: 40333, code: '106583',
    state: 'catalog', country: 'CHL'},
  {model: 'Own F1035', category: 'all', price: 40333, code: '162050',
    state: 'catalog', country: 'CHL'}
])
puts(smartphones)

# Smartphones Catalog ARG
smartphones = Smartphone.create!([
  {model: 'iPhone X', category: 'gerente', price: 200836, code: '205616',
    state: 'catalog', country: 'ARG'},
  {model: 'iPhone X', category: 'subgerente', price: 200836, code: '205616',
    state: 'catalog', country: 'ARG'},
  {model: 'iPhone 8 Plus', category: 'gerente', price: 158820, code: '205553',
    state: 'catalog', country: 'ARG'},
  {model: 'iPhone 8 Plus', category: 'subgerente', price: 158820, code: '205553',
    state: 'catalog', country: 'ARG'},
  {model: 'iPhone 8', category: 'jefe de venta/vendedor', price: 158820,
    code: '205553', country: 'ARG'},
  {model: 'iPhone 7 Plus', category: 'profesional/tecnico', price: 50417,
    code: '205586', state: 'catalog', country: 'ARG'},
  {model: 'iPhone 7', category: 'profesional/tecnico', price: 50417,
    code: '205586', state: 'catalog', country: 'ARG'},
  {model: 'iPhone 6s', category: 'empleado/operario', price: 40333,
    code: '205583', state: 'catalog', country: 'ARG'},
  {model: 'iPhone 6', category: 'otro', price: 40333, code: '205583',
    state: 'catalog', country: 'ARG'},
  {model: 'Own F1035', category: 'all', price: 40333, code: '205050',
    state: 'catalog', country: 'ARG'}
])
puts(smartphones)

# Smartphones to CHL users
smartphones = Smartphone.create!([
  {model: 'Samsung Galaxy S8', category: 'gerente', imei:'353227075802167',
    price: 200836, last_owner: 'Marco Sepulveda', code: '106616', state: 'used',
    sim_id: 10002, country: 'CHL'},
  {model: 'Samsung Galaxy S8', category: 'gerente', imei:'359878069666630',
    price: 200836, last_owner: 'Carolina Arredondo', code: '106616', state: 'used',
    country: 'CHL'},
  {model: 'Samsung Galaxy S7', category: 'subgerente', imei:'35688706001064',
    price: 158820, last_owner: 'Kathy Whiting', code: '106553', state: 'used',
    country: 'CHL'},
  {model: 'Samsung Galaxy J7', category: 'profesional/tecnico', imei:'35881306155560',
    price: 50417, last_owner: 'Felipe Arriagada', code: '106586', state: 'used',
    sim_id: 10007, country: 'CHL'},
  {model: 'Samsung Galaxy J7', category: 'profesional/tecnico', imei:'52141079023186',
    price: 50417, code: '106586', country: 'CHL'},
  {model: 'Samsung Galaxy S7', category: 'jefe de venta/vendedor', imei:'359878063788620',
    price: 158820, code: '106553', country: 'CHL'},
  {model: 'Samsung Galaxy S7', category: 'jefe de venta/vendedor', imei:'35687805120863',
    price: 158820, code: '106553', country: 'CHL'},
  {model: 'Samsung Galaxy J5', category: 'empleado/operario', imei:'359878069666481',
    price: 40333, last_owner: 'Andres Soto', code: '106583', state: 'used',
    country: 'CHL'},
  {model: 'Samsung Galaxy J5', category: 'empleado/operario', imei:'35214073409175',
    price: 40333, code: '106583', country: 'CHL'},
  {model: 'Samsung Galaxy J5', category: 'multiusuario', imei:'359048050341094',
    price: 40333, last_owner: 'Guillermo Aguilar', code: '106583', state: 'used',
    country: 'CHL'}
])
puts(smartphones)

# Smartphones to ARG users
smartphones = Smartphone.create!([
  {model: 'iPhone X', category: 'gerente', imei:'353227075802167',
    price: 200836, last_owner: 'Marco Sepulveda', code: '106616', state: 'used',
    sim_id: 10002, country: 'ARG'},
  {model: 'iPhone X', category: 'gerente', imei:'359878069666630',
    price: 200836, last_owner: 'Carolina Arredondo', code: '106616', state: 'used',
    country: 'ARG'},
  {model: 'iPhone 8 Plus', category: 'subgerente', imei:'35688706001064',
    price: 158820, last_owner: 'Kathy Whiting', code: '106553', state: 'used',
    country: 'ARG'},
  {model: 'iPhone 7 Plus', category: 'profesional/tecnico', imei:'35881306155560',
    price: 50417, last_owner: 'Felipe Arriagada', code: '106586', state: 'used',
    sim_id: 10007, country: 'ARG'},
  {model: 'iPhone 7', category: 'profesional/tecnico', imei:'52141079023186',
    price: 50417, code: '106586', country: 'ARG'},
  {model: 'iPhone 8', category: 'jefe de venta/vendedor', imei:'359878063788620',
    price: 158820, code: '106553', country: 'ARG'},
  {model: 'iPhone 8', category: 'jefe de venta/vendedor', imei:'35687805120863',
    price: 158820, code: '106553', country: 'ARG'},
  {model: 'iPhone 6s', category: 'empleado/operario', imei:'359878069666481',
    price: 40333, last_owner: 'Andres Soto', code: '106583', state: 'used',
    country: 'ARG'},
  {model: 'iPhone 6s', category: 'empleado/operario', imei:'35214073409175',
    price: 40333, code: '106583', country: 'ARG'},
  {model: 'iPhone 6', category: 'multiusuario', imei:'359048050341094',
    price: 40333, last_owner: 'Guillermo Aguilar', code: '106583', state: 'used',
    country: 'ARG'}
])
puts(smartphones)

# Bams Catalog ARG
bams = Bam.create!([
  {model: 'Huaewi E5573', imei:'859048050341921', price: 35990, code: '205167', state: 'catalog', country: 'ARG'},
  {model: 'Huaewi E8372', imei:'859048050341308', price: 55990, code: '205250', state: 'catalog', country: 'ARG'}
])
puts(bams)

# Bams Catalog CHL
bams = Bam.create!([
  {model: 'BAM E8372H LTE', imei:'859048050341835', price: 0, code: '133167', state: 'catalog', country: 'CHL'}
])
puts(bams)

# Bams CHL
bams = Bam.create!([
  {model: 'BAM E8372H LTE', imei:'952427835802167', price: 0,
    last_owner: 'Joaquin Zunino', code: '133167', state: 'used', country: 'CHL'},
  {model: 'BAM E8372H LTE', imei:'984557575805360', price: 0,
    last_owner: 'Francisca Irarrazaval', code: '133167', state: 'used', country: 'CHL'},
  {model: 'BAM E8372H LTE', imei:'996883330106421', price: 0, code: '133167', country: 'CHL'},
  {model: 'BAM E8372H LTE', imei:'918813063325600', price: 0, code: '133167', country: 'CHL'},
  {model: 'BAM E8372H LTE', imei:'932414072893167', price: 0,
    last_owner: 'Mariana Fernandez', code: '133167', state: 'used', country: 'CHL'}
])
puts(bams)

# Bams ARG
bams = Bam.create!([
  {model: 'Huaewi E5573', imei:'952427835802167', price: 35990,
    last_owner: 'Joaquin Zunino', code: '205167', state: 'used', country: 'ARG'},
  {model: 'Huaewi E5573', imei:'984557575805360', price: 35990,
    last_owner: 'Francisca Irarrazaval', code: '205167', state: 'used', country: 'ARG'},
  {model: 'Huaewi E5573', imei:'996883330106421', price: 35990, code: '205167', country: 'ARG'},
  {model: 'Huaewi E8372', imei:'918813063325600', price: 55990, code: '205250', country: 'ARG'},
  {model: 'Huaewi E8372', imei:'932414072893167', price: 55990,
    last_owner: 'Mariana Fernandez', code: '205250', state: 'used', country: 'ARG'}
])
puts(bams)

# plans/bags CHL for bams and roaming
# Bams ARG
plans = Plan.create!([
  {item: 'bam', name:'BAM Pro 4 Gb Normal', price: 15882, nid_country: 'CHL',
    detail:' El plan incluye: 2 Gb / vel. descarga nacional promedio: 3 Mbps (nacional) y 2,2 Mbps (internacional) '},
  {item: 'bam', name:'BAM Pro 8 Gb Normal', price: 20924, nid_country: 'CHL',
    detail:' El plan incluye: 4 Gb / vel. descarga nacional promedio: 3 Mbps (nacional) y 2,2 Mbps (internacional) '},
  {item: 'bam', name:'BAM Pro 12 Gb Normal', price: 24286, nid_country: 'CHL',
    detail:' El plan incluye: 6 Gb / vel. descarga nacional promedio: 5,8 Mbps (nacional) y 4,7 Mbps (internacional) '},
  {item: 'bam', name:'BAM Pro 20 Gb Normal', price: 30168, nid_country: 'CHL',
    detail:' El plan incluye: 10 Gb / vel. descarga nacional promedio: 5,8 Mbps (nacional) y 4,7 Mbps (internacional) '},
  {item: 'bam', name:'BAM Pro 30 Gb Normal', price: 37807, nid_country: 'CHL',
    detail:' El plan incluye: 15 Gb / vel. descarga nacional promedio: 5,8 Mbps (nacional) y 4,7 Mbps (internacional) '}
])
puts(plans)

# plans/bags ARG for bams and roaming
# Bams ARG
plans = Plan.create!([
  {item: 'bam', name:'BAM Utra 8 Gb', price: 10882, nid_country: 'CHL',
    detail:' El plan incluye: 8 Gb / vel. descarga nacional promedio: 2,5 Mbps (nacional) y 1,5 Mbps (internacional) '},
  {item: 'bam', name:'BAM Ultra 15 Gb', price: 15924, nid_country: 'CHL',
    detail:' El plan incluye: 15 Gb / vel. descarga nacional promedio: 2,5 Mbps (nacional) y 1,5 Mbps (internacional) '},
  {item: 'bam', name:'BAM Ultra 20 Gb', price: 19286, nid_country: 'CHL',
    detail:' El plan incluye: 20 Gb / vel. descarga nacional promedio: 4,5 Mbps (nacional) y 3,5 Mbps (internacional) '},
  {item: 'bam', name:'BAM Ultra 25 Gb', price: 25168, nid_country: 'CHL',
    detail:' El plan incluye: 25 Gb / vel. descarga nacional promedio: 5,5 Mbps (nacional) y 5,0 Mbps (internacional) '},
  {item: 'bam', name:'BAM Ultra 30 Gb', price: 32807, nid_country: 'CHL',
    detail:' El plan incluye: 30 Gb / vel. descarga nacional promedio: 5,5 Mbps (nacional) y 5,0 Mbps (internacional) '}
])
puts(plans)



=begin

# Assign smartphones, bam and sims to users
records = UserRecord.create!([
  {user_id: 10000, bam_id: 10004, sim_id: 10000},
  {user_id: 10001, bam_id: 10001, sim_id: 10001},
  {user_id: 10002, smartphone_id: 10000, sim_id: 10002},
  {user_id: 10003, smartphone_id: 10005},
  {user_id: 10004, smartphone_id: 10003, sim_id: 10007},
  {user_id: 10005, smartphone_id: 10002},
  {user_id: 10008, sim_id: 10005},
  {user_id: 10009, sim_id: 10006}
])
puts(records)

# Change available value of all hardwares assigned
# Smartphone
[10000,10002,10003,10005].each do |h|
  hw = Smartphone.find(h)
  hw.update_attributes(available: false)
end
# Bam
[10001,10003].each do |h|
  hw = Bam.find(h)
  hw.update_attributes(available: false)
end
# Sim
[10000,10001,10005,10006].each do |h|
  hw = Sim.find(h)
  hw.update_attributes(available: false)
end

# Requests
requests = Request.create!([
  {user_id: 10005, request: 'smartphone', state: 'new', status: 'accepted',
    comment: 'Necesito el smartphone lo antes posible'},
  {user_id: 10002, request: 'smartphone', state: 'lost', status: 'approval pending',
    comment: 'Se me perdio el smartphone en viaje fuera del pais'},
  {user_id: 10003, request: 'smartphone', state: 'technical service', status: 'in repairs',
    comment: 'Se rompio la pantalla en salida a terreno'},
  {user_id: 10000, request: 'bam', state: 'stolen', status: 'rejected',
    comment: 'Me robaron aparato BAM'},
  {user_id: 10001, request: 'bam', state: 'renew', status: 'ready to deliver',
    comment: 'BAM es muy antiguo y necesito mayor velocidad de navegacion'},
  {user_id: 10006, request: 'sim', state: 'new', status: 'dispatched',
    comment: 'Necesito SIM de CCU para instalar en mi smartphone'},
  {user_id: 10007, request: 'sim', state: 'stolen', status: 'accepted',
    comment: 'Necesito nueva SIM porque me robaron bolso donde tenia el smartphone con la SIM'}
])
puts(requests)

=end
