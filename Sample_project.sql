# Q1. Give a dense rank to the wine varities on the basis of the price.
 
# Q2. Use aggregate window functions to find the average of points for each row within
# its partition (country) and also arrange the final result in the descending order by country.
# print country,province,winery,variety

# Dataset Used: students.csv
-- --------------------------------------------------------------
# Q3. Provide the new roll numbers to the students on the basis of their names alphabetically.

-----------------------------------------------------------------
# Dataset Used: website_stats.csv and web.csv
-----------------------------------------------------------------

# Q4. Display the difference in ad_clicks between the current day and the next day for 
# the website 'Olympus'

# Q5. Write a query that displays the statistics for website_id = 3 such that for each row,
# show the day, the number of users and the smallest number of users ever.

# Dataset Used: play_store.csv and sale.csv
-- ---------------------------------------------------------------

# Q6. Write a query thats orders games in the play store into three buckets as 
#per editor ratings received  from higher to lowest

# Q7. Write a query that displays the name of the game, the price, the sale date and 
#the 4th column should display # the sales consecutive number i.e. ranking of game as 
#per the sale took place, so that the latest game sold gets number 1. 
#Order the result by editor's rating of the game

-----------------------------------------------------------------
# Dataset Used: movies.csv, ratings.csv, rent.csv
-----------------------------------------------------------------
# Q8. Write a query that displays basic movie informations as well as the previous rating 
#provided by customer for that same movie 
# make sure that the list is sorted by the id of the reviews.

# Q9. For each movie, show the following information: title, genre, average user rating for 
#that movie  and its rank in the respective genre based on that average rating in descending 
#order (so that the best movies will be shown first).

# Q10. For each rental date, show the rental_date, the sum of payment amounts 
#(column name payment_amounts) from rent 
#on that day, the sum of payment_amounts on the previous day and the difference between 
#these two values.

create database sql2inclass2;
use sql2inclass2;
CREATE TABLE IF NOT EXISTS wine (
    `country` VARCHAR(12) CHARACTER SET utf8,
    `designation` VARCHAR(49) CHARACTER SET utf8,
    `points` INT,
    `price` INT,
    `province` VARCHAR(20) CHARACTER SET utf8,
    `region_1` VARCHAR(41) CHARACTER SET utf8,
    `region_2` VARCHAR(23) CHARACTER SET utf8,
    `variety` VARCHAR(29) CHARACTER SET utf8,
    `winery` VARCHAR(29) CHARACTER SET utf8
);
INSERT INTO wine VALUES
    ('Argentina',NULL,85,12,'Other','Famatina Valley',NULL,'Malbec','Las Vides'),
    ('Germany','Piesporter Goldtröpfchen Auslese Goldkap',92,48,'Mosel-Saar-Ruwer',NULL,NULL,'Riesling','Kurt Hain'),
    ('Spain','Bla Bla Bla',83,15,'Spanish Islands','Vi de la Terra Mallorca',NULL,'Premsal','Terra de Falanis'),
    ('Canada',NULL,85,12,'Ontario','Niagara Peninsula',NULL,'Riesling','Cave Spring'),
    ('US','Sierra Mar Vineyard',86,55,'California','Santa Lucia Highlands','Central Coast','Pinot Noir','Bernardus'),
    ('Argentina','Seleccionada',86,18,'Mendoza Province','Mendoza',NULL,'Bonarda','Alma del Sur'),
    ('Spain','Vergel Joven',84,14,'Levante','Alicante',NULL,'Red Blend','La Bodega de Pinoso'),
    ('Italy',NULL,89,23,'Tuscany','Rosso di Montalcino',NULL,'Sangiovese Grosso','La Mannella'),
    ('Germany','Ürziger Würzgarten Kabinett',89,19,'Mosel',NULL,NULL,'Riesling','Karl Erbes'),
    ('Spain','Señorio de Garci Grande',85,14,'Northern Spain','Rueda',NULL,'Verdejo','Bodegas Garci Grande'),
    ('Argentina','Los Cardos',85,12,'Mendoza Province','Mendoza',NULL,'Malbec','Doña Paula'),
    ('US','Seco Highlands Estate',94,35,'California','Arroyo Seco','Central Coast','Pinot Noir','Kendall-Jackson'),
    ('Spain',NULL,87,22,'Northern Spain','Bierzo',NULL,'Godello','Luna Beberide'),
    ('US','Rose Wine',90,12,'California','Santa Ynez Valley','Central Coast','Rosé','Foley & Phillips'),
    ('Argentina','Barrel Select',85,14,'Mendoza Province','Mendoza',NULL,'Chardonnay','Bodega Norton'),
    ('Germany','Mettenheimer',89,14,'Rheinhessen',NULL,NULL,'Pinot Noir','Schäfer'),
    ('US',NULL,81,24,'California','Napa County','Napa','Merlot','Irish Monkey Cellars'),
    ('US','Pagani Reserve',91,40,'California','Sonoma Valley','Sonoma','Zinfandel','St. Francis'),
    ('US','Point Break',86,24,'California','North Coast','North Coast','Red Blend','Longboard'),
    ('Italy','Bussia Riserva',91,NULL,'Piedmont','Barolo',NULL,'Nebbiolo','Silvano Bolmida'),
    ('New Zealand',NULL,84,NULL,'Martinborough',NULL,NULL,'Syrah','Kusuda'),
    ('US','JK''s',90,24,'California','Livermore Valley','Central Coast','Cabernet Sauvignon','Mitchell Katz Winery'),
    ('France','Grande Cuvée la Chaudouillonne',91,NULL,'Loire Valley','Sancerre',NULL,'Sauvignon Blanc','Fournier Père et Fils'),
    ('Argentina','Paisaje de Barrancas',93,18,'Mendoza Province','Mendoza',NULL,'Red Blend','Finca Flichman'),
    ('Portugal','Monte da Cal',87,10,'Alentejano',NULL,NULL,'Portuguese Red','Dão Sul'),
    ('South Africa','Reserve',86,18,'Paarl',NULL,NULL,'Shiraz','Montestell'),
    ('Chile','Castillo de Molina Reserva',86,12,'Cachapoal Valley',NULL,NULL,'Merlot','San Pedro'),
    ('US',NULL,93,125,'California','Napa Valley','Napa','Meritage','William Hill Estate'),
    ('US','Coastal Selection',82,13,'California','Central Coast','Central Coast','Pinot Noir','Mirassou'),
    ('France','Les Vaillons Vieilles Vignes Premier Cru',89,44,'Burgundy','Chablis',NULL,'Chardonnay','Domaine Laroche'),
    ('US',NULL,82,20,'California','Napa Valley','Napa','Cabernet Sauvignon','Ca'' Momi'),
    ('Italy','Diecicoppe',86,16,'Central Italy','Colline Pescaresi',NULL,'Red Blend','Pasetti'),
    ('Portugal','Duas Quintas Reserva Especial',93,67,'Douro',NULL,NULL,'Portuguese Red','Ramos-Pinto'),
    ('France','Cuvée Hyménée Brut',90,89,'Champagne','Champagne',NULL,'Champagne Blend','Tendil & Lombardi'),
    ('US','Monarch Mine Vineyard',90,25,'California','Sierra Foothills','Sierra Foothills','Roussanne','Terre Rouge'),
    ('US','Reserve',82,20,'California','Edna Valley','Central Coast','Chardonnay','Norman'),
    ('US','25th Vintage Rubino Super-Tuscan Style Blend',85,22,'Pennsylvania','Pennsylvania',NULL,'Red Blend','Chaddsford'),
    ('Portugal','Ciconia',85,10,'Alentejano',NULL,NULL,'Portuguese Red','Herdade de São Miguel'),
    ('France','Barrel Sample',91,NULL,'Bordeaux','Pessac-Léognan',NULL,'Bordeaux-style White Blend','Château Carbonnieux'),
    ('Argentina','AR',88,22,'Mendoza Province','Mendoza',NULL,'Malbec','Tamarí'),
    ('US','Valley View Vineyard',85,25,'California','Santa Barbara County','Central Coast','Cabernet Sauvignon','Lucas & Lewellen'),
    ('Chile',NULL,84,8,'Central Valley',NULL,NULL,'Sauvignon Blanc','Caliterra'),
    ('France',NULL,94,130,'Burgundy','Corton-Charlemagne',NULL,'Chardonnay','Louis Latour'),
    ('France','Domaine Paradis',85,NULL,'Beaujolais','Saint-Amour',NULL,'Gamay','Georges Duboeuf'),
    ('France',NULL,84,15,'Bordeaux','Bordeaux Blanc',NULL,'Sauvignon Blanc','Château Laubès'),
    ('US',NULL,80,25,'California','Dry Creek Valley','Sonoma','Merlot','Hawley'),
    ('Italy','Casa Boschino',87,17,'Tuscany','Toscana',NULL,'Red Blend','San Fabiano Calcinaia'),
    ('France','Château Bois Chantant',89,NULL,'Bordeaux','Bordeaux',NULL,'Bordeaux-style Red Blend','Bernard Magrez'),
    ('US','Melbury',95,225,'California','Napa Valley','Napa','Cabernet Blend','BOND'),
    ('US','Artist Series #12',91,44,'Washington','Columbia Valley (WA)','Columbia Valley','Cabernet Sauvignon','Woodward Canyon'),
    ('France','Cuvée Romanaise',88,22,'Rhône Valley','Côtes du Rhône Villages',NULL,'Grenache-Syrah','Domaine Fond Croze'),
    ('US','Barrel Select Reserve',87,19,'New York','North Fork of Long Island','Long Island','Merlot','Pindar Vineyards'),
    ('US',NULL,92,40,'California','Russian River Valley','Sonoma','Sauvignon Blanc','Rochioli'),
    ('Spain','Montesol Clásico',86,12,'Northern Spain','Rueda',NULL,'White Blend','Vinos Sanz'),
    ('US',NULL,82,35,'California','Paso Robles','Central Coast','Petite Sirah','Eagle Castle'),
    ('France','Rosé',84,10,'Languedoc-Roussillon','Vin de Pays d''Oc',NULL,'Syrah','Los 3 Bandidos'),
    ('Italy',NULL,87,16,'Sicily & Sardinia','Sicilia',NULL,'Nero d''Avola','Colosi'),
    ('France',NULL,85,9,'Bordeaux','Bordeaux Supérieur',NULL,'Bordeaux-style Red Blend','Château Haut-Sorillon'),
    ('Portugal','Andreza Branco',90,18,'Douro',NULL,NULL,'Portuguese White','Wines & Winemakers'),
    ('Australia','Clarendon',90,45,'South Australia','Clarendon',NULL,'Grenache','Clarendon Hills'),
    ('Italy','Terra di Vulcano',86,15,'Southern Italy','Aglianico del Vulture',NULL,'Aglianico','Bisceglia'),
    ('New Zealand','Cellar Selection',88,13,'Marlborough',NULL,NULL,'Sauvignon Blanc','Sileni'),
    ('US','Cellar Select',90,18,'Texas','Texas',NULL,'Chardonnay','Llano Estacado'),
    ('France',NULL,84,NULL,'Provence','Côtes de Provence',NULL,'Rosé','Barton & Guestier'),
    ('US','Kiara Private Reserve Sylvester Vineyards',83,20,'California','Paso Robles','Central Coast','Cabernet Sauvignon','Sylvester'),
    ('Chile','Corralillo',87,20,'San Antonio',NULL,NULL,'Gewürztraminer','Matetic'),
    ('France','Vieilles Vignes',89,261,'Burgundy','Gevrey-Chambertin',NULL,'Pinot Noir','Sérafin Père et Fils'),
    ('US',NULL,89,13,'Washington','Yakima Valley','Columbia Valley','Pinot Gris','Lone Birch'),
    ('US',NULL,81,14,'California','Lodi','Central Valley','Zinfandel','Bargetto'),
    ('France','Grande Cuvée',82,NULL,'Bordeaux','Bordeaux Rosé',NULL,'Rosé','Château Grand Rolland'),
    ('Italy','Riserva',86,45,'Tuscany','Chianti Rufina',NULL,'Red Blend','Dreolino'),
    ('US','Juliana Vineyards',90,22,'California','Napa Valley','Napa','Sauvignon Blanc','Merryvale'),
    ('US','Estate',92,36,'California','Arroyo Grande Valley','Central Coast','Pinot Noir','Talley'),
    ('Argentina','Bramare Marchiori Vineyard',91,80,'Mendoza Province','Perdriel',NULL,'Malbec','Viña Cobos'),
    ('Chile','Reserve',87,10,'Colchagua Valley',NULL,NULL,'Malbec','Montes'),
    ('US',NULL,87,65,'California','Napa Valley','Napa','Cabernet Sauvignon','Guarachi Family'),
    ('France',NULL,90,30,'Bordeaux','Haut-Médoc',NULL,'Bordeaux-style Red Blend','Château Coufran'),
    ('France',NULL,87,15,'Alsace','Alsace',NULL,'Pinot Blanc','Joseph Fritsch'),
    ('US','Wolff Vineyard',85,48,'California','Edna Valley','Central Coast','Pinot Noir','Double Bond'),
    ('Romania','La Umbra',86,9,'Dealurile Munteniei',NULL,NULL,'Cabernet Sauvignon','Cramele Halewood'),
    ('France','Tête de Cuvée',84,NULL,'Alsace','Alsace',NULL,'Pinot Gris','Ruhlmann'),
    ('Italy',NULL,87,16,'Tuscany','Toscana',NULL,'Rosato','Castello di Ama'),
    ('Italy','Extra Brut',87,NULL,'Lombardy','Franciacorta',NULL,'Sparkling Blend','Ricci Curbastro'),
    ('Italy','Madre',91,76,'Tuscany','Toscana',NULL,'Red Blend','Poggio Antico'),
    ('France','Vieilles Vignes',90,55,'Burgundy','Pouilly-Fuissé',NULL,'Chardonnay','Louis Max'),
    ('Chile','Gold Assemblage Carmenere',86,18,'Colchagua Valley',NULL,NULL,'Red Blend','Estampa'),
    ('France',NULL,87,30,'Burgundy','Mercurey',NULL,'Chardonnay','Château Philippe-le-Hardi'),
    ('US',NULL,88,30,'California','Los Carneros','Napa-Sonoma','Chardonnay','La Crema'),
    ('US','Reserve',86,30,'California','Napa Valley','Napa','Merlot','Artesa'),
    ('South Africa','Manor House',86,20,'Coastal Region',NULL,NULL,'Shiraz','Nederburg'),
    ('US','Cuvée Orleans',88,40,'Washington','Yakima Valley','Columbia Valley','Syrah','McCrea Cellars'),
    ('Italy',NULL,90,38,'Veneto','Amarone della Valpolicella Classico',NULL,'Corvina, Rondinella, Molinara','Vigneti Villabella'),
    ('US',NULL,86,16,'California','Napa Valley','Napa','Sauvignon Blanc','Mason Cellars'),
    ('US','Kingpin',92,56,'Washington','Red Mountain','Columbia Valley','Cabernet Sauvignon','Sparkman'),
    ('US','Gap''s Crown Vineyard',95,50,'California','Sonoma Coast','Sonoma','Pinot Noir','Furthermore'),
    ('US','Clockspring Vineyard',82,16,'California','Shenandoah Valley (CA)','Sierra Foothills','Zinfandel','Amador Foothill Winery'),
    ('US','Old Vine Meyercamp Ranch',86,10,'California','Napa Valley','Napa','Chenin Blanc','Pope Valley Winery'),
    ('US',NULL,89,22,'California','Lodi','Central Valley','Zinfandel','The Federalist'),
    ('Portugal','20 Years Old',90,35,'Port',NULL,NULL,'Port','Barros'),
    ('Australia',NULL,86,14,'South Australia','Barossa',NULL,'Shiraz','Nine Stones'),
    ('Australia','Hanenhof',87,22,'South Australia','Barossa Valley',NULL,'Merlot-Cabernet Franc','Haan'),
    ('France','Dessert Wine',87,16,'Rhône Valley','Muscat de Beaumes de Venise',NULL,'Muscat','Domaine de la Pigeade'),
    ('US','St. Eden',94,275,'California','Napa Valley','Napa','Bordeaux-style Red Blend','BOND'),
    ('US','Dutton Ranch',88,40,'California','Russian River Valley','Sonoma','Pinot Noir','Dutton-Goldfield'),
    ('US','Quarter Moon Vineyard',94,100,'California','Sonoma Coast','Sonoma','Pinot Noir','Freestone'),
    ('France','Les Vaucrains Premier Cru',92,108,'Burgundy','Nuits-St.-Georges',NULL,'Pinot Noir','Bertrand Ambroise'),
    ('Italy','Alleanza',91,35,'Tuscany','Toscana',NULL,'Red Blend','Castello di Gabbiano'),
    ('US','Reserve Claret',93,125,'California','Sonoma-Napa','Napa-Sonoma','Bordeaux-style Red Blend','Pride Mountain'),
    ('France',NULL,86,NULL,'Bordeaux','Margaux',NULL,'Bordeaux-style Red Blend','Chateau Dauzac'),
    ('France','Les Pavés',87,35,'Rhône Valley','Châteauneuf-du-Pape',NULL,'Rhône-style Red Blend','Oriel'),
    ('France','Les Amoureux',84,8,'Languedoc-Roussillon','Vin de Pays d''Oc',NULL,'Sauvignon Blanc','Tortoise Creek'),
    ('France','Cuvée Prestige',90,27,'Bordeaux','Premieres Côtes de Bordeaux',NULL,'Bordeaux-style Red Blend','Château Suau'),
    ('France','B de Biac',84,42,'Bordeaux','Cadillac Côtes de Bordeaux',NULL,'Bordeaux-style Red Blend','Château du Biac'),
    ('France','Rosé de Saignée Brut',87,59,'Champagne','Champagne',NULL,'Pinot Noir','Tendil & Lombardi'),
    ('US','Classic Vintage Brut',87,33,'California','Green Valley','Sonoma','Sparkling Blend','Iron Horse'),
    ('US','Couture',92,70,'California','Santa Barbara County','Central Coast','Red Blend','Sanguis'),
    ('New Zealand',NULL,86,15,'Martinborough',NULL,NULL,'Sauvignon Blanc','Te Kairanga'),
    ('Chile','Condesa Real Premium Blend',89,24,'Aconcagua Valley',NULL,NULL,'Red Blend','Conde de Velázquez'),
    ('US',NULL,83,23,'Washington','Walla Walla Valley (WA)','Columbia Valley','Syrah','Edmonds Winery'),
    ('US','Reserve',88,84,'California','Paso Robles','Central Coast','Cabernet Sauvignon','Chateau Margene'),
    ('New Zealand',NULL,87,25,'Waipara',NULL,NULL,'Pinot Noir','Muddy Water'),
    ('US','Philosophy',84,36,'Virginia','Virginia',NULL,'Red Blend','Greenhill'),
    ('Italy','Brut',87,NULL,'Lombardy','Franciacorta',NULL,'Sparkling Blend','Tenuta Montedelma di Berardi'),
    ('US',NULL,82,11,'California','California','California Other','Cabernet Sauvignon','Bogle'),
    ('US',NULL,91,24,'California','Sonoma Coast','Sonoma','Pinot Noir','Bench'),
    ('US','Late Harvest',84,11,'Washington','Columbia Valley (WA)','Columbia Valley','Riesling','Hogue'),
    ('US',NULL,87,20,'New York','Finger Lakes','Finger Lakes','Cabernet Franc','Red Newt Cellars'),
    ('France','Clos des Hâtes',88,25,'Burgundy','Santenay',NULL,'Pinot Noir','Domaine Bachey-Legros'),
    ('US','Crimson Jewel',84,42,'California','Paso Robles','Central Coast','Red Blend','LXV'),
    ('US','Verdigris',85,30,'California','California','California Other','White Blend','Las Positas'),
    ('US',NULL,91,37,'California','Napa Valley','Napa','Zinfandel','Frank Family'),
    ('US','Late Harvest',89,35,'California','Anderson Valley','Mendocino/Lake Counties','Gewürztraminer','Castello di Amorosa'),
    ('US','Dry',90,17,'New York','Finger Lakes','Finger Lakes','Riesling','Ravines'),
    ('New Zealand','Reserve',86,17,'Marlborough',NULL,NULL,'Merlot','Brancott'),
    ('US',NULL,87,8,'Washington','Columbia Valley (WA)','Columbia Valley','Sauvignon Blanc','Covey Run'),
    ('Italy','Serralunga',92,48,'Piedmont','Barolo',NULL,'Nebbiolo','Palladino'),
    ('US','Oakville Grade',93,75,'California','Napa Valley','Napa','Bordeaux-style Red Blend','Merryvale'),
    ('France',NULL,94,NULL,'Bordeaux','Pessac-Léognan',NULL,'Bordeaux-style Red Blend','Château Malartic-Lagravière'),
    ('US',NULL,85,17,'California','Monterey County','Central Coast','Cabernet Franc','Brushstroke'),
    ('US','Dry',90,18,'California','Edna Valley','Central Coast','Riesling','Claiborne & Churchill'),
    ('Australia','First Eleven',92,60,'South Australia','Coonawarra',NULL,'Cabernet Sauvignon','Jim Barry'),
    ('US','Dijon Clone',84,25,'California','Arroyo Seco','Central Coast','Chardonnay','Scott Family'),
    ('Greece','Red',85,9,'Nemea',NULL,NULL,'Agiorgitiko','Kouros'),
    ('Italy','Selezone Antonio Castagnedi',93,45,'Veneto','Amarone della Valpolicella',NULL,'Corvina, Rondinella, Molinara','Tenuta Sant''Antonio'),
    ('Chile','Quinel Single Vineyard Estate Bottled',87,18,'Bío Bío Valley',NULL,NULL,'Pinot Noir','Veranda'),
    ('US','Estate Bottled',87,25,'New York','North Fork of Long Island','Long Island','Merlot','Raphael'),
    ('France','Sables d''Azur',83,10,'Provence','Côtes de Provence',NULL,'Rosé','Baron Gassier'),
    ('US','Rod''s Pride',84,30,'California','Russian River Valley','Sonoma','Pinot Noir','Toad Hollow'),
    ('US','Red Roan Red Wine',83,15,'Washington','Columbia Valley (WA)','Columbia Valley','Red Blend','Tagaris'),
    ('France',NULL,87,NULL,'Burgundy','Coteaux Bourguignons',NULL,'Gamay','Domaine Dominique Piron'),
    ('US','McKinley Springs',88,42,'Washington','Horse Heaven Hills','Columbia Valley','Mourvèdre','Robert Ramsay'),
    ('France','Mirabelle de la Jaubertie',90,19,'Southwest France','Bergerac Sec',NULL,'Bordeaux-style White Blend','Château de la Jaubertie'),
    ('Italy','Giada',90,45,'Piedmont','Barbera d''Alba',NULL,'Barbera','Andrea Oberto'),
    ('US',NULL,87,35,'California','Alexander Valley','Sonoma','Merlot','Godwin'),
    ('US','1',91,50,'Washington','Columbia Valley (WA)','Columbia Valley','Grenache','Brian Carter Cellars'),
    ('US',NULL,83,21,'California','Sonoma County','Sonoma','Chardonnay','Meadowcroft'),
    ('Italy',NULL,87,16,'Piedmont','Roero',NULL,'Arneis','Giacosa Fratelli'),
    ('Italy','Maràia',86,11,'Piedmont','Barbera del Monferrato',NULL,'Barbera','Marchesi di Barolo'),
    ('Portugal','Reserva Branco',89,14,'Douro',NULL,NULL,'Portuguese White','Castello d''Alba'),
    ('New Zealand',NULL,88,15,'Marlborough',NULL,NULL,'Riesling','eco.love'),
    ('Australia','The Loose Cannon',88,16,'South Australia','McLaren Vale',NULL,'Viognier','Hugh Hamilton'),
    ('US','Cotes du Rogue',86,21,'Oregon','Oregon','Oregon Other','Rhône-style Red Blend','Merrill Cellars'),
    ('Italy','Serraboella',90,NULL,'Piedmont','Barbaresco',NULL,'Nebbiolo','Barale Fratelli'),
    ('US',NULL,91,31,'California','Napa Valley','Napa','Petite Sirah','Stags'' Leap Winery'),
    ('Argentina','Reserve',83,19,'Mendoza Province','Uco Valley',NULL,'Pinot Noir','Salentein'),
    ('Argentina','Las Compuertas',90,30,'Mendoza Province','Luján de Cuyo',NULL,'Malbec','Viña Alicia'),
    ('France',NULL,82,19,'Bordeaux','Côtes de Castillon',NULL,'Bordeaux-style Red Blend','Château des Demoiselles'),
    ('Italy','Ser Lapo Riserva',87,40,'Tuscany','Chianti Classico',NULL,'Red Blend','Mazzei'),
    ('New Zealand','La Strada',84,31,'Marlborough',NULL,NULL,'Riesling','Fromm Winery'),
    ('US','Seymour''s',95,NULL,'California','Edna Valley','Central Coast','Syrah','Alban'),
    ('Lithuania','Gold',84,10,'Lithuania',NULL,NULL,'Sparkling Blend','Alita'),
    ('New Zealand','Envoy Johnson Vineyard',93,33,'Marlborough',NULL,NULL,'Sauvignon Blanc','Spy Valley'),
    ('US','Pommard Clone Dierberg Vineyard',88,70,'California','Santa Maria Valley','Central Coast','Pinot Noir','Tantara'),
    ('US',NULL,82,9,'California','California','California Other','Merlot','Campus Oaks'),
    ('Italy','Terre di Sicilia',83,7,'Sicily & Sardinia','Sicilia',NULL,'Inzolia','Cambria'),
    ('US','Bootjack Ranch',87,24,'California','Paso Robles','Central Coast','Petite Sirah','Niner'),
    ('Spain','Crianza',87,15,'Northern Spain','Ribera del Duero',NULL,'Tempranillo','Condado de Oriza'),
    ('Italy','Tenuta Belguardo',94,60,'Tuscany','Maremma',NULL,'Red Blend','Mazzei'),
    ('US','Sands Point',88,15,'California','Sonoma County','Sonoma','Merlot','Avelina'),
    ('US',NULL,84,8,'California','California','California Other','Cabernet Sauvignon','CheapSkate'),
    ('US','La Joie',90,100,'California','Sonoma County','Sonoma','Red Blend','Verité'),
    ('Italy',NULL,91,NULL,'Piedmont','Barbaresco',NULL,'Nebbiolo','Alessandro Rivetto'),
    ('Argentina','Carrascal',86,13,'Mendoza Province','Mendoza',NULL,'Bordeaux-style Red Blend','Weinert'),
    ('Italy',NULL,83,NULL,'Veneto','Bardolino',NULL,'Corvina, Rondinella, Molinara','Ca'' dei Rotti'),
    ('Spain','Old Vines Reserva',88,17,'Central Spain','Valdepeñas',NULL,'Tempranillo','Bodegas Navarro López'),
    ('France',NULL,87,20,'Loire Valley','Bourgueil',NULL,'Cabernet Franc','Château de Minière'),
    ('France','L''Hospitalitas - La Clape',93,75,'Languedoc-Roussillon','Coteaux du Languedoc',NULL,'Rhône-style Red Blend','Gérard Bertrand'),
    ('Spain','La Kika Manzanilla',90,30,'Andalucia','Manzanilla-Sanlúcar de Barrameda',NULL,'Sherry','Bodegas Yuste'),
    ('US','Hollystone-Collins Old Vines',87,32,'California','Napa Valley','Napa','Zinfandel','Benessere'),
    ('France','Crustacés',85,12,'Alsace','Alsace',NULL,'White Blend','Dopff & Irion'),
    ('US','Social Club White',83,13,'New York','Long Island','Long Island','Chardonnay','Brooklyn Oenology'),
    ('US',NULL,87,37,'California','Napa Valley','Napa','Zinfandel','Frank Family'),
    ('US',NULL,87,30,'California','Russian River Valley','Sonoma','Pinot Noir','Windsor Sonoma'),
    ('Italy','Cascina Pioiero',87,23,'Piedmont','Roero Arneis',NULL,'Arneis','Pioiero'),
    ('US','Estate Grown',87,25,'California','Dry Creek Valley','Sonoma','Zinfandel','Fritz'),
    ('Argentina','Organic',83,12,'Mendoza Province','Mendoza',NULL,'Chardonnay','VinEcol'),
    ('US',NULL,92,36,'California','Rutherford','Napa','Petite Sirah','Elyse'),
    ('Australia','Leylines',89,NULL,'South Australia','McLaren Vale',NULL,'Shiraz','Songlines'),
    ('US','La Serenne',94,55,'Washington','Yakima Valley','Columbia Valley','Syrah','Betz Family'),
    ('Spain','Vendimia Seleccionada',93,48,'Northern Spain','Rioja',NULL,'Tempranillo','Amador Garcia'),
    ('South Africa',NULL,87,20,'South Africa',NULL,NULL,'Cabernet Sauvignon','The Berrio'),
    ('Italy','La Guardia',90,34,'Veneto','Recioto della Valpolicella Classico',NULL,'Red Blend','Recchia'),
    ('South Korea','Wild Grape Dry',82,16,'Jiri Valley',NULL,NULL,'Meoru','Keum Hwa Winery'),
    ('Argentina','Reserve',84,23,'Mendoza Province','Tupungato',NULL,'Merlot','Andeluna'),
    ('Portugal','Malhadinha Tinto',94,90,'Alentejano',NULL,NULL,'Portuguese Red','Herdade da Malhadinha Nova'),
    ('Chile','Barrel Selection Reserve',88,10,'Central Valley',NULL,NULL,'Cabernet Sauvignon','Valdivieso'),
    ('Italy','Terranuda',86,NULL,'Piedmont','Barbera d''Asti',NULL,'Barbera','Marcaurelio'),
    ('US',NULL,84,14,'California','Napa Valley','Napa','Sauvignon Blanc','Courtney Benham'),
    ('US','Reserve',87,37,'Oregon','Willamette Valley','Willamette Valley','Pinot Noir','Argyle'),
    ('New Zealand',NULL,86,10,'Marlborough',NULL,NULL,'Sauvignon Blanc','Twin Islands'),
    ('US',NULL,86,23,'Washington','Columbia Valley (WA)','Columbia Valley','Cabernet Sauvignon','Lost River'),
    ('US','Subduction Red',90,18,'Washington','Columbia Valley (WA)','Columbia Valley','Red Blend','Syncline'),
    ('Australia','Prelude Vineyards',91,36,'Western Australia','Margaret River',NULL,'Chardonnay','Leeuwin Estate'),
    ('France',NULL,94,109,'Burgundy','Corton-Charlemagne',NULL,'Chardonnay','Roux Père et Fils'),
    ('US','Riatta',84,18,'California','Paso Robles','Central Coast','Sangiovese','JanKris'),
    ('Italy','Terre di Dora',91,20,'Southern Italy','Fiano di Avellino',NULL,'White Blend','Terredora'),
    ('France','Vau de Vey Premier Cru',90,40,'Burgundy','Chablis',NULL,'Chardonnay','Château de Maligny'),
    ('Chile','Reserva',88,20,'Maipo Valley',NULL,NULL,'Carmenère-Cabernet Sauvignon','Carmen'),
    ('US','Clift Vineyard',87,40,'California','Oak Knoll District','Napa','Cabernet Sauvignon','Tudal'),
    ('Portugal','Terra Grande Colheita',85,11,'Alentejano',NULL,NULL,'Portuguese Red','Parras Vinhos'),
    ('US','Proprietor''s Reserve',85,27,'New York','North Fork of Long Island','Long Island','Cabernet Franc','Palmer'),
    ('US',NULL,87,16,'California','Dry Creek Valley','Sonoma','Sauvignon Blanc','Handley'),
    ('US','Thunderbolt',84,16,'Washington','Yakima Valley','Columbia Valley','Sauvignon Blanc-Semillon','Airfield Estates'),
    ('Italy','Le Sèrole',88,50,'Southern Italy','Terre del Volturno',NULL,'Pallagrello','Terre del Principe'),
    ('Spain','Torre La Moreira',90,19,'Galicia','Rías Baixas',NULL,'Albariño','Marqués de Vizhoja'),
    ('Italy','D''Echo',85,16,'Tuscany','Toscana',NULL,'Red Blend','Leopoldo I di Toscana'),
    ('US','Syrah',82,18,'California','Contra Costa County','Central Coast','Rosé','Longevity'),
    ('US',NULL,90,15,'Oregon','Oregon','Oregon Other','Riesling','A to Z'),
    ('US','Estate Vineyard',84,22,'California','Monterey County','Central Coast','Merlot','Château Julien'),
    ('Italy','Pascena',91,50,'Tuscany','Moscadello di Montalcino',NULL,'Moscadello','Col d''Orcia'),
    ('Germany','Thomas Schmitt Private Collection Estate Bottled',85,13,'Mosel-Saar-Ruwer',NULL,NULL,'Riesling','Schmitt Söhne'),
    ('Italy','Le Stoppie',85,9,'Tuscany','Chianti Colli Pisani',NULL,'Sangiovese','Sangervasio'),
    ('Australia','Reserve',90,24,'Victoria','Yarra Valley',NULL,'Shiraz','Green Point'),
    ('US','Hellenthal Vineyard',96,40,'California','Sonoma Coast','Sonoma','Pinot Noir','Bjornstad'),
    ('Portugal','Pink Elephant',84,8,'Lisboa',NULL,NULL,'Rosé','DFJ Vinhos'),
    ('US',NULL,87,95,'California','Napa Valley','Napa','Cabernet Sauvignon','Bello Family Vineyards'),
    ('Italy','Maggiorina',82,20,'Piedmont','Moscato d''Asti',NULL,'Moscato','Rivetti Massimo'),
    ('US',NULL,88,10,'Washington','Washington','Washington Other','Cabernet Sauvignon','Washington Hills'),
    ('US','Abetina Vineyard',93,100,'Oregon','Willamette Valley','Willamette Valley','Pinot Noir','Ponzi'),
    ('US','Estate Reserve',87,38,'Oregon','Willamette Valley','Willamette Valley','Pinot Noir','David Hill'),
    ('US',NULL,84,15,'California','Lake County','Mendocino/Lake Counties','Sauvignon Blanc','Shannon Ridge'),
    ('France','Clos Windsbuhl',94,80,'Alsace','Alsace',NULL,'Riesling','Domaine Zind-Humbrecht'),
    ('France',NULL,87,15,'Rhône Valley','Côtes du Rhône',NULL,'Rhône-style Red Blend','Domaine de Beaurenard'),
    ('Italy','Radius',87,NULL,'Tuscany','Bolgheri',NULL,'Vermentino','Serni Fulvio Luigi'),
    ('Italy','Rubizzo',87,12,'Tuscany','Toscana',NULL,'Sangiovese','Rocca delle Macìe'),
    ('France','Les Puillets',90,32,'Burgundy','Mercurey',NULL,'Pinot Noir','Château Philippe-le-Hardi'),
    ('US',NULL,80,10,'California','Lodi','Central Valley','Sauvignon Blanc','Ironstone'),
    ('France','Cuvée Femme Brut',95,120,'Champagne','Champagne',NULL,'Champagne Blend','Duval-Leroy'),
    ('US','Brut',91,35,'California','Carneros','Napa-Sonoma','Champagne Blend','Acacia'),
    ('France','Diablère',85,NULL,'Southwest France','Côtes de Duras',NULL,'Bordeaux-style Red Blend','Domaine les Riquets');
INSERT INTO wine VALUES
    ('Spain','Barón d''Anglade',87,50,'Northern Spain','Rioja',NULL,'Tempranillo Blend','Bodegas Franco-Españolas'),
    ('US','Klopp Ranch Méthode a L''Ancienne',96,57,'California','Russian River Valley','Sonoma','Pinot Noir','Merry Edwards'),
    ('France',NULL,89,40,'Bordeaux','Montagne-Saint-Émilion',NULL,'Bordeaux-style Red Blend','Château Vieux Montagne'),
    ('US',NULL,84,18,'California','Paso Robles','Central Coast','Tempranillo','A Cellar Full of Noise'),
    ('France','Mairlant',90,40,'Rhône Valley','Saint-Joseph',NULL,'Rhône-style White Blend','Domaine François Villard'),
    ('Spain',NULL,83,20,'Galicia','Rías Baixas',NULL,'Albariño','Orballo'),
    ('France','La Dame Wiebelsberg Grand Cru',89,44,'Alsace','Alsace',NULL,'Riesling','Marc Kreydenweiss'),
    ('US','Rosé',87,22,'California','California','California Other','Sparkling Blend','Chandon'),
    ('Chile','Reserva',83,12,'Loncomilla Valley',NULL,NULL,'Merlot','Cremaschi Furlotti'),
    ('Uruguay',NULL,80,9,'Canelones',NULL,NULL,'Cabernet Sauvignon','Toscanini'),
    ('Australia',NULL,88,16,'South Australia','Limestone Coast',NULL,'Cabernet Sauvignon-Shiraz','TLC'),
    ('US','Estate',89,29,'California','Paso Robles','Central Coast','Petite Sirah','Vina Robles'),
    ('US',NULL,84,25,'California','Paso Robles','Central Coast','Merlot','San Simeon'),
    ('Argentina','Oak Cask',85,12,'Mendoza Province','Mendoza',NULL,'Malbec','Trapiche'),
    ('US',NULL,87,26,'California','Russian River Valley','Sonoma','Pinot Noir','Sebastiani'),
    ('Italy','Heba',86,16,'Tuscany','Morellino di Scansano',NULL,'Red Blend','Fattoria di Magliano'),
    ('France','Barrel sample',95,NULL,'Bordeaux','Sauternes',NULL,'Bordeaux-style White Blend','Château Sigalas Rabaud'),
    ('Chile','Reserva',87,15,'Limarí Valley',NULL,NULL,'Syrah','Viña Tabalí'),
    ('US',NULL,93,30,'California','San Luis Obispo County','Central Coast','Syrah','Herman Story'),
    ('US','Reserve',90,115,'California','Napa Valley','Napa','Cabernet Franc','Peju'),
    ('US','Gracie Creek Vineyards',85,38,'California','Sonoma Valley','Sonoma','Syrah','Muscardini'),
    ('Chile','Reserva',82,9,'Maipo Valley',NULL,NULL,'Chardonnay','Santa Alicia'),
    ('US','Geza''s Selection',88,45,'California','Sonoma Valley','Sonoma','Pinot Noir','Buena Vista'),
    ('Argentina',NULL,90,15,'Mendoza Province','Mendoza',NULL,'Malbec','Tapiz'),
    ('France','Château Romassan',91,43,'Provence','Bandol',NULL,'Rosé','Domaines Ott'),
    ('South Africa','Reserve',80,15,'Robertson',NULL,NULL,'Chardonnay','Van Loveren'),
    ('US',NULL,87,12,'California','Monterey County','Central Coast','Gewürztraminer','Banyan'),
    ('US','Seascape Vineyard',94,65,'California','Sonoma Coast','Sonoma','Chardonnay','Hartford Court'),
    ('Italy','Postera',87,40,'Veneto','Amarone della Valpolicella Classico',NULL,'Red Blend','Manara'),
    ('Greece',NULL,86,12,'Aigialias Slopes',NULL,NULL,'Cabernet Sauvignon','Oenoforos'),
    ('Italy','Gerbino Rosato di Nerello Mascalese',87,15,'Sicily & Sardinia','Terre Siciliane',NULL,'Nerello Mascalese','Di Giovanna'),
    ('US','Clos Pepe Vineyard',92,75,'California','Sta. Rita Hills','Central Coast','Pinot Noir','Arcadian'),
    ('Portugal','Quinta de Simaens',87,12,'Vinho Verde',NULL,NULL,'Portuguese White','Borges'),
    ('US','Rosella''s Vineyard',89,52,'California','Santa Lucia Highlands','Central Coast','Pinot Noir','Roar'),
    ('France',NULL,88,30,'Bordeaux','Saint-Émilion',NULL,'Bordeaux-style Red Blend','Château de Ferrand'),
    ('Italy','Moma',88,NULL,'Central Italy','Rubicone',NULL,'Red Blend','Umberto Cesari'),
    ('US','Talley-Rincon Vineyard',93,40,'California','Arroyo Grande Valley','Central Coast','Pinot Noir','Sinor-LaVallee'),
    ('US','Estate Bottled',92,45,'California','Rutherford','Napa','Cabernet Franc','William Harrison'),
    ('US','The Novelist Meritage',85,18,'California','California','California Other','Bordeaux-style White Blend','Cosentino'),
    ('US','Bien Nacido Vineyard',89,40,'California','Santa Maria Valley','Central Coast','Chardonnay','La Fenêtre'),
    ('Argentina',NULL,88,13,'Mendoza Province','Mendoza',NULL,'Torrontés','Inacayal'),
    ('US',NULL,85,32,'California','Dry Creek Valley','Sonoma','Petite Sirah','Mounts'),
    ('US','Ramal Vineyard Clone 17RY',92,32,'California','Carneros','Napa-Sonoma','Chardonnay','Buena Vista'),
    ('Italy',NULL,85,9,'Northeastern Italy','Vigneti delle Dolomiti',NULL,'Pinot Noir','Mezzacorona'),
    ('Australia','The Pugilist',88,16,'South Australia','Langhorne Creek',NULL,'Cabernet Sauvignon','One Chain'),
    ('Italy','Stemmari',87,9,'Sicily & Sardinia','Sicilia',NULL,'Pinot Nero','Feudo Arancio'),
    ('US',NULL,88,25,'Oregon','Willamette Valley','Willamette Valley','Gamay Noir','WillaKenzie Estate'),
    ('US',NULL,85,38,'California','Napa Valley','Napa','Cabernet Sauvignon','Due Vigne'),
    ('Italy',NULL,85,9,'Tuscany','Chianti',NULL,'Sangiovese','Straccali'),
    ('US','Ultra Brut',93,50,'California','Green Valley','Sonoma','Sparkling Blend','Iron Horse'),
    ('Spain',NULL,85,8,'Northern Spain','Campo de Borja',NULL,'Rosé','Borsao'),
    ('Argentina','Reserve',86,15,'Mendoza Province','Mendoza',NULL,'Chardonnay','Cruz Alta'),
    ('France','Domaine Piron-Lameloise',91,21,'Beaujolais','Chénas',NULL,'Gamay','Domaine Dominique Piron'),
    ('US',NULL,87,39,'California','Sonoma County','Sonoma','Petite Sirah','Imagery'),
    ('Argentina','Oak Cask',88,10,'Mendoza Province','Mendoza',NULL,'Cabernet Sauvignon','Trapiche'),
    ('US',NULL,86,26,'California','Sonoma County','Sonoma','Syrah-Grenache','Qualia'),
    ('Spain','Cream',89,15,'Andalucia','Jerez',NULL,'Sherry','Bodegas Dios Baco S.L.'),
    ('Italy','Cum Laude',91,31,'Tuscany','Toscana',NULL,'Red Blend','Castello Banfi'),
    ('US',NULL,85,15,'Oregon','Umpqua Valley','Southern Oregon','Chardonnay','Girardet'),
    ('US','Logan Sleepy Hollow Vineyard',87,28,'California','Santa Lucia Highlands','Central Coast','Chardonnay','Talbott'),
    ('Austria','Alte Reben',93,35,'Burgenland',NULL,NULL,'Austrian Red Blend','Weninger'),
    ('France',NULL,89,NULL,'Burgundy','Volnay',NULL,'Pinot Noir','Domaine Poulleau Père et Fils'),
    ('Italy',NULL,89,22,'Tuscany','Rosso di Montalcino',NULL,'Sangiovese Grosso','Tenuta Vitanza'),
    ('Italy','Keramos Riserva',90,42,'Sicily & Sardinia','Cannonau di Sardegna',NULL,'Cannonau','Tenute Soletta'),
    ('Australia','Special Select',92,65,'South Australia','Coonawarra',NULL,'Shiraz','Penley Estate'),
    ('Italy',NULL,87,20,'Veneto','Valpolicella Superiore Ripasso',NULL,'Corvina, Rondinella, Molinara','Grotta del Ninfeo'),
    ('Australia',NULL,89,18,'Victoria','Goulburn Valley',NULL,'Shiraz','Tahbilk'),
    ('US',NULL,92,58,'California','Napa Valley','Napa','Cabernet Sauvignon','Joseph Phelps'),
    ('US',NULL,90,24,'California','Lake County','Mendocino/Lake Counties','Petite Sirah','Two Angels'),
    ('Italy','Regina di Renieri',91,40,'Tuscany','Toscana',NULL,'Syrah','Renieri'),
    ('France',NULL,88,216,'Burgundy','Bâtard-Montrachet',NULL,'Chardonnay','Joseph Drouhin'),
    ('Italy','Cerviolo Bianco',87,25,'Tuscany','Toscana',NULL,'Chardonnay','San Fabiano Calcinaia'),
    ('Chile','Character',86,22,'Maipo Valley',NULL,NULL,'Cabernet Sauvignon-Carmenère','Haras'),
    ('US','Chaleur Estate',91,45,'Washington','Yakima Valley','Columbia Valley','Red Blend','DeLille'),
    ('New Zealand','Judd Estate',87,17,'Gisborne',NULL,NULL,'Chardonnay','Matua Valley'),
    ('France',NULL,93,110,'Bordeaux','Saint-Émilion',NULL,'Bordeaux-style Red Blend','Vieux Château Mazerat'),
    ('US','Washington State Cuvée',89,28,'Washington','Columbia Valley (WA)','Columbia Valley','Red Blend','Walla Walla Vintners'),
    ('US','Peasant',86,40,'California','Paso Robles','Central Coast','Rhône-style Red Blend','Four Vines'),
    ('France','Réserve',88,13,'Alsace','Alsace',NULL,'Riesling','Willm'),
    ('Italy',NULL,85,NULL,'Tuscany','Chianti Colli Aretini',NULL,'Sangiovese','Villa Cilnia'),
    ('France','Luna',87,16,'Rhône Valley','Côtes du Rhône Villages',NULL,'Rhône-style White Blend','Laudun Chusclan'),
    ('US','Nielson Vineyard',92,45,'California','Santa Maria Valley','Central Coast','Pinot Noir','Byron'),
    ('New Zealand','Pathway Single Estate',85,15,'Marlborough',NULL,NULL,'Pinot Noir','Ara'),
    ('Italy','Bussia Corsini',87,48,'Piedmont','Barolo',NULL,'Nebbiolo','Podere Ruggeri Corsini'),
    ('US','Spofford Station',86,25,'Oregon','Walla Walla Valley (OR)','Oregon Other','Cabernet Sauvignon','Lujon'),
    ('Italy',NULL,92,40,'Piedmont','Barolo',NULL,'Nebbiolo','Beni di Batasiolo'),
    ('US','Areté',85,60,'Oregon','Oregon','Oregon Other','Pinot Noir','Iris Vineyards'),
    ('US',NULL,87,20,'Washington','Washington','Washington Other','Cabernet-Syrah','Latah Creek'),
    ('Turkey',NULL,87,15,'Turkey',NULL,NULL,'Emir','Turasan'),
    ('US','Reserve',90,40,'California','Santa Barbara County','Central Coast','Pinot Noir','Addamo'),
    ('Italy','Le Pitre',86,29,'Southern Italy','Salento',NULL,'White Blend','Villa Mottura'),
    ('France',NULL,90,50,'Rhône Valley','Hermitage',NULL,'Rhône-style White Blend','E. Guigal'),
    ('France','Tsarine Rosé Brut',90,40,'Champagne','Champagne',NULL,'Champagne Blend','Chanoine'),
    ('Italy','Bellovedere',90,NULL,'Central Italy','Montepulciano d''Abruzzo',NULL,'Montepulciano','La Valentina'),
    ('Australia','Leston',90,25,'Western Australia','Margaret River',NULL,'Shiraz','Howard Park'),
    ('US','Dario Estate',88,25,'Oregon','Chehalem Mountains','Willamette Valley','Pinot Noir','Potter''s Vineyard'),
    ('US','Sleepy Hollow Vineyard',88,35,'California','Monterey','Central Coast','Chardonnay','Talbott'),
    ('Italy',NULL,87,52,'Tuscany','Brunello di Montalcino',NULL,'Sangiovese Grosso','Podere Paganico'),
    ('US','Unoaked',87,14,'New York','Finger Lakes','Finger Lakes','Chardonnay','Heron Hill'),
    ('US','Silacci Vineyard',87,28,'California','Monterey','Central Coast','Pinot Noir','De Tierra'),
    ('US','Wallula Vineyard Biodynamic',91,20,'Washington','Columbia Valley (WA)','Columbia Valley','Riesling','Pacific Rim'),
    ('Italy','Le More',86,14,'Central Italy','Sangiovese di Romagna',NULL,'Sangiovese','Castelluccio'),
    ('New Zealand','Te Muna Road Vineyard',90,39,'Martinborough',NULL,NULL,'Pinot Noir','Craggy Range'),
    ('Italy',NULL,90,24,'Northeastern Italy','Collio',NULL,'White Blend','Zuani'),
    ('US','Boushey Vineyards',87,50,'Washington','Yakima Valley','Columbia Valley','Syrah','Three Rivers'),
    ('France','Barrel sample',93,NULL,'Bordeaux','Saint-Émilion',NULL,'Bordeaux-style Red Blend','Château Faugères'),
    ('US','Bonatello Riserva',90,35,'Washington','Columbia Valley (WA)','Columbia Valley','Sangiovese','Tre Nova'),
    ('US','Sea Flower Dry',85,15,'California','Central Coast','Central Coast','Rosé','Deep Sea'),
    ('Portugal','Rubrica Branco',93,25,'Alentejano',NULL,NULL,'Portuguese White','Luis Duarte'),
    ('US','Horse Heaven Vineyard',90,15,'Washington','Horse Heaven Hills','Columbia Valley','Sauvignon Blanc','Chateau Ste. Michelle'),
    ('Italy','Acinatium',93,55,'Veneto','Recioto di Soave',NULL,'Garganega','Suavia'),
    ('Argentina',NULL,87,9,'Mendoza Province','Mendoza',NULL,'Merlot','Tango Sur'),
    ('Italy','Vintage Collection Dosage Zero Noir Riserva',94,NULL,'Lombardy','Franciacorta',NULL,'Pinot Nero','Ca'' del Bosco'),
    ('Italy','Vigneto Fiorato',89,30,'Veneto','Recioto della Valpolicella Classico',NULL,'Corvina, Rondinella, Molinara','Tommasi'),
    ('Austria','Gedersdorf Moosburgerin',88,16,'Kremstal',NULL,NULL,'Grüner Veltliner','Felsner'),
    ('Argentina',NULL,87,10,'Mendoza Province','Mendoza',NULL,'Torrontés','El Fogón'),
    ('Italy','Fidenzio',88,NULL,'Tuscany','Toscana',NULL,'Red Blend','Podere San Luigi'),
    ('Chile',NULL,87,18,'Casablanca Valley',NULL,NULL,'Pinot Noir','Ritual'),
    ('France','Cuvée les Epinats',85,12,'Loire Valley','Saumur',NULL,'Chenin Blanc','Alliance Loire'),
    ('US','Block 007 Estate Vineyard',87,25,'California','Dry Creek Valley','Sonoma','Cabernet Sauvignon','Pedroncelli'),
    ('US','Diamond Dust Vineyard',90,22,'California','Alexander Valley','Sonoma','Cabernet Sauvignon','Trig Point'),
    ('US',NULL,90,12,'Oregon','Willamette Valley','Willamette Valley','Riesling','Willamette Valley Vineyards'),
    ('Germany','Bürklin Estate',87,15,'Pfalz',NULL,NULL,'Riesling','Dr. Bürklin-Wolf'),
    ('Austria','Steinriegl Smaragd',94,44,'Wachau',NULL,NULL,'Riesling','Schmelz'),
    ('US',NULL,88,20,'California','Paso Robles','Central Coast','Zinfandel','Grey Wolf Cellars'),
    ('Portugal','Casa de Santar',88,15,'Dão',NULL,NULL,'Portuguese White','Dão Sul'),
    ('France',NULL,89,63,'Burgundy','Nuits-St.-Georges',NULL,'Pinot Noir','Domaine Faiveley'),
    ('Spain',NULL,86,12,'Northern Spain','Rioja',NULL,'Tempranillo','Solar de Randez'),
    ('US',NULL,88,11,'Washington','Columbia Valley (WA)','Columbia Valley','Sauvignon Blanc','Hogue'),
    ('South Africa','The Rose Garden',87,13,'Coastal Region',NULL,NULL,'Rosé','Boschendal'),
    ('US','Old Vine',89,22,'California','Dry Creek Valley','Sonoma','Zinfandel','Pezzi King'),
    ('Chile','La Joya Gran Reserva',85,15,'Colchagua Valley',NULL,NULL,'Gewürztraminer','Viña Bisquertt'),
    ('Chile','Visión',88,15,'Casablanca Valley',NULL,NULL,'Sauvignon Blanc','Cono Sur'),
    ('Spain','Finca Resalso',87,15,'Northern Spain','Ribera del Duero',NULL,'Tinto Fino','Emilio Moro'),
    ('Spain','Rosado',81,10,'Northern Spain','Ribera del Duero',NULL,'Tempranillo','Viña Vilano'),
    ('US','Reserve',91,75,'California','Diamond Mountain District','Napa','Cabernet Sauvignon','Martin Ray'),
    ('Spain','Luzon Verde',84,9,'Levante','Jumilla',NULL,'Monastrell','Bodegas Luzón'),
    ('Italy',NULL,85,10,'Tuscany','Chianti',NULL,'Sangiovese','Piccini'),
    ('Austria','Loibenberg Smaragd',93,50,'Wachau',NULL,NULL,'Grüner Veltliner','Emmerich Knoll'),
    ('US','Estate',86,35,'California','Central Coast','Central Coast','Syrah','Clos La Chance'),
    ('France','Clos Windsbuhl',95,80,'Alsace','Alsace',NULL,'Gewürztraminer','Domaine Zind-Humbrecht'),
    ('Italy','Tenuta Valleselle Aurum',88,45,'Veneto','Amarone della Valpolicella Classico',NULL,'Corvina, Rondinella, Molinara','Tinazzi'),
    ('US',NULL,88,22,'California','Russian River Valley','Sonoma','Arneis','Seghesio'),
    ('Australia','Julius',90,30,'South Australia','Eden Valley',NULL,'Riesling','Henschke'),
    ('US','Alpha Wolf Vineyards',87,40,'California','Napa Valley','Napa','Cabernet Sauvignon','Eagle Eye'),
    ('Portugal','Marquês de Borba',88,14,'Alentejo',NULL,NULL,'Portuguese Red','J. Portugal Ramos'),
    ('Italy',NULL,83,NULL,'Tuscany','Rosso di Montalcino',NULL,'Sangiovese Grosso','Poggio dell''Aquila'),
    ('US','Floodgate Vineyard',92,54,'California','Russian River Valley','Sonoma','Pinot Noir','Fulcrum'),
    ('France',NULL,86,20,'Bordeaux','Bordeaux Blanc',NULL,'Bordeaux-style White Blend','Château Timberlay'),
    ('US',NULL,83,15,'Oregon','Dundee Hills','Willamette Valley','Pinot Blanc','Erath'),
    ('US','Alden Perry Reserve Napa Redwoods Estate',92,42,'California','Mount Veeder','Napa','Bordeaux-style Red Blend','Yates Family Vineyard'),
    ('New Zealand','Unoaked',85,15,'East Coast',NULL,NULL,'Chardonnay','Gunn Estate'),
    ('US',NULL,90,30,'California','Marin County','North Coast','Pinot Noir','De Loach'),
    ('France','Prestige',84,12,'Rhône Valley','Costières de Nîmes',NULL,'Rhône-style Red Blend','Château de Valcombe'),
    ('US',NULL,84,14,'California','Lodi','Central Valley','Zinfandel','Plungerhead'),
    ('Italy',NULL,84,9,'Veneto','Soave',NULL,'Garganega','Bolla'),
    ('New Zealand','Seddon',92,44,'Marlborough',NULL,NULL,'Pinot Noir','Villa Maria'),
    ('Australia','Poacher''s Blend Semillon-Sauvignon Blanc-Riesling',86,13,'South Australia','Barossa',NULL,'White Blend','St Hallett'),
    ('US',NULL,90,50,'Washington','Columbia Valley (WA)','Columbia Valley','Cabernet Sauvignon','Browne Family Vineyards'),
    ('Canada','Icewine',91,50,'Ontario','Niagara Peninsula',NULL,'Riesling','Henry of Pelham'),
    ('France',NULL,84,NULL,'Bordeaux','Bordeaux Supérieur',NULL,'Bordeaux-style Red Blend','Château Grand Rolland'),
    ('France','Vide Bourse Premier Cru',92,NULL,'Burgundy','Chassagne-Montrachet',NULL,'Chardonnay','Albert Bichot'),
    ('US',NULL,90,40,'California','Sonoma Coast','Sonoma','Pinot Noir','Glasshaus'),
    ('Spain','Viña Borgia',86,6,'Northern Spain','Campo de Borja',NULL,'Garnacha','Borsao'),
    ('US','Van Ness Vineyard',94,53,'California','Alexander Valley','Sonoma','Syrah','Palmeri'),
    ('US','J-W',84,13,'Iowa','Iowa',NULL,'Rosé','Jasper'),
    ('US','Estate Grown',85,35,'California','Russian River Valley','Sonoma','Sauvignon Blanc','Rochioli'),
    ('Portugal','Vila Santa Reserva',91,20,'Alentejano',NULL,NULL,'Portuguese Red','J. Portugal Ramos'),
    ('US','Proprietor''s Reserve Barrel Fermented',86,20,'New York','Finger Lakes','Finger Lakes','Chardonnay','Chateau Lafayette Reneau'),
    ('US',NULL,95,20,'Washington','Walla Walla Valley (WA)','Columbia Valley','Chardonnay','Rulo'),
    ('US',NULL,83,11,'California','California','California Other','Zinfandel','Avenue'),
    ('US','Oak Select',87,25,'Oregon','Willamette Valley','Willamette Valley','Chardonnay','Noble Estate'),
    ('US',NULL,86,25,'California','Santa Clara Valley','Central Coast','Viognier','Lion Ranch'),
    ('New Zealand','Old Coach Road',86,20,'Nelson',NULL,NULL,'Pinot Noir','Seifried'),
    ('US','Crossfire Beckstoffer Missouri Hopper Vineyard',87,85,'California','Oakville','Napa','Cabernet Sauvignon','World''s End'),
    ('US','Terroir Champoux Vineyard',85,25,'Washington','Horse Heaven Hills','Columbia Valley','Cabernet Sauvignon','Hogue'),
    ('France',NULL,85,12,'Bordeaux','Bordeaux Blanc',NULL,'Bordeaux-style White Blend','Château Grand Jean'),
    ('US','Highlands Estates Trace Ridge',92,75,'California','Knights Valley','Sonoma','Bordeaux-style Red Blend','Kendall-Jackson'),
    ('Argentina','Gemela Reserva',85,20,'Mendoza Province','San Rafael',NULL,'Cabernet Sauvignon','Finca Santa Justina'),
    ('US',NULL,87,18,'California','Happy Canyon of Santa Barbara','Central Coast','Sauvignon Blanc','3CV'),
    ('Portugal','Casa de Santar',89,15,'Dão',NULL,NULL,'Portuguese Red','Dão Sul'),
    ('New Zealand',NULL,84,19,'Kumeu',NULL,NULL,'Sauvignon Blanc','Kumeu River'),
    ('Spain','Atteca Armas Old Vines',92,45,'Northern Spain','Calatayud',NULL,'Garnacha','Bodegas Ateca'),
    ('Spain','Tinto',83,6,'Levante','Valencia',NULL,'Bobal','El Copero'),
    ('US','Fish House',88,13,'Washington','Columbia Valley (WA)','Columbia Valley','Sauvignon Blanc','Magnificent Wine Company'),
    ('US','Reserve',86,22,'New York','North Fork of Long Island','Long Island','Merlot','Christiano Family'),
    ('US',NULL,85,35,'California','Santa Lucia Highlands','Central Coast','Chardonnay','In Re'),
    ('Italy','Sylvoz Brut',85,15,'Veneto','Prosecco',NULL,'Glera','Le Colture'),
    ('US','The Contender',91,55,'Washington','Walla Walla Valley (WA)','Columbia Valley','Syrah','Reynvaan Family Vineyards'),
    ('US','TF Cab',91,65,'California','Napa Valley','Napa','Cabernet Sauvignon','Tyler Florence'),
    ('Chile',NULL,86,10,'Maipo Valley',NULL,NULL,'Syrah','Carmen'),
    ('France','Cuvée Millesimé Grand Cru Brut',93,75,'Champagne','Champagne',NULL,'Chardonnay','Pierre Moncuit'),
    ('US','Cañon Creek Vineyard',85,40,'California','Napa Valley','Napa','Cabernet Sauvignon','Midsummer Cellars'),
    ('France','Chardonnay de Chardonnay',85,16,'Burgundy','Mâcon-Chardonnay',NULL,'Chardonnay','Cave de Lugny'),
    ('Spain','VA Viña Aljibes',84,15,'Central Spain','Vino de la Tierra de Castilla',NULL,'Sauvignon Blanc-Chardonnay','Aljibes'),
    ('US',NULL,90,16,'Oregon','Umpqua Valley','Southern Oregon','Pinot Gris','Anindor'),
    ('US','Cold Creek Vineyard',89,26,'Washington','Columbia Valley (WA)','Columbia Valley','Chardonnay','Chateau Ste. Michelle'),
    ('US',NULL,88,38,'California','Rutherford','Napa','Merlot','Frog''s Leap'),
    ('New Zealand',NULL,90,23,'Nelson',NULL,NULL,'Pinot Noir','Woollaston'),
    ('Italy','Tezza',89,20,'Veneto','Valpolicella Ripasso Valpantena Superiore',NULL,'Corvina, Rondinella, Molinara','Tezza'),
    ('US',NULL,87,14,'California','Mendocino','Mendocino/Lake Counties','Chenin Blanc','Graziano'),
    ('Hungary',NULL,85,9,'Neszmély',NULL,NULL,'Grüner Veltliner','Craftsman'),
    ('South Africa','Barrel Fermented',89,38,'Stellenbosch',NULL,NULL,'Chardonnay','Mulderbosch'),
    ('US',NULL,82,9,'California','California','California Other','Merlot','Camelot'),
    ('France',NULL,84,10,'Bordeaux','Bordeaux Blanc',NULL,'Bordeaux-style White Blend','Mouton-Cadet'),
    ('US',NULL,89,18,'California','Shenandoah Valley (CA)','Sierra Foothills','Sauvignon Blanc','Helwig'),
    ('US',NULL,86,19,'New York','Finger Lakes','Finger Lakes','Merlot','Keuka Spring'),
    ('Chile','Lote D',87,14,'Marchigue',NULL,NULL,'Syrah','Polkura'),
    ('US',NULL,86,14,'California','Sonoma County','Sonoma','Fumé Blanc','Dry Creek Vineyard'),
    ('US',NULL,87,80,'California','Rutherford','Napa','Cabernet Sauvignon','Pine Ridge'),
    ('US','Chapitre 3',90,NULL,'Washington','Columbia Valley (WA)','Columbia Valley','Syrah','Betz Family'),
    ('Italy',NULL,89,30,'Tuscany','Rosso di Montalcino',NULL,'Sangiovese Grosso','Querce Bettina'),
    ('US','Wallula Vineyard Biodynamic',95,32,'Washington','Columbia Valley (WA)','Columbia Valley','Riesling','Pacific Rim'),
    ('Israel','Reserve Kosher',81,15,'Upper Galilee',NULL,NULL,'Sauvignon Blanc','Binyamina'),
    ('France','Extra Fruit XF',85,10,'Bordeaux','Bordeaux Blanc',NULL,'Sauvignon Blanc','Calvet'),
    ('Italy',NULL,90,35,'Tuscany','Brunello di Montalcino',NULL,'Sangiovese','Tenuta di Sesta'),
    ('New Zealand',NULL,89,25,'Marlborough',NULL,NULL,'Sauvignon Blanc','Crowded House'),
    ('Italy',NULL,87,17,'Tuscany','Rosso di Montalcino',NULL,'Sangiovese Grosso','La Gerla'),
    ('US',NULL,91,20,'Washington','Columbia Valley (WA)','Columbia Valley','Syrah','Arbor Crest'),
    ('France',NULL,89,NULL,'Bordeaux','Haut-Médoc',NULL,'Bordeaux-style Red Blend','Château Peyrabon'),
    ('Spain',NULL,89,16,'Northern Spain','Rueda',NULL,'Verdejo','Valdelapinta'),
    ('Australia','Reserve',87,12,'South Australia','South Australia',NULL,'Chardonnay','Jacob''s Creek'),
    ('US','Alary',88,35,'California','Russian River Valley','Sonoma','Chardonnay','Arrowood'),
    ('Spain',NULL,85,10,'Central Spain','Vino de la Tierra de Castilla',NULL,'Tempranillo','Spanish Vines'),
    ('Italy','Villa Montignana Riserva',88,23,'Tuscany','Chianti Classico',NULL,'Sangiovese','Coli'),
    ('US',NULL,88,22,'Oregon','Willamette Valley','Willamette Valley','Pinot Noir','Amity'),
    ('US','Lone Canyon Vineyard',89,65,'California','Napa Valley','Napa','Cabernet Sauvignon','Ladera'),
    ('Argentina',NULL,85,13,'Mendoza Province','Mendoza',NULL,'Viognier','Viña Las Perdices'),
    ('US','Bachelor''s Button',90,28,'Washington','Columbia Valley (WA)','Columbia Valley','Cabernet Sauvignon','Isenhower'),
    ('Italy','Rocchettevino',94,NULL,'Piedmont','Barolo',NULL,'Nebbiolo','Viberti'),
    ('Italy','Extra Dry',85,NULL,'Veneto','Prosecco',NULL,'Glera','Maccari Spumanti'),
    ('US','Barrel Fermented',85,15,'New York','Finger Lakes','Finger Lakes','Chardonnay','Glenora'),
    ('Portugal','Cape Roca Fish',84,15,'Alentejano',NULL,NULL,'Portuguese Red','Casca Wines'),
    ('Portugal','Pedras do Monte',85,8,'Península de Setúbal',NULL,NULL,'Castelão','DFJ Vinhos'),
    ('US','La Colline',92,60,'California','Arroyo Grande Valley','Central Coast','Pinot Noir','Laetitia'),
    ('US',NULL,85,22,'California','Paicines','Central Coast','Claret','Donati'),
    ('France',NULL,89,NULL,'Bordeaux','Pomerol',NULL,'Bordeaux-style Red Blend','Château Altimar'),
    ('Israel','14 Months Barrel Aged Kosher',84,22,'Judean Hills',NULL,NULL,'Shiraz','Barkan'),
    ('US',NULL,83,8,'California','California','California Other','Sauvignon Blanc','Bogle'),
    ('US','Julius Caesar',86,40,'Oregon','Oregon','Oregon Other','Syrah','Merrill Cellars'),
    ('Portugal',NULL,91,20,'Douro',NULL,NULL,'Touriga Nacional','Quinta de Ventozelo'),
    ('France','Bonheur Convivial',90,20,'Alsace','Alsace',NULL,'Pinot Noir','Domaine Rieflé-Landmann'),
    ('Spain','Via Cenit VDC',92,30,'Northern Spain','Tierra del Viños de Zamora',NULL,'Tempranillo','Viñas del Cenit'),
    ('US','Estate',90,22,'California','Santa Ynez Valley','Central Coast','Syrah','Zaca Mesa'),
    ('Argentina','Catena',88,20,'Mendoza Province','Mendoza',NULL,'Cabernet Sauvignon','Bodega Catena Zapata'),
    ('US',NULL,87,9,'Washington','Columbia Valley (WA)','Columbia Valley','Merlot','Hogue'),
    ('US','Drizzle',91,17,'Washington','Red Mountain','Columbia Valley','Pinot Gris','Convergence Zone'),
    ('France','Réserve',93,35,'Alsace','Alsace',NULL,'Riesling','Trimbach'),
    ('Italy','Passión',88,25,'Northeastern Italy','Colli Orientali del Friuli',NULL,'White Blend','Guerra Albano'),
    ('Portugal','Vertice Cuvée Reserva',87,19,'Douro',NULL,NULL,'Portuguese Sparkling','Caves Transmontanas');

CREATE TABLE IF NOT EXISTS website_stats (
    `website_id` INT,
    `day` DATETIME,
    `no_users` INT,
    `ad_impressions` INT,
    `ad_clicks` INT,
    `Income` NUMERIC(5, 2)
);
INSERT INTO website_stats VALUES
    (1,'2020-07-01 00:00:00',39196,109834,237,76.17),
    (2,'2020-07-02 00:00:00',27651,287612,793,243.11),
    (3,'2020-07-03 00:00:00',8483,501099,1545,410.99),
    (1,'2020-07-04 00:00:00',12763,56990,160,40.01),
    (2,'2020-07-05 00:00:00',10666,170555,343,98.78),
    (3,'2020-07-06 00:00:00',21189,370101,804,121.12),
    (1,'2020-07-07 00:00:00',18998,145783,348,134.91),
    (2,'2020-07-08 00:00:00',25987,295633,782,144.71),
    (3,'2020-07-09 00:00:00',38616,117825,342,95.6),
    (1,'2020-07-10 00:00:00',29715,320101,1029,189.88),
    (2,'2020-07-11 00:00:00',22769,143320,423,76.5),
    (3,'2020-07-12 00:00:00',18956,168123,378,112.12),
    (1,'2020-07-13 00:00:00',21000,178423,526,98.81),
    (2,'2020-07-14 00:00:00',28110,172505,407,89.13),
    (3,'2020-07-15 00:00:00',34345,57924,135,33.75),
    (1,'2020-07-16 00:00:00',32988,311300,609,121.73),
    (2,'2020-07-17 00:00:00',25500,187530,383,57.47),
    (3,'2020-07-18 00:00:00',33164,236598,594,118.75),
    (1,'2020-07-19 00:00:00',34100,345678,857,197.08),
    (2,'2020-07-20 00:00:00',10799,80012,229,52.58);

CREATE TABLE IF NOT EXISTS web (
    `id` INT,
    `name` VARCHAR(10) CHARACTER SET utf8,
    `budget` INT,
    `launch_date` DATETIME
);
INSERT INTO web VALUES
    (1,'Olympus',2800,'2020-02-01 00:00:00'),
    (2,'Gamesville',900,'2020-03-20 00:00:00'),
    (3,'Teletube',600,'2020-04-12 00:00:00');

CREATE TABLE IF NOT EXISTS students (
    `student_id` INT,
    `subject` VARCHAR(7) CHARACTER SET utf8,
    `name` VARCHAR(6) CHARACTER SET utf8,
    `marks` INT
);
INSERT INTO students VALUES
    (1,'English','Ross',90),
    (2,'English','Nancy',70),
    (3,'Maths','Rachel',69),
    (4,'Maths','Joey',59),
    (5,'Maths','Mike',56),
    (6,'Science','Harvey',60),
    (7,'Science','Ross',75),
    (8,'Science','Nancy',65),
    (9,'Maths','Jack',45),
    (10,'English','Mary',94),
    (11,'Maths','Nancy',100);

CREATE TABLE IF NOT EXISTS sale (
    `id` INT,
    `game_id` INT,
    `price` NUMERIC(4, 2),
    `date` DATETIME
);
INSERT INTO sale VALUES
    (1,7,15.99,'2020-03-07 00:00:00'),
    (2,12,13.99,'2020-08-13 00:00:00'),
    (3,6,11.99,'2020-01-21 00:00:00'),
    (4,11,7.99,'2020-10-21 00:00:00'),
    (5,4,12.99,'2020-05-03 00:00:00'),
    (6,2,1.99,'2020-07-08 00:00:00'),
    (7,2,5.99,'2020-03-29 00:00:00'),
    (8,10,18.99,'2020-01-05 00:00:00'),
    (9,8,3.99,'2020-07-18 00:00:00'),
    (10,4,7.99,'2020-06-04 00:00:00'),
    (11,12,14.99,'2020-10-16 00:00:00'),
    (12,10,15.99,'2020-08-23 00:00:00'),
    (13,5,13.99,'2020-09-20 00:00:00'),
    (14,9,14.99,'2020-07-17 00:00:00'),
    (15,10,10.99,'2020-06-07 00:00:00'),
    (16,2,1.99,'2020-06-09 00:00:00'),
    (17,8,8.99,'2020-04-13 00:00:00'),
    (18,1,6.99,'2020-01-12 00:00:00'),
    (19,2,3.99,'2020-06-18 00:00:00'),
    (20,6,19.99,'2020-08-07 00:00:00');

CREATE TABLE IF NOT EXISTS rent (
    `id` INT,
    `rental_date` DATETIME,
    `rental_period` INT,
    `platform` VARCHAR(7) CHARACTER SET utf8,
    `customer_id` INT,
    `movie_id` INT,
    `payment_date` DATETIME,
    `payment_amount` INT
);
INSERT INTO rent VALUES
    (1,'2016-04-09 00:00:00',1,'desktop',2,4,'2016-04-16 00:00:00',6),
    (2,'2016-04-05 00:00:00',1,'mobile',6,3,'2016-04-11 00:00:00',8),
    (3,'2016-03-25 00:00:00',1,'tablet',4,2,'2016-03-30 00:00:00',9),
    (4,'2016-02-09 00:00:00',1,'desktop',5,1,'2016-02-12 00:00:00',8),
    (5,'2016-03-15 00:00:00',1,'mobile',4,3,'2016-03-22 00:00:00',6),
    (6,'2016-04-11 00:00:00',1,'tablet',5,5,'2016-04-17 00:00:00',9),
    (7,'2016-01-07 00:00:00',1,'desktop',5,5,'2016-01-13 00:00:00',9),
    (8,'2016-04-09 00:00:00',1,'mobile',6,3,'2016-04-16 00:00:00',6),
    (9,'2016-04-27 00:00:00',1,'tablet',2,1,'2016-04-30 00:00:00',6),
    (10,'2016-03-21 00:00:00',3,'desktop',5,4,'2016-03-24 00:00:00',21),
    (11,'2016-02-10 00:00:00',3,'mobile',5,4,'2016-02-15 00:00:00',15),
    (12,'2016-03-20 00:00:00',3,'tablet',7,4,'2016-03-27 00:00:00',12),
    (13,'2016-04-13 00:00:00',3,'desktop',2,1,'2016-04-18 00:00:00',18),
    (14,'2016-03-08 00:00:00',3,'desktop',7,2,'2016-03-14 00:00:00',24),
    (15,'2016-02-20 00:00:00',7,'mobile',4,2,'2016-02-23 00:00:00',28),
    (16,'2016-04-21 00:00:00',7,'mobile',1,5,'2016-04-26 00:00:00',28),
    (17,'2016-03-26 00:00:00',7,'mobile',1,5,'2016-04-01 00:00:00',49),
    (18,'2016-04-10 00:00:00',7,'tablet',3,1,'2016-04-17 00:00:00',28),
    (19,'2016-01-06 00:00:00',7,'desktop',1,5,'2016-01-11 00:00:00',49),
    (20,'2016-01-12 00:00:00',7,'desktop',5,3,'2016-01-16 00:00:00',21);

CREATE TABLE IF NOT EXISTS ratings (
    `id` INT,
    `rating` INT,
    `customer_id` INT,
    `movie_id` INT
);
INSERT INTO ratings VALUES
    (1,7,2,1),
    (2,8,6,1),
    (3,10,1,2),
    (4,10,2,2),
    (5,8,3,2),
    (6,9,1,2),
    (7,9,3,3),
    (8,9,7,3),
    (9,8,2,3),
    (10,6,5,3),
    (11,3,5,4),
    (12,3,3,4),
    (13,5,6,4),
    (14,1,2,4),
    (15,1,1,5),
    (16,1,3,5),
    (17,3,4,5),
    (18,2,7,5);

CREATE TABLE IF NOT EXISTS play_store (
    `id` INT,
    `name` VARCHAR(20) CHARACTER SET utf8,
    `platform` VARCHAR(13) CHARACTER SET utf8,
    `genre` VARCHAR(10) CHARACTER SET utf8,
    `editor_rating` INT,
    `size` INT,
    `released` DATETIME,
    `updated` DATETIME
);
INSERT INTO play_store VALUES
    (1,'Bugs Smash','iOS','action',6,101,'2019-07-13 00:00:00','2020-05-01 00:00:00'),
    (2,'Rescue Mission','iOS','simulation',9,36,'2019-09-27 00:00:00','2020-07-30 00:00:00'),
    (3,'Marvel ','iOS','roll play',10,125,'2019-10-25 00:00:00','2020-03-20 00:00:00'),
    (4,'Miss Match','iOS','adventure',6,127,'2019-07-02 00:00:00','2020-05-01 00:00:00'),
    (5,'Moto Racer GP','iOS','racing',7,127,'2019-07-25 00:00:00','2020-03-20 00:00:00'),
    (6,'Gardenscape','Android','roll play',10,10,'2019-12-15 00:00:00','2020-12-01 00:00:00'),
    (7,'Zoo Advent','Android','shooting',8,123,'2019-03-20 00:00:00','2020-12-01 00:00:00'),
    (8,'Hitter Shock','Android','action',3,54,'2019-01-05 00:00:00','2020-05-01 00:00:00'),
    (9,'Box Bix','Android','action',5,86,'2019-03-16 00:00:00','2020-12-01 00:00:00'),
    (10,'Flight Simulator','Android','simulation',8,36,'2019-05-23 00:00:00','2020-07-30 00:00:00'),
    (11,'Whip-lash','Windows Phone','action',6,55,'2019-01-07 00:00:00','2020-12-01 00:00:00'),
    (12,'Too Fast Too Furious','Windows Phone','racing',8,44,'2019-02-20 00:00:00','2020-10-01 00:00:00');


CREATE TABLE IF NOT EXISTS movies (
    `id` INT,
    `title` VARCHAR(24) CHARACTER SET utf8,
    `release_year` INT,
    `genre` VARCHAR(9) CHARACTER SET utf8,
    `editor_rating` NUMERIC(2, 1)
);
INSERT INTO movies VALUES
    (1,'The Godfather',1972,'Crime',9.2),
    (2,'The Shawshank Redemption',1994,'Drama',9.5),
    (3,'The Gofather: Part 2',1974,'Crime',8),
    (4,'Inception',2010,'Action',8.5),
    (5,'Fight Club',1999,'Drame',8.3),
    (6,'The Dark Knight',2008,'Action',9),
    (7,'12 Angry Men',1957,'Crime',8.8),
    (8,'The Lord of the Rings',2011,'Adventure',8.8),
    (9,'The Matix',1999,'Sci-fi',8.5),
    (10,'Seven',1995,'Crime',8.4);

select * from wine;
select * from website_stats;
select* from web;
select * from students;
select* from sale;
select*from rent;
select * from ratings;
select * from play_store;
select * from movies;
 
# Q1. Give a dense rank to the wine varities on the basis of the price.
select variety,price,
dense_rank() over(order by price desc) as price_rank
from wine; 

select variety,price,country,
dense_rank() over(partition by variety order by price desc) as denserank_by_price,
dense_rank() over(partition by country order by price desc) as denserank_by_country from wine;

with PR as 
(select variety,price,country,
dense_rank() over(partition by variety order by price desc) as pricerank_variety,
dense_rank() over(partition by country order by price desc) as pricerank_country
from wine)
select price,country,pricerank_country from PR where pricerank_country;

# Q2. Use aggregate window functions to find the average of points for each row within
# its partition (country) and also arrange the final result in the descending order by country.
# print country,province,winery,variety 

select country, province,winery,variety,
avg(points) over(partition by country ) as avgpoints_country
from wine
order by country desc;

# Q3. Provide the new roll numbers to the students on the basis of their names alphabetically.

# Giving New Roll Number 
select* from students;
select student_id as oldrollnum,subject,name,marks,
row_number() over(order by name) as new_roll_num
from students;

# Q4. Display the difference in ad_clicks between the current day and the next day for 
# the website 'Olympus'

select* from website_stats;

#Using Lead and lag functions

select * from web;

select website_id,day,ad_clicks,
lead(ad_clicks) over (order by day) as next_day_ad_clicks
from website_stats;

#Using Lead and lag functions

with Adc as
(select website_id,day,ad_clicks as current_day_ad_clicks,
lead(ad_clicks) over (order by day) as next_day_ad_clicks
from website_stats)
select (ws.next_day_ad_clicks - ws.current_day_ad_clicks) as adclicks_dif,w.name
from Adc ws,web w where ws.website_id=w.id and w.name like'Olympus%';

# Q5. Write a query that displays the statistics for website_id = 3 such that for each row,
# show the day, the number of users and the smallest number of users ever.

select * from website_stats;
# Displaying smallest no users
select day,no_users,website_id,
min(no_users) over(partition by website_id)as smallest_no_users
from website_stats
where website_id=3;

# Q6. Write a query thats orders games in the play store into three buckets as 
#per editor ratings received  from higher to lowest

select*from play_store;
#per editor ratings received  from higher to lowest
#Using First_value() and Last Value()
select name,editor_rating,
dense_rank() over(order by editor_rating desc)as rating_ranks,
ntile(3) over(order by editor_rating desc) bucket
from play_store;

# Q7. Write a query that displays the name of the game, the price, the sale date and 
#the 4th column should display # the sales consecutive number i.e. ranking of game as 
#per the sale took place, so that the latest game sold gets number 1. 
#Order the result by editor's rating of the game

select * from play_store;
select * from sale;

with sales as
(select game_id,price,date,
dense_rank() over(order by date desc)as sales_date
from sale)
select ps.name,ps.editor_rating,price,s.date
from sales s, play_store ps
where s.game_id=ps.id
order by editor_rating;

# Dataset Used: movies.csv, ratings.csv, rent.csv

# Q8. Write a query that displays basic movie informations as well as the previous rating 
#provided by customer for that same movie 
# make sure that the list is sorted by the id of the reviews.

select * from movies;
select* from ratings;
select*from rent;

select m.id,m.title,m.release_year,m.editor_rating,r.rating as customerratiing,r.customer_id,
lag(r.rating) over(partition by m.id order by r.rating) as prevcustrating
from movies m, ratings r 
where m.id=r.movie_id
order by r.movie_id;

# Q9. For each movie, show the following information: title, genre, average user rating for 
#that movie  and its rank in the respective genre based on that average rating in descending 
#order (so that the best movies will be shown first).
select*from movies;
select*from ratings;

with mr as
(select m.title,m.genre,
avg(r.rating) over (partition by m.genre) avgrating_genre
from movies m, ratings r
where m.id=r.movie_id)
select mr.title,mr.genre,mr.avgrating_genre,
dense_rank() over(order by mr.avgrating_genre desc) as ranking_avg_genre_rating
from mr
order by ranking_avg_genre_rating;

# Q10. For each rental date, show the rental_date, the sum of payment amounts 
#(column name payment_amounts) from rent 
#on that day, the sum of payment_amounts on the previous day and the difference between  
#these two values.

select*from rent;

# Using Two Sub queries
with r as
(with rent as
(select rental_date,
sum(payment_amount)over (partition by rental_date) as currentday_total_payment
from rent)
select rental_date,currentday_total_payment,
lag(currentday_total_payment) over (order by rental_date) as previousday_total_payment
from rent)
select rental_date, currentday_total_payment,previousday_total_payment,
(currentday_total_payment-previousday_total_payment) as difference_payments
from r;