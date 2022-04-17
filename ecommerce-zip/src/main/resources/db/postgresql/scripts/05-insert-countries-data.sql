SET SCHEMA 'ecommerce';

-- -----------------------------------------------------
-- Countries
-- -----------------------------------------------------
INSERT INTO country(id, code, name) VALUES (1, 'BR', 'Brazil');
INSERT INTO country(id, code, name) VALUES (2, 'CA','Canada');
INSERT INTO country(id, code, name) VALUES (3, 'DE','Germany');
INSERT INTO country(id, code, name) VALUES (4, 'IN','India');
INSERT INTO country(id, code, name) VALUES (5,'TR','Turkey');
INSERT INTO country(id, code, name) VALUES (6, 'US','United States');

-- -----------------------------------------------------
-- States
-- -----------------------------------------------------
INSERT INTO state(name, country_id) VALUES ('Acre',1);
INSERT INTO state(name, country_id) VALUES ('Alagoas',1);
INSERT INTO state(name, country_id) VALUES ('Amapá',1);
INSERT INTO state(name, country_id) VALUES ('Amazonas',1);
INSERT INTO state(name, country_id) VALUES ('Bahia',1);
INSERT INTO state(name, country_id) VALUES ('Ceará',1);
INSERT INTO state(name, country_id) VALUES ('Distrito Federal',1);
INSERT INTO state(name, country_id) VALUES ('Espírito Santo',1);
INSERT INTO state(name, country_id) VALUES ('Goiás',1);
INSERT INTO state(name, country_id) VALUES ('Maranhão',1);
INSERT INTO state(name, country_id) VALUES ('Mato Grosso do Sul',1);
INSERT INTO state(name, country_id) VALUES ('Mato Grosso',1);
INSERT INTO state(name, country_id) VALUES ('Minas Gerais',1);
INSERT INTO state(name, country_id) VALUES ('Paraná',1);
INSERT INTO state(name, country_id) VALUES ('Paraíba',1);
INSERT INTO state(name, country_id) VALUES ('Pará',1);
INSERT INTO state(name, country_id) VALUES ('Pernambuco',1);
INSERT INTO state(name, country_id) VALUES ('Piaui',1);
INSERT INTO state(name, country_id) VALUES ('Rio de Janeiro',1);
INSERT INTO state(name, country_id) VALUES ('Rio Grande do Norte',1);
INSERT INTO state(name, country_id) VALUES ('Rio Grande do Sul',1);
INSERT INTO state(name, country_id) VALUES ('Rondônia',1);
INSERT INTO state(name, country_id) VALUES ('Roraima',1);
INSERT INTO state(name, country_id) VALUES ('Santa Catarina',1);
INSERT INTO state(name, country_id) VALUES ('Sergipe',1);
INSERT INTO state(name, country_id) VALUES ('São Paulo',1);
INSERT INTO state(name, country_id) VALUES ('Tocantins',1);
INSERT INTO state(name, country_id) VALUES ('Alberta',2);
INSERT INTO state(name, country_id) VALUES ('British Columbia',2);
INSERT INTO state(name, country_id) VALUES ('Manitoba',2);
INSERT INTO state(name, country_id) VALUES ('New Brunswick',2);
INSERT INTO state(name, country_id) VALUES ('Newfoundland and Labrador',2);
INSERT INTO state(name, country_id) VALUES ('Northwest Territories',2);
INSERT INTO state(name, country_id) VALUES ('Nova Scotia',2);
INSERT INTO state(name, country_id) VALUES ('Nunavut',2);
INSERT INTO state(name, country_id) VALUES ('Ontario',2);
INSERT INTO state(name, country_id) VALUES ('Prince Edward Island',2);
INSERT INTO state(name, country_id) VALUES ('Quebec',2);
INSERT INTO state(name, country_id) VALUES ('Saskatchewan',2);
INSERT INTO state(name, country_id) VALUES ('Yukon',2);
INSERT INTO state(name, country_id) VALUES ('Baden-Württemberg',3);
INSERT INTO state(name, country_id) VALUES ('Bavaria',3);
INSERT INTO state(name, country_id) VALUES ('Berlin',3);
INSERT INTO state(name, country_id) VALUES ('Brandenburg',3);
INSERT INTO state(name, country_id) VALUES ('Bremen',3);
INSERT INTO state(name, country_id) VALUES ('Hamburg',3);
INSERT INTO state(name, country_id) VALUES ('Hesse',3);
INSERT INTO state(name, country_id) VALUES ('Lower Saxony',3);
INSERT INTO state(name, country_id) VALUES ('Mecklenburg-Vorpommern',3);
INSERT INTO state(name, country_id) VALUES ('North Rhine-Westphalia',3);
INSERT INTO state(name, country_id) VALUES ('Rhineland-Palatinate',3);
INSERT INTO state(name, country_id) VALUES ('Saarland',3);
INSERT INTO state(name, country_id) VALUES ('Saxony',3);
INSERT INTO state(name, country_id) VALUES ('Saxony-Anhalt',3);
INSERT INTO state(name, country_id) VALUES ('Schleswig-Holstein',3);
INSERT INTO state(name, country_id) VALUES ('Thuringia',3);
INSERT INTO state(name, country_id) VALUES ('Andhra Pradesh',4);
INSERT INTO state(name, country_id) VALUES ('Arunachal Pradesh',4);
INSERT INTO state(name, country_id) VALUES ('Assam',4);
INSERT INTO state(name, country_id) VALUES ('Bihar',4);
INSERT INTO state(name, country_id) VALUES ('Chhattisgarh',4);
INSERT INTO state(name, country_id) VALUES ('Goa',4);
INSERT INTO state(name, country_id) VALUES ('Gujarat',4);
INSERT INTO state(name, country_id) VALUES ('Haryana',4);
INSERT INTO state(name, country_id) VALUES ('Himachal Pradesh',4);
INSERT INTO state(name, country_id) VALUES ('Jammu & Kashmir',4);
INSERT INTO state(name, country_id) VALUES ('Jharkhand',4);
INSERT INTO state(name, country_id) VALUES ('Karnataka',4);
INSERT INTO state(name, country_id) VALUES ('Kerala',4);
INSERT INTO state(name, country_id) VALUES ('Madhya Pradesh',4);
INSERT INTO state(name, country_id) VALUES ('Maharashtra',4);
INSERT INTO state(name, country_id) VALUES ('Manipur',4);
INSERT INTO state(name, country_id) VALUES ('Meghalaya',4);
INSERT INTO state(name, country_id) VALUES ('Mizoram',4);
INSERT INTO state(name, country_id) VALUES ('Nagaland',4);
INSERT INTO state(name, country_id) VALUES ('Odisha',4);
INSERT INTO state(name, country_id) VALUES ('Punjab',4);
INSERT INTO state(name, country_id) VALUES ('Rajasthan',4);
INSERT INTO state(name, country_id) VALUES ('Sikkim',4);
INSERT INTO state(name, country_id) VALUES ('Tamil Nadu',4);
INSERT INTO state(name, country_id) VALUES ('Telangana',4);
INSERT INTO state(name, country_id) VALUES ('Tripura',4);
INSERT INTO state(name, country_id) VALUES ('Uttar Pradesh',4);
INSERT INTO state(name, country_id) VALUES ('Uttarakhand',4);
INSERT INTO state(name, country_id) VALUES ('West Bengal',4);
INSERT INTO state(name, country_id) VALUES ('Andaman and Nicobar Islands',4);
INSERT INTO state(name, country_id) VALUES ('Chandigarh',4);
INSERT INTO state(name, country_id) VALUES ('Dadra and Nagar Haveli',4);
INSERT INTO state(name, country_id) VALUES ('Daman & Diu',4);
INSERT INTO state(name, country_id) VALUES ('Lakshadweep',4);
INSERT INTO state(name, country_id) VALUES ('Puducherry',4);
INSERT INTO state(name, country_id) VALUES ('The Government of NCT of Delhi',4);
INSERT INTO state(name, country_id) VALUES ('Adıyaman',5);
INSERT INTO state(name, country_id) VALUES ('Afyonkarahisar',5);
INSERT INTO state(name, country_id) VALUES ('Ağrı',5);
INSERT INTO state(name, country_id) VALUES ('Aksaray',5);
INSERT INTO state(name, country_id) VALUES ('Amasya',5);
INSERT INTO state(name, country_id) VALUES ('Ankara',5);
INSERT INTO state(name, country_id) VALUES ('Antalya',5);
INSERT INTO state(name, country_id) VALUES ('Ardahan',5);
INSERT INTO state(name, country_id) VALUES ('Artvin',5);
INSERT INTO state(name, country_id) VALUES ('Aydın',5);
INSERT INTO state(name, country_id) VALUES ('Balıkesir',5);
INSERT INTO state(name, country_id) VALUES ('Bartın',5);
INSERT INTO state(name, country_id) VALUES ('Batman',5);
INSERT INTO state(name, country_id) VALUES ('Bayburt',5);
INSERT INTO state(name, country_id) VALUES ('Bilecik',5);
INSERT INTO state(name, country_id) VALUES ('Bingöl',5);
INSERT INTO state(name, country_id) VALUES ('Bitlis',5);
INSERT INTO state(name, country_id) VALUES ('Bolu',5);
INSERT INTO state(name, country_id) VALUES ('Burdur',5);
INSERT INTO state(name, country_id) VALUES ('Bursa',5);
INSERT INTO state(name, country_id) VALUES ('Çanakkale',5);
INSERT INTO state(name, country_id) VALUES ('Çankırı',5);
INSERT INTO state(name, country_id) VALUES ('Çorum',5);
INSERT INTO state(name, country_id) VALUES ('Denizli',5);
INSERT INTO state(name, country_id) VALUES ('Diyarbakır',5);
INSERT INTO state(name, country_id) VALUES ('Düzce',5);
INSERT INTO state(name, country_id) VALUES ('Edirne',5);
INSERT INTO state(name, country_id) VALUES ('Elazığ',5);
INSERT INTO state(name, country_id) VALUES ('Erzincan',5);
INSERT INTO state(name, country_id) VALUES ('Erzurum',5);
INSERT INTO state(name, country_id) VALUES ('Eskişehir',5);
INSERT INTO state(name, country_id) VALUES ('Gaziantep',5);
INSERT INTO state(name, country_id) VALUES ('Giresun',5);
INSERT INTO state(name, country_id) VALUES ('Gümüşhane',5);
INSERT INTO state(name, country_id) VALUES ('Hakkâri',5);
INSERT INTO state(name, country_id) VALUES ('Hatay',5);
INSERT INTO state(name, country_id) VALUES ('Iğdır',5);
INSERT INTO state(name, country_id) VALUES ('Isparta',5);
INSERT INTO state(name, country_id) VALUES ('İstanbul',5);
INSERT INTO state(name, country_id) VALUES ('İzmir',5);
INSERT INTO state(name, country_id) VALUES ('Kahramanmaraş',5);
INSERT INTO state(name, country_id) VALUES ('Karabük',5);
INSERT INTO state(name, country_id) VALUES ('Karaman',5);
INSERT INTO state(name, country_id) VALUES ('Kars',5);
INSERT INTO state(name, country_id) VALUES ('Kastamonu',5);
INSERT INTO state(name, country_id) VALUES ('Kayseri',5);
INSERT INTO state(name, country_id) VALUES ('Kırıkkale',5);
INSERT INTO state(name, country_id) VALUES ('Kırklareli',5);
INSERT INTO state(name, country_id) VALUES ('Kırşehir',5);
INSERT INTO state(name, country_id) VALUES ('Kilis',5);
INSERT INTO state(name, country_id) VALUES ('Kocaeli',5);
INSERT INTO state(name, country_id) VALUES ('Konya',5);
INSERT INTO state(name, country_id) VALUES ('Kütahya',5);
INSERT INTO state(name, country_id) VALUES ('Malatya',5);
INSERT INTO state(name, country_id) VALUES ('Manisa',5);
INSERT INTO state(name, country_id) VALUES ('Mardin',5);
INSERT INTO state(name, country_id) VALUES ('Mersin',5);
INSERT INTO state(name, country_id) VALUES ('Muğla',5);
INSERT INTO state(name, country_id) VALUES ('Muş',5);
INSERT INTO state(name, country_id) VALUES ('Nevşehir',5);
INSERT INTO state(name, country_id) VALUES ('Niğde',5);
INSERT INTO state(name, country_id) VALUES ('Ordu',5);
INSERT INTO state(name, country_id) VALUES ('Osmaniye',5);
INSERT INTO state(name, country_id) VALUES ('Rize',5);
INSERT INTO state(name, country_id) VALUES ('Sakarya',5);
INSERT INTO state(name, country_id) VALUES ('Samsun',5);
INSERT INTO state(name, country_id) VALUES ('Siirt',5);
INSERT INTO state(name, country_id) VALUES ('Sinop',5);
INSERT INTO state(name, country_id) VALUES ('Sivas',5);
INSERT INTO state(name, country_id) VALUES ('Şanlıurfa',5);
INSERT INTO state(name, country_id) VALUES ('Şırnak',5);
INSERT INTO state(name, country_id) VALUES ('Tekirdağ',5);
INSERT INTO state(name, country_id) VALUES ('Tokat',5);
INSERT INTO state(name, country_id) VALUES ('Trabzon',5);
INSERT INTO state(name, country_id) VALUES ('Tunceli',5);
INSERT INTO state(name, country_id) VALUES ('Uşak',5);
INSERT INTO state(name, country_id) VALUES ('Van',5);
INSERT INTO state(name, country_id) VALUES ('Yalova',5);
INSERT INTO state(name, country_id) VALUES ('Yozgat',5);
INSERT INTO state(name, country_id) VALUES ('Zonguldak',5);
INSERT INTO state(name, country_id) VALUES ('Alabama',6);
INSERT INTO state(name, country_id) VALUES ('Alaska',6);
INSERT INTO state(name, country_id) VALUES ('Arizona',6);
INSERT INTO state(name, country_id) VALUES ('Arkansas',6);
INSERT INTO state(name, country_id) VALUES ('California',6);
INSERT INTO state(name, country_id) VALUES ('Colorado',6);
INSERT INTO state(name, country_id) VALUES ('Connecticut',6);
INSERT INTO state(name, country_id) VALUES ('Delaware',6);
INSERT INTO state(name, country_id) VALUES ('District Of Columbia',6);
INSERT INTO state(name, country_id) VALUES ('Florida',6);
INSERT INTO state(name, country_id) VALUES ('Georgia',6);
INSERT INTO state(name, country_id) VALUES ('Hawaii',6);
INSERT INTO state(name, country_id) VALUES ('Idaho',6);
INSERT INTO state(name, country_id) VALUES ('Illinois',6);
INSERT INTO state(name, country_id) VALUES ('Indiana',6);
INSERT INTO state(name, country_id) VALUES ('Iowa',6);
INSERT INTO state(name, country_id) VALUES ('Kansas',6);
INSERT INTO state(name, country_id) VALUES ('Kentucky',6);
INSERT INTO state(name, country_id) VALUES ('Louisiana',6);
INSERT INTO state(name, country_id) VALUES ('Maine',6);
INSERT INTO state(name, country_id) VALUES ('Maryland',6);
INSERT INTO state(name, country_id) VALUES ('Massachusetts',6);
INSERT INTO state(name, country_id) VALUES ('Michigan',6);
INSERT INTO state(name, country_id) VALUES ('Minnesota',6);
INSERT INTO state(name, country_id) VALUES ('Mississippi',6);
INSERT INTO state(name, country_id) VALUES ('Missouri',6);
INSERT INTO state(name, country_id) VALUES ('Montana',6);
INSERT INTO state(name, country_id) VALUES ('Nebraska',6);
INSERT INTO state(name, country_id) VALUES ('Nevada',6);
INSERT INTO state(name, country_id) VALUES ('New Hampshire',6);
INSERT INTO state(name, country_id) VALUES ('New Jersey',6);
INSERT INTO state(name, country_id) VALUES ('New Mexico',6);
INSERT INTO state(name, country_id) VALUES ('New York',6);
INSERT INTO state(name, country_id) VALUES ('North Carolina',6);
INSERT INTO state(name, country_id) VALUES ('North Dakota',6);
INSERT INTO state(name, country_id) VALUES ('Ohio',6);
INSERT INTO state(name, country_id) VALUES ('Oklahoma',6);
INSERT INTO state(name, country_id) VALUES ('Oregon',6);
INSERT INTO state(name, country_id) VALUES ('Pennsylvania',6);
INSERT INTO state(name, country_id) VALUES ('Rhode Island',6);
INSERT INTO state(name, country_id) VALUES ('South Carolina',6);
INSERT INTO state(name, country_id) VALUES ('South Dakota',6);
INSERT INTO state(name, country_id) VALUES ('Tennessee',6);
INSERT INTO state(name, country_id) VALUES ('Texas',6);
INSERT INTO state(name, country_id) VALUES ('Utah',6);
INSERT INTO state(name, country_id) VALUES ('Vermont',6);
INSERT INTO state(name, country_id) VALUES ('Virginia',6);
INSERT INTO state(name, country_id) VALUES ('Washington',6);
INSERT INTO state(name, country_id) VALUES ('West Virginia',6);
INSERT INTO state(name, country_id) VALUES ('Wisconsin',6);
INSERT INTO state(name, country_id) VALUES ('Wyoming',6);