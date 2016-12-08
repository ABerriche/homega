# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Provider.destroy_all





url_1 = "http://www.tnchauffage.fr/upload/Image/chauffagiste-plombier-caudry-cambrai.JPG"
url_2 = "http://ags.plomberie.free.fr/logo_AGS_plomberie.jpg"
url_3 = "http://www.plombier-saintgermainenlaye.com/images/images/bandeau-andre-saint-germain-en-laye.png"
url_4 = "http://www.entreprisedeplomberie.fr/wp-content/uploads/2016/03/voiture-ETS-TORTOSA-new.png"
url_5 = "http://annuaire.laposte.fr/uploads/813/004/81300462900016/logo.jpg"
#url_6 = "http://www.andre-chapelat.fr/theme/img/logoentreprise.png"
#url_7 = "http://www.plomberielarocque.com/wp-content/themes/twentythirteen-child/img/plomberieGL-Logo.png"



provider1 = Provider.create!(first_name: "Nicolas",
                            last_name: "TAISNE",
                            address: "27 Rue du Calvaire",
                            zip_code: "92400",
                            city: "Courbevoie",
                            company:"SARL TN Chauffage",
                            category: "Dégâts des eaux",
                            speciality: "Plomberie")
provider1.photo_url = url_1
provider1.save

provider2 = Provider.create!(first_name: "Gilbert",
                            last_name: "SAVONA",
                            address: "31 rue de la Bourdaisière",
                            zip_code: "93130",
                            city: "Rosny sous Bois",
                            company:"AGS Plomberie",
                            category: "Dégâts des eaux",
                            speciality: "Plomberie")
provider2.photo_url = url_2
provider2.save

provider3 = Provider.create!(first_name: "André",
                            last_name: "DA SILVA",
                            address: "5 avenue du Professeur Roux",
                            zip_code: "78100",
                            city: "Saint Germain en Laye",
                            company:"Entreprise André",
                            category: "Dégâts des eaux",
                            speciality: "Plomberie")
provider3.photo_url = url_3
provider3.save

provider4 = Provider.create!(first_name: "Mickael",
                            last_name: "TORTOSA",
                            address: "42 rue de Maubeuge",
                            zip_code: "75009",
                            city: "Paris",
                            company:"Etablissement TORTOSA",
                            category: "Dégâts des eaux",
                            speciality: "Plomberie")
provider4.photo_url = url_4
provider4.save

provider5 = Provider.create!(first_name: "Adoni",
                            last_name: "GABOU",
                            address: "55 boulevard Pereire",
                            zip_code: "75017",
                            city: "Paris",
                            company:"LOUBI Plombelec",
                            category: "Dégâts des eaux",
                            speciality: "Plomberie")
provider5.photo_url = url_5
provider5.save
