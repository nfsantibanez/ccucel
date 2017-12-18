#   Example
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Users
users = User.create!([
  {name: 'Constanza', last_name: 'Calderon Sanchez', rut:'13362555-0', email:'ccalde@ccu.cl',
    occupation: 'Operario de Maquinas', supervisor: 'Nicolas Santibanez',
    supervisor_email: 'nscnico@gmail.com', cost_center: '290766000'},
  {name: 'Sebastian', last_name: 'Claren Rubio', rut:'16054341-8', email: 'sclaren@ccu.cl',
    occupation: 'Vendedor Santiago', supervisor: 'Felipe Diaz',
    supervisor_email: 'nscnico@gmail.com', cost_center: '290501500'},
  {name: 'Claudia', last_name: 'Bonilla Toro', rut: '14121031-9', email: 'cbonil@ccu.cl',
    occupation: 'Gerente Tecnologia', supervisor: 'Marco Rios',
    supervisor_email: 'nscnico@gmail.com', cost_center: '290501100'},
  {name: 'Yerko', last_name: 'Araos Ramirez', rut: '16095197-4', email: 'yaraos@ccu.cl',
    occupation: 'Vendedor Region', supervisor: 'Nicolas Santibanez',
    supervisor_email: 'nscnico@gmail.com', cost_center: '290106000'},
  {name: 'Rodrigo', last_name: 'Monardes Nitrihual', rut: '13679739-5', email: 'rmonar@ccu.cl',
    occupation: 'Jefe Laboratorio', supervisor: 'Felipe Diaz',
    supervisor_email: 'nscnico@gmail.com', cost_center: '290108000'},
  {name: 'Guillermo', last_name: 'Giaconi Rodriguez', rut: '16943369-0', email: 'ggiaconi@ccu.cl',
    occupation: 'Subgerente systemas', supervisor: 'Marco Rios',
    supervisor_email: 'nscnico@gmail.com', cost_center: '290051000'},
  {name: 'Javier', last_name: 'Castro Maldonado', rut: '8208182-8', email: 'jcastro@ccu.cl',
    occupation: 'Gerente Informatica', supervisor: 'Nicolas Santibanez',
    supervisor_email: 'nscnico@gmail.com', cost_center: '290776000'},
  {name: 'Carmen Gloria', last_name: 'Utili Escudero', rut: '5192357-K', email: 'cutili@ccu.cl',
    occupation: 'Ejecutiva Aprovisionamiento', supervisor: 'Felipe Diaz',
    supervisor_email: 'nscnico@gmail.com', cost_center: '540796000'},
  {name: 'Marcelo', last_name: 'Cabrera Rubio', rut: '16371090-0', email: 'mcabrera@ccu.cl',
    occupation: 'Ingeniero de Televenta', supervisor: 'Marco Rios',
    supervisor_email: 'nscnico@gmail.com', cost_center: '290501500'},
  {name: 'Anain', last_name: 'Venegas Mondaca', rut: '8634532-3', email: 'avenega@ccu.cl',
    occupation: 'Tecnico de redes', supervisor: 'Nicolas Santibanez',
    supervisor_email: 'nscnico@gmail.com', cost_center: '290845000'}
])
puts(users)

# Sims
sims = Sim.create!([
  {phone_number: 82099147, last_owner: 'Constanza Cabrera'},
  {phone_number: 93192570, last_owner: 'Norma Acuna'},
  {phone_number: 84099131, last_owner: 'Victor Santibanez'},
  {phone_number: 51999216, last_owner: 'Carmen Castro'},
  {phone_number: 93192661, last_owner: 'Jose Luis Cabrera'},
  {phone_number: 97991465},
  {phone_number: 76681990},
  {phone_number: 62082805},
  {phone_number: 66285644},
  {phone_number: 99158447},
  {phone_number: 82593542},
  {phone_number: 82491446},
  {phone_number: 93185497, last_owner: 'Felipe Castro'},
  {phone_number: 42178031, last_owner: 'Gonzalo Inostroza'},
  {phone_number: 93186475, last_owner: 'Claudia Munoz'}
])
puts(sims)

# Smartphones
smartphones = Smartphone.create!([
  {model: 'Samsung Galaxy S8', category: 'gerente', imei:'353227075802167', price: 200836,
  last_owner: 'Marco Sepulveda', state: 'used', sim_id: 3},
  {model: 'Samsung Galaxy S8', category: 'gerente', imei:'359878069666630', price: 200836,
  last_owner: 'Carolina Arredondo', state: 'used'},
  {model: 'Samsung Galaxy S7', category: 'subgerente', imei:'35688706001064', price: 158820,
  last_owner: 'Kathy Whiting', state: 'used'},
  {model: 'Samsung Galaxy J7', category: 'profesional/tecnico', imei:'35881306155560', price: 50417,
  last_owner: 'Felipe Arriagada', state: 'used', sim_id: 8},
  {model: 'Samsung Galaxy J7', category: 'profesional/tecnico', imei:'352141079023186', price: 50417},
  {model: 'Samsung Galaxy S7', category: 'jefe venta/vendedor', imei:'359878063788620', price: 158820},
  {model: 'Samsung Galaxy S7', category: 'jefe venta/vendedor', imei:'35687805120863', price: 158820},
  {model: 'Samsung Galaxy S7', category: 'empleado/operario', imei:'359878069666481', price: 40333,
    last_owner: 'Andres Soto', state: 'used'},
  {model: 'Samsung Galaxy J7', category: 'empleado/operario', imei:'35214073409175', price: 40333},
  {model: 'Samsung Galaxy J5', category: 'multiusuario', imei:'359048050341094', price: 40333,
    last_owner: 'Guillermo Aguilar', state: 'used'}

])
puts(smartphones)

# Bams
bams = Bam.create!([
  {model: 'Huaewi E5573', imei:'952427835802167', price: 35990,
    last_owner: 'Joaquin Zunino', state: 'used'},
  {model: 'Huaewi E5573', imei:'984557575805360', price: 35990,
    last_owner: 'Francisca Irarrazaval', state: 'used', sim_id: 2},
  {model: 'Huaewi E5573', imei:'996883330106421', price: 35990},
  {model: 'Huaewi E8372', imei:'918813063325600', price: 25990, sim_id: 1},
  {model: 'Huaewi E8372', imei:'932414072893167', price: 25990,
    last_owner: 'Mariana Fernandez', state: 'used'}
])
puts(bams)

# Assign smartphones, bam and sims to users
records = UserRecord.create!([
  {user_id: 1, bam_id: 4, sim_id: 1},
  {user_id: 2, bam_id: 2, sim_id: 2},
  {user_id: 3, smartphone_id: 1, sim_id: 3},
  {user_id: 4, smartphone_id: 6},
  {user_id: 5, smartphone_id: 4, sim_id: 8},
  {user_id: 6, smartphone_id: 3},
  {user_id: 9, sim_id: 6},
  {user_id: 10, sim_id: 7}
])
puts(records)

# Change available value of all hardwares assigned
# Smartphone
[1,3,4,6].each do |h|
  hw = Smartphone.find(h)
  hw.update_attributes(available: false)
end
# Bam
[2,4].each do |h|
  hw = Bam.find(h)
  hw.update_attributes(available: false)
end
# Sim
[1,2,6,7].each do |h|
  hw = Sim.find(h)
  hw.update_attributes(available: false)
end

# Requests
requests = Request.create!([
  {user_id: 6, request: 'smartphone', state: 'new', status: 'accepted',
    comment: 'Necesito el smartphone lo antes posible'},
  {user_id: 3, request: 'smartphone', state: 'lost', status: 'approval pending',
    comment: 'Se me perdio el smartphone en viaje fuera del pais'},
  {user_id: 4, request: 'smartphone', state: 'technical service', status: 'in repairs',
    comment: 'Se rompio la pantalla en salida a terreno'},
  {user_id: 1, request: 'bam', state: 'stolen', status: 'rejected',
    comment: 'Me robaron aparato BAM'},
  {user_id: 2, request: 'bam', state: 'renew', status: 'ready to deliver',
    comment: 'BAM es muy antiguo y necesito mayor velocidad de navegacion'},
  {user_id: 7, request: 'sim', state: 'new', status: 'dispatched',
    comment: 'Necesito SIM de CCU para instalar en mi smartphone'},
  {user_id: 8, request: 'sim', state: 'stolen', status: 'accepted',
    comment: 'Necesito nueva SIM porque me robaron bolso donde tenia el smartphone con la SIM'}
])
puts(requests)
