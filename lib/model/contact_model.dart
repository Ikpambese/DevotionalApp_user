class ContactModel {
  final String? country;
  final String? address;
  final String? state;
  final String? phone;
  final String? church;

  ContactModel(
      {this.address, this.country, this.phone, this.state, this.church});

  static List<ContactModel> model = [
    ContactModel(
      country: 'Nigeria',
      address:
          '1 Exemption Avenue, Off Artillery Street, Oliha Quarters, Siluoko Road, Benin City',
      state: 'EDO',
      phone: '+2347065327432',
      church: 'HEADQUARTERS',
    ),
    ContactModel(
      country: 'Nigeria',
      address:
          '2 Isitua Ndah Street, off Jesus Saves Road, Off Nnebisi Road, Asaba, Delta State',
      state: 'Delta',
      phone: '+2348100397708, +2348160141620',
      church: 'ASABA CITY CHURCH',
    ),
    ContactModel(
      country: 'Nigeria',
      address:
          '7th heaven event center, along Egbelu Akani road, off NTA road, Ozuoba, Portharcourt',
      state: 'RIVERS',
      phone: '+2348025019521, 07063815751',
      church: '',
    ),
    ContactModel(
      country: 'Nigeria',
      address: '84 Mission Road, Former Gym opp Estate Gate Okada, Benin City.',
      state: 'EDO',
      phone: '09043748689, 09057628295',
      church: 'OKADA CITY CHURCH ',
    ),
    ContactModel(
      country: 'Nigeria',
      address: '1 Pullen odia Street, Newton Street, Ekosodin (UGBOWO CHURCH)',
      state: '',
      phone: '+2348157923115, 09078379520',
      church: 'UGBOWO TOWN CHURCH',
    ),
    ContactModel(
      country: 'Nigeria',
      address: 'G2, Ogbidi Event Centre up stairs. Ekpoma.',
      state: '',
      phone: '09153321380, 09052719794',
      church: 'EKPOMA CITY CHURCH',
    ),
    ContactModel(
      country: 'Nigeria',
      address:
          'Grandmates School Event Centre, Samuel Ekuwola Street, by Lord Bus Stop, Ago Palace Way, Okota, Lagos State',
      state: '',
      phone: '08107897726, 08056171215',
      church: 'LAGOS CHURCH, MAINLAND',
    ),
    ContactModel(
      country: 'Nigeria',
      address: 'THE PRIMARY SCHOOL INSIDE EDO STATE POLYTECHNIC USEN',
      state: '',
      phone: '08158242954, 07057336028',
      church: '',
    ),
    ContactModel(
      country: 'Nigeria',
      address: 'LATIK HOTEL INEC ROAD, KPANSIA YENAGOA, BAYELSA STATE',
      state: '',
      phone: '07044371123, 08117090657',
      church: 'USEN TOWN CHURCH',
    ),
    ContactModel(
      country: 'Nigeria',
      address:
          'Federal University Otuoke Second floor, Minno House opposite Olumba, Otuoke, Bayelsa state',
      state: '',
      phone: '08162986423, 09071173037',
      church: 'OTUOKE TOWN CHURCH',
    ),
    ContactModel(
      country: 'Nigeria',
      address:
          '1-7, Otunba Bayo Dejonwo Street, Plywood Bus Stop, Lagos Road, Epe.',
      state: '',
      phone: '07068849362, 08130009110',
      church: 'LAGOS CHURCH, EPE',
    ),
    ContactModel(
      country: 'Nigeria',
      address:
          'Opposite police station, Ogbeishiegu junction Ogwashi Uku, Delta State',
      state: '',
      phone: '+2348109402845, +2349137614650',
      church: 'OGWASHI-UKU TOWN CHURCH',
    ),
  ];
}
