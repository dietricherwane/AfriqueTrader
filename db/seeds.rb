# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Profile.create([{ name: 'Entreprise financière', shortcut: 'ENFIN' }, { name: 'Journalistes', shortcut: 'JOUR' }, { name: 'Analystes', shortcut: 'ANA' }, { name: 'Administrateur', shortcut: 'ADMIN' }, { name: 'Vérificateur', shortcut: 'VERIF' }, { name: 'Chef analyste', shortcut: 'CANAL' }])

SocialStatus.create([{name: "SA", user_id: 1}, {name: "SARL", user_id: 1}])

SalesArea.create([{name: "Informatique / Télécoms", user_id: 1}, {name: "Marketing", user_id: 1}])

AdviceCategory.create([{name: "Achat", user_id: 1}, {name: "Vente", user_id: 1}, {name: "Conserver", user_id: 1}, {name: "Observer", user_id: 1}])

PublicationCategory.create([{name: "Actualité sur la bourse", user_id: 1}, {name: "Gestion de patrimoine", user_id: 1}, {name: "Apprendre", user_id: 1}, {name: "News", user_id: 1}])

ArticleCategory.create([{name: "Matières premières", user_id: 1}, {name: "Variation des devises", user_id: 1}])

InvestmentCompanyCategory.create([{name: "Fonds Commun de Placement", user_id: 1}, {name: "Société d'Investissement à Capital Variable", user_id: 1}])
