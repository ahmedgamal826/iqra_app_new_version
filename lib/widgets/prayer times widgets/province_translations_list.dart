Map<String, String> provinceTranslations = {
  // مصر
  'Cairo': 'القاهرة',
  'Giza': 'الجيزة',
  'Alexandria': 'الإسكندرية',
  'Mansoura': 'المنصورة',
  'Aswan': 'أسوان',
  'Dakahlia': 'الدقهلية',
  'Sharqia': 'الشرقية',
  'Gharbia': 'الغربية',
  'Kafr El Sheikh': 'كفر الشيخ',
  'Port Said': 'بورسعيد',
  'Ismailia': 'الإسماعيلية',
  'Suez': 'السويس',
  'Fayoum': 'الفيوم',
  'Beni Suef': 'بني سويف',
  'Minya': 'المنيا',
  'Assiut': 'أسيوط',
  'Sohag': 'سوهاج',
  'Qena': 'قنا',
  'Luxor': 'الأقصر',
  'Red Sea': 'البحر الأحمر',
  'Matruh': 'مطروح',
  'North Sinai': 'شمال سيناء',
  'South Sinai': 'جنوب سيناء',

  // السعودية
  'Riyadh': 'الرياض',
  'Jeddah': 'جدة',
  'Mecca': 'مكة',
  'Medina': 'المدينة',
  'Dammam': 'الدمام',
  'Khobar': 'الخبر',
  'Dhahran': 'ظهران',
  'Abha': 'أبها',
  'Tabuk': 'تبوك',
  'Hail': 'حائل',
  'Najran': 'نجران',
  'Buraidah': 'بريدة',
  'Al Qassim': 'القصيم',
  'Al Jouf': 'الجوف',
  'Northern Borders': 'الحدود الشمالية',
  'Al Bahah': 'الباحة',
  'Jizan': 'جازان',

  // الجزائر
  'Algiers': 'الجزائر',
  'Oran': 'وهران',
  'Constantine': 'قسنطينة',
  'Tizi Ouzou': 'تيزي وزو',
  'Annaba': 'عنابة',
  'Batna': 'باتنة',
  'Bejaia': 'بجاية',
  'Blida': 'البليدة',
  'Setif': 'سطيف',
  'Tlemcen': 'تلمسان',
  'Skikda': 'سكيكدة',
  'Sidi Bel Abbes': 'سيدي بلعباس',
  'Guelma': 'قالمة',

  // المغرب
  'Rabat': 'الرباط',
  'Casablanca': 'الدار البيضاء',
  'Fes': 'فاس',
  'Marrakech': 'مراكش',
  'Agadir': 'أكادير',
  'Tangier': 'طنجة',
  'Oujda': 'وجدة',
  'Meknes': 'مكناس',
  'El Jadida': 'الجديدة',
  'Kenitra': 'القنيطرة',

  // تونس
  'Tunis': 'تونس',
  'Sousse': 'سوسة',
  'Sfax': 'صفاقس',
  'Nabeul': 'نابل',
  'Bizerte': 'بنزرت',
  'Kairouan': 'القيروان',
  'Monastir': 'المهدية',
  'Gabes': 'قابس',
  'Gafsa': 'قفصة',

  // الإمارات
  'Abu Dhabi': 'أبو ظبي',
  'Dubai': 'دبي',
  'Sharjah': 'الشارقة',
  'Ajman': 'عجمان',
  'Umm Al-Quwain': 'أم القيوين',
  'Fujairah': 'الفجيرة',
  'Ras Al Khaimah': 'رأس الخيمة',

  // الكويت
  'Kuwait City': 'مدينة الكويت',
  'Hawalli': 'حولي',
  'Mubarak Al-Kabeer': 'مبارك الكبير',
  'Al Ahmadi': 'الأحمدي',
  'Farwaniyah': 'الفروانية',
  'Jahra': 'الجهراء',

  // عمان
  'Muscat': 'مسقط',
  'Dhofar': 'ظفار',
  'Dakhiliyah': 'الداخلية',
  'Al Sharqiyah': 'الشرقية',
  'Al Batinah': 'الباطنة',
  'Musandam': 'مسندم',

  // البحرين
  'Manama': 'المنامة',
  'Muharraq': 'المحرق',
  'Southern Governorate': 'المحافظة الجنوبية',
  'Northern Governorate': 'المحافظة الشمالية',
  'Capital Governorate': 'محافظة العاصمة',

  // قطر
  'Doha': 'الدوحة',
  'Al Rayyan': 'الريان',
  'Al Wakrah': 'الوكرة',
  'Al Khor': 'الخور',
  'Umm Salal': 'أم صلال',
  'Al Daayen': 'الظعاين',

  // الأردن
  'Amman': 'عمان',
  'Irbid': 'إربد',
  'Zarqa': 'الزرقاء',
  'Aqaba': 'العقبة',
  'Mafraq': 'المفرق',
  'Karak': 'الكرك',
  'Tafilah': 'الطفيلة',
  'Madaba': 'مادبا',

  // العراق
  'Baghdad': 'بغداد',
  'Basra': 'البصرة',
  'Mosul': 'الموصل',
  'Erbil': 'أربيل',
  'Sulaimaniyah': 'السليمانية',
  'Dhi Qar': 'ذي قار',
  'Kirkuk': 'كركوك',
  'Anbar': 'الأنبار',

  // سوريا
  'Damascus': 'دمشق',
  'Aleppo': 'حلب',
  'Homs': 'حمص',
  'Latakia': 'اللاذقية',
  'Daraa': 'درعا',
  'Tartus': 'طرطوس',

  // لبنان
  'Beirut': 'بيروت',
  'Mount Lebanon': 'جبل لبنان',
  'Nabatieh': 'النبطية',
  'South Lebanon': 'جنوب لبنان',
  'North Lebanon': 'شمال لبنان',

  // فلسطين
  'Jerusalem': 'القدس',
  'Gaza': 'غزة',
  'Ramallah': 'رام الله',
  'Nablus': 'نابلس',
  'Hebron': 'الخليل',

  // ليبيا
  'Tripoli': 'طرابلس',
  'Benghazi': 'بنغازي',
  'Misrata': 'مصراطة',
  'Zliten': 'زلطن',
  'Sirte': 'سرت',

  // السودان
  'Khartoum': 'الخرطوم',
  'Omdurman': 'أم درمان',
  'Darfur': 'دارفور',
  'Kordofan': 'كردفان',

  // اليمن
  'Sana\'a': 'صنعاء',
  'Aden': 'عدن',
  'Taiz': 'تعز',
  'Hajjah': 'حجة',

  // موريتانيا
  'Nouakchott': 'نواكشوط',
  'Nouadhibou': 'نواذيبو',
  'Rosso': 'روسو',

  // الصومال
  'Mogadishu': 'مقديشو',
  'Hargeisa': 'هرجيسا',

  // جيبوتي
  'Djibouti City': 'جيبوتي',

  // جزر القمر
  'Moroni': 'موروني',
};
