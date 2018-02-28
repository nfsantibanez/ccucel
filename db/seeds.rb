
################################################################################################
####################################### DATA FOR ADMIN #########################################
# Create admin in development and production env
if Rails.env.development? || Rails.env.production?
  # Main user admin
  admin = Admin.create!(username: 'solcelulares', email: 'solcelulares@ccu.cl',
    password: 'Ccuwebcel', password_confirmation: 'Ccuwebcel')
  puts(admin)
end
################################################################################################
################################################################################################


################################################################################################
####################################### DATA FOR CATALOG #######################################
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

  # Bams Catalog CHL
  bams = Bam.create!([
    {model: 'BAM E8372H LTE', price: 0, code: '133167', state: 'catalog', country: 'CHL'}
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
################################################################################################
################################################################################################


################################################################################################
#################################### DATA FOR TEST ENV #########################################
if Rails.env.test?
  # Main user admin
  admin = Admin.create!(username: 'testadmin', email: 'solcelulares@ccu.cl',
    password: 'passtest', password_confirmation: 'passtest')
  puts(admin)
  # Users CHL
  users = User.create!([
    {name: 'Constanza', last_name: 'Calderon Sanchez', national_id:'13362555-0', email:'nisanti@ccu.cl',
      jobtitle: 'Operario de Maquinas', supervisor: 'Nicolas Santibanez', country: 'CHL',
      supervisor_email: 'nscnico@gmail.com', deptname: '290766000', location: '30_VITA',
      company: '13', job_family: 'OO'},
    {name: 'Javier', last_name: 'Castro Maldonado', national_id: '8208182-8', email: 'solcelulares@ccu.cl',
      jobtitle: 'Gerente Informatica', supervisor: 'Nicolas Santibanez', country: 'CHL',
      supervisor_email: 'nscnico@gmail.com', deptname: '290776000', location: '30_VITA',
      company: '23', job_family: 'GE'}
  ])
  puts(users)

  # Smartphones to CHL users
  smartphones = Smartphone.create!([
    {model: 'Samsung Galaxy S8', category: 'GE', imei:'353227075802167',
      price: 200836, code: '106616', state: 'new',
      country: 'CHL', phone_number: 98738446},
    {model: 'Samsung Galaxy J5', category: 'EE', imei:'359878069666481',
      price: 40333, code: '106583', state: 'used',
      country: 'CHL', phone_number: 98993847}
  ])
  puts(smartphones)

  # Bams to CHL users
  bams = Bam.create!([
    {model: 'BAM E8372H LTE', imei:'952427835802167', price: 0, code: '133167',
      state: 'new', country: 'CHL'},
    {model: 'BAM E8372H LTE', imei:'984557575805360', price: 0, code: '133167',
      state: 'used', country: 'CHL'}
  ])
  puts(bams)

  # Sims to CHL users
  sims = Sim.create!([
    {phone_number: '82099147', country: 'CHL', state: 'used'},
    {phone_number: '84099131', country: 'CHL'},
  ])
  puts(sims)

  # user
  user1 = User.find_by_national_id('13362555-0')
  user2 = User.find_by_national_id('8208182-8')
  puts(user1,user2)

  # Smartphone
  sp1 = Smartphone.find_by_imei('359878069666481')
  sp2 = Smartphone.find_by_imei('353227075802167')
  puts(sp1,sp2)

  # Bam
  bam1 = Bam.find_by_imei('952427835802167')
  bam2 = Bam.find_by_imei('984557575805360')
  puts(bam1,bam2)

  # Sim
  sim1 = Sim.find_by_phone_number('82099147')
  sim2 = Sim.find_by_phone_number('84099131')
  puts(sim1,sim2)

  # Bam plan
  plan1 = Plan.find_by_name('1452 BAM Pro 4 Gb Normal')
  plan2 = Plan.find_by_name('1454 BAM Pro 12 Gb Normal')
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
end
