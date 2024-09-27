List<String> getProvincesForCountry(String country) {
  switch (country) {
    case 'Egypt':
      return [
        'Cairo',
        'Giza',
        'Alexandria',
        'Mansoura',
        'Aswan',
        'Dakahlia',
        'Sharqia',
        'Gharbia',
        'Kafr El Sheikh',
        'Port Said',
        'Ismailia',
        'Suez',
        'Fayoum',
        'Beni Suef',
        'Minya',
        'Assiut',
        'Sohag',
        'Qena',
        'Luxor',
        'Red Sea',
        'Matruh',
        'North Sinai',
        'South Sinai'
      ];
    case 'Saudi Arabia':
      return [
        'Riyadh',
        'Jeddah',
        'Mecca',
        'Medina',
        'Dammam',
        'Khobar',
        'Dhahran',
        'Abha',
        'Tabuk',
        'Hail',
        'Najran',
        'Buraidah',
        'Al Qassim',
        'Al Jouf',
        'Northern Borders',
        'Al Bahah',
        'Jizan'
      ];
    case 'Algeria':
      return [
        'Algiers',
        'Oran',
        'Constantine',
        'Tizi Ouzou',
        'Annaba',
        'Batna',
        'Bejaia',
        'Blida',
        'Setif',
        'Tlemcen',
        'Skikda',
        'Sidi Bel Abbes',
        'Guelma'
      ];
    case 'Morocco':
      return [
        'Rabat',
        'Casablanca',
        'Fes',
        'Marrakech',
        'Agadir',
        'Tangier',
        'Oujda',
        'Meknes',
        'El Jadida',
        'Kenitra'
      ];
    case 'Tunisia':
      return [
        'Tunis',
        'Sousse',
        'Sfax',
        'Nabeul',
        'Bizerte',
        'Kairouan',
        'Monastir',
        'Gabes',
        'Gafsa'
      ];
    case 'United Arab Emirates':
      return [
        'Abu Dhabi',
        'Dubai',
        'Sharjah',
        'Ajman',
        'Umm Al-Quwain',
        'Fujairah',
        'Ras Al Khaimah'
      ];
    case 'Kuwait':
      return [
        'Kuwait City',
        'Hawalli',
        'Mubarak Al-Kabeer',
        'Al Ahmadi',
        'Farwaniyah',
        'Jahra'
      ];
    case 'Oman':
      return [
        'Muscat',
        'Dhofar',
        'Dakhiliyah',
        'Al Sharqiyah',
        'Al Batinah',
        'Musandam'
      ];
    case 'Bahrain':
      return [
        'Manama',
        'Muharraq',
        'Southern Governorate',
        'Northern Governorate',
        'Capital Governorate'
      ];
    case 'Qatar':
      return [
        'Doha',
        'Al Rayyan',
        'Al Wakrah',
        'Al Khor',
        'Umm Salal',
        'Al Daayen'
      ];
    case 'Jordan':
      return [
        'Amman',
        'Irbid',
        'Zarqa',
        'Aqaba',
        'Mafraq',
        'Karak',
        'Tafilah',
        'Madaba'
      ];
    case 'Iraq':
      return [
        'Baghdad',
        'Basra',
        'Mosul',
        'Erbil',
        'Sulaimaniyah',
        'Dhi Qar',
        'Kirkuk',
        'Anbar'
      ];
    case 'Syria':
      return ['Damascus', 'Aleppo', 'Homs', 'Latakia', 'Daraa', 'Tartus'];
    case 'Lebanon':
      return [
        'Beirut',
        'Mount Lebanon',
        'Nabatieh',
        'South Lebanon',
        'North Lebanon'
      ];
    case 'Palestine':
      return ['Jerusalem', 'Gaza', 'Ramallah', 'Nablus', 'Hebron'];
    case 'Libya':
      return ['Tripoli', 'Benghazi', 'Misrata', 'Zliten', 'Sirte'];
    case 'Sudan':
      return ['Khartoum', 'Omdurman', 'Darfur', 'Kordofan'];
    case 'Yemen':
      return ['Sana\'a', 'Aden', 'Taiz', 'Hajjah'];
    case 'Mauritania':
      return ['Nouakchott', 'Nouadhibou', 'Rosso'];
    case 'Somalia':
      return ['Mogadishu', 'Hargeisa'];
    case 'Djibouti':
      return ['Djibouti City'];
    case 'Comoros':
      return ['Moroni'];
    default:
      return [];
  }
}
