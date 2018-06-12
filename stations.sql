CREATE DATABASE IF NOT EXISTS londontubes;

USE londontubes;

DROP TABLE IF EXISTS stations;
CREATE TABLE stations (
  id smallint unsigned not null auto_increment,
  name varchar(35) not null,
  x FLOAT NOT NULL,
  y FLOAT NOT NULL,
  line VARCHAR(16) NOT NULL,
  constraint pk_example primary key (id)
);

DROP TABLE IF EXISTS target_station;
CREATE TABLE target_station (
  id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(35) NOT NULL,
  constraint pk_example primary key (id)
);

INSERT INTO stations ( name, x, y, line ) VALUES ( 'Kilburn Park', 789, 538.5, 'bakerloo' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Maida Vale', 815, 558, 'bakerloo' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Warwick Avenue', 841, 577.5, 'bakerloo' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Marylebone', 1001, 522, 'bakerloo' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Regents Park', 1091, 517, 'bakerloo' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Lambeth North', 1420, 768, 'bakerloo' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Ruislip Gardens', 142, 344, 'central' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'South Ruislip', 142, 394, 'central' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Northolt', 158, 459.9, 'central' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Greenford', 224, 509.4, 'central' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Perivale', 304, 569.4, 'central' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'West Acton', 407, 694.9, 'central' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'North Acton', 483, 703.9, 'central' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'East Acton', 580, 723.9, 'central' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Holland Park', 806, 723.9, 'central' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Queensway', 930, 723.9, 'central' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Lancaster Gate', 996, 691, 'central' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Marble Arch', 1048, 652, 'central' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Chancery Lane', 1330, 520, 'central' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'St Pauls', 1410, 540, 'central' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Bethnal Green', 1660, 452, 'central' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Leyton', 1947, 214, 'central' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Snaresbrook', 1926, 106, 'central' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'South Woodford', 1926, 76, 'central' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Woodford', 1928.5, 46, 'central' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Buckhurst Hill', 1926, 16, 'central' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Loughton', 1926, -14, 'central' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Debden', 1926, -44, 'central' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Theydon Bois', 1926, -74, 'central' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Epping', 1926, -104, 'central' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Wanstead', 1956, 120, 'central' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Redbridge', 1996, 120, 'central' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Gants Hill', 2036, 120, 'central' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Newbury Park', 2076, 120, 'central' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Barkingside', 2111, 90, 'central' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Fairlop', 2111, 66, 'central' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Hainault', 2111, 42, 'central' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Grange Hill', 2076, 10, 'central' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Chigwell', 2018.5, 10, 'central' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Roding Valley', 1961, 10, 'central' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Bayswater', 1020.3, 723.9, 'district' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Bayswater', 1020.3, 723.9, 'circle' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'High Street Kensington', 1020.3, 723.9, 'circle' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'High Street Kensington', 1020.3, 723.9, 'district' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Sloane Square', 1136, 819, 'district' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Sloane Square', 1133, 815, 'circle' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'St Jamess Park', 1210, 763.5, 'district' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'St Jamess Park', 1207, 759.5, 'circle' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Temple', 1336, 663, 'circle' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Temple', 1339, 667, 'district' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Mansion House', 1400, 615, 'circle' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Mansion House', 1403, 619, 'district' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Great Portland Street', 1111, 461.5, 'hnc' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Great Portland Street', 1114, 465.5, 'circle' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Great Portland Street', 1117, 469.5, 'metropolitan' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Royal Oak', 800, 620, 'circle' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Royal Oak', 800, 615, 'hnc' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Westbourne Park', 722.5, 641, 'hnc' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Westbourne Park', 725.5, 645, 'circle' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Ladbroke Grove', 689.5, 672, 'circle' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Ladbroke Grove', 686.5, 668, 'hnc' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Latimer Road', 652.5, 693.5, 'hnc' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Latimer Road', 655.5, 697.5, 'circle' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Shepherds Bush Market', 639.5, 772.9, 'circle' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Shepherds Bush Market', 634.5, 772.9, 'hnc' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Goldhawk Road', 639.5, 802.9, 'circle' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Goldhawk Road', 634.5, 802.9, 'hnc' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Chiswick Park', 475, 800.5, 'district' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Turnham Green', 521, 835, 'district' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Stamford Brook', 545, 853, 'district' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Ravenscourt Park', 587, 869.4, 'district' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Barons Court', 705, 869.4, 'district' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'West Kensington', 780, 869.4, 'district' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Stepney Green', 1755.5, 494, 'district' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Stepney Green', 1752.5, 490, 'hnc' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Bromley-by-Bow', 1963, 431.5, 'hnc' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Bromley-by-Bow', 1963, 436.5, 'district' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Plaistow', 2071, 426.5, 'district' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Plaistow', 2068, 422.5, 'hnc' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Upton Park', 2101, 404, 'district' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Upton Park', 2098, 400, 'hnc' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'East Ham', 2131, 381.5, 'district' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'East Ham', 2128, 377.5, 'hnc' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Upney', 2191, 336.5, 'district' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Becontree', 2221, 314, 'district' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Dagenham Heathway', 2251, 291.5, 'district' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Dagenham East', 2281, 269, 'district' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Elm Park', 2311, 246.5, 'district' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Hornchurch', 2341, 224, 'district' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Upminster Bridge', 2371, 201.5, 'district' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Upminster', 2401, 179, 'district' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Fulham Broadway', 831, 960, 'district' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Parsons Green', 840, 987.5, 'district' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Putney Bridge', 861, 1015.5, 'district' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'East Putney', 882, 1043.5, 'district' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Southfields', 900, 1067.5, 'district' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Wimbledon Park', 918, 1091.5, 'district' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Wimbledon', 939, 1119.5, 'district' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Stanmore', 651, 162, 'jubilee' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Canons Park', 651, 192, 'jubilee' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Queensbury', 651, 222, 'jubilee' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Kingsbury', 651, 252, 'jubilee' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Neasden', 681, 309, 'jubilee' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Dollis Hill', 741, 309, 'jubilee' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Willesden Green', 801, 309, 'jubilee' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Swiss Cottage', 957.5, 411, 'jubilee' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'St Johns Wood', 995, 461, 'jubilee' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Southwark', 1380.2, 699.6, 'jubilee' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Bermondsey', 1590, 675, 'jubilee' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'North Greenwich', 2000, 648, 'jubilee' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Amersham', 100, 60, 'jubilee' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Chesham', 124, 38, 'metropolitan' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Chalfont and Latimer', 140, 90, 'metropolitan' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Chorleywood', 170, 112.5, 'metropolitan' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Rickmansworth', 200, 135, 'metropolitan' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Watford', 223, 80, 'metropolitan' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Croxley', 223, 130, 'metropolitan' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Cassiobridge', 323, 90, 'metropolitan' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Watford Vicarage Road', 423, 90, 'metropolitan' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Moor Park', 240, 165, 'metropolitan' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Northwood', 270, 187.5, 'metropolitan' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Northwood Hills', 300, 210, 'metropolitan' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Pinner', 330, 232.5, 'metropolitan' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'North Harrow', 360, 255, 'metropolitan' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'West Harrow', 380, 294, 'metropolitan' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Harrow on the Hill', 440, 294, 'metropolitan' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Preston Road', 590, 294, 'metropolitan' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Edgware', 706, 124.5, 'northern' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Burnt Oak', 738, 148.5, 'northern' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Colindale', 768, 171, 'northern' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Hendon Central', 798, 193.5, 'northern' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Brent Cross', 828, 216, 'northern' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Golders Green', 858, 238.5, 'northern' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Hampstead', 888, 261, 'northern' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Belsize Park', 1010, 281, 'northern' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Chalk Farm', 1090, 281, 'northern' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Mill Hill East', 913, 90, 'northern' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'High Barnet', 854, 4.5, 'northern' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Totteridge And Whetstone', 884, 27, 'northern' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Woodside Park', 914, 49.5, 'northern' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'West Finchley', 944, 72, 'northern' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Finchley Central', 984, 102, 'northern' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'East Finchley', 1014, 124.5, 'northern' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Highgate', 1044, 147, 'northern' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Tufnell Park', 1108, 195, 'northern' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Mornington Crescent', 1202, 332, 'northern' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Goodge Street', 1163, 450, 'northern' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Angel', 1389, 469.5, 'northern' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Old Street', 1389, 469.5, 'northern' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Borough', 1479, 730, 'northern' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Kennington', 1384.5, 856, 'northern' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Oval', 1336.5, 892, 'northern' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Clapham Common', 1210.5, 986.5, 'northern' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Clapham South', 1180.5, 1009, 'northern' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Balham', 1150.5, 1031.5, 'northern' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Tooting Bec', 1120.5, 1054, 'northern' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Tooting Broadway', 1090.5, 1076.5, 'northern' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Colliers Wood', 1060.5, 1099, 'northern' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'South Wimbledon', 1030.5, 1121.5, 'northern' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Morden', 1000.5, 1144, 'northern' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Nine Elms', 1204.5, 901, 'northern' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Battersea Power Station', 1134, 927.25, 'northern' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'South Harrow', 384, 370, 'piccadilly' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Sudbury Hill', 384, 430, 'piccadilly' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Sudbury Town', 384, 490, 'piccadilly' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Alperton', 384, 550, 'piccadilly' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'North Ealing', 384, 670, 'piccadilly' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Heathrow 23', 93, 956.5, 'piccadilly' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Heathrow 5 Crossrail', 30, 966.5, 'crossrail' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Heathrow 5 Piccadilly', 30, 956.5, 'piccadilly' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Hatton Cross', 160, 947.5, 'piccadilly' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Hounslow West', 190, 925, 'piccadilly' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Hounslow Central', 220, 902.5, 'piccadilly' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Hounslow East', 250, 880, 'piccadilly' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Osterley', 280, 857.5, 'piccadilly' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Boston Manor', 310, 835, 'piccadilly' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Northfields', 340, 812.5, 'piccadilly' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'South Ealing', 370, 790, 'piccadilly' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Turnham Green', 530, 823, 'piccadilly' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Turnham Green', 705, 854.4, 'piccadilly' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Knightsbridge', 1114.6, 766, 'piccadilly' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Hyde Park Corner', 1114.6, 726, 'piccadilly' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Covent Garden', 1250, 549.25, 'piccadilly' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Russell Square', 1290, 450, 'piccadilly' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Caledonian Road', 1306, 260, 'piccadilly' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Holloway Road', 1336, 237.5, 'piccadilly' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Arsenal', 1366, 215, 'piccadilly' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Manor House', 1382.5, 159, 'piccadilly' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Turnpike Lane', 1335, 74, 'piccadilly' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Wood Green', 1305, 51.5, 'piccadilly' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Bounds Green', 1275, 29, 'piccadilly' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Arnos Grove', 1245, 6.5, 'piccadilly' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Southgate', 1215, -16, 'piccadilly' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Oakwood', 1185, -38.5, 'piccadilly' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Cockfosters', 1155, -60, 'piccadilly' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Uxbridge', 20, 299, 'piccadilly' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Uxbridge', 20, 294, 'metropolitan' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Hillingdon', 60, 294, 'metropolitan' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Hillingdon', 60, 299, 'piccadilly' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Ruislip', 180, 299, 'piccadilly' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Ruislip', 180, 294, 'metropolitan' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Ruislip Manor', 220, 294, 'metropolitan' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Ruislip Manor', 220, 299, 'piccadilly' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Eastcote', 260, 299, 'piccadilly' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Eastcote', 260, 294, 'metropolitan' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Tottenham Hale', 1530, 113, 'victoria' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Pimlico', 1206, 826, 'victoria' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Vauxhall', 1236, 866, 'victoria' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Brixton', 1305, 958, 'victoria' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Limehouse', 1747, 585, 'dlr' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Westferry', 1800, 585, 'dlr' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Blackwall', 1940, 585, 'dlr' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'East India', 1980, 585, 'dlr' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Royal Victoria', 2135, 585, 'dlr' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Prince Regent', 2225, 585, 'dlr' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Royal Albert', 2270, 585, 'dlr' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Beckton Park', 2315, 585, 'dlr' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Cyprus', 2360, 585, 'dlr' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Gallions Reach', 2390, 543, 'dlr' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Beckton', 2390, 513, 'dlr' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Pudding Mill Lane', 1940, 368, 'dlr' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Devons Road', 1900, 488, 'dlr' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Langdon Park', 1900, 514, 'dlr' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'All Saints', 1900, 540, 'dlr' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'West India Quay', 1880, 608.5, 'dlr' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'South Quay', 1880, 690, 'dlr' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Crossharbour', 1880, 720, 'dlr' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Mudchute', 1880, 750, 'dlr' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Island Gardens', 1880, 780, 'dlr' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Cutty Sark for Maritime Greenwich', 1880, 810, 'dlr' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Greenwich', 1880, 840, 'dlr' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Deptford Bridge', 1880, 870, 'dlr' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Elverson Road', 1880, 900, 'dlr' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Lewisham', 1880, 930, 'dlr' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Stratford International', 1950, 272, 'dlr' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Stratford High Street', 2017.5, 362, 'dlr' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Abbey Road', 2036, 402, 'dlr' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Star Lane', 2036, 510, 'dlr' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'West Silvertown', 2092, 605, 'dlr' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Pontoon Dock', 2132, 635, 'dlr' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'London City Airport', 2172, 665, 'dlr' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'King George V', 2212, 695, 'dlr' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Watford Junction', 531.5, 20, 'og' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Watford High Street', 531.5, 50, 'og' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Bushey', 534, 95, 'og' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Carpenders Park', 534, 131, 'og' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Hatch End', 534, 167, 'og' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Headstone Lane', 534, 203, 'og' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Kilburn High Road', 862, 501.5, 'og' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'South Hampstead', 924, 455, 'og' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Imperial Wharf', 910, 981, 'og' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Clapham Junction', 1098.333, 981, 'og' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Kew Gardens', 401, 875.4, 'district' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Kew Gardens overground', 398, 871.4, 'og' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'South Acton', 510.5, 786.5, 'og' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Acton Central', 540.5, 764, 'og' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Kensal Rise', 748.5, 427, 'og' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Brondesbury Park', 782.5, 401.5, 'og' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Hampstead Heath', 979.5, 270, 'og' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Gospel Oak', 1030, 221, 'og' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Caledonian Road and Barnsbury', 1315, 295, 'og' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Canonbury', 1505, 300, 'og' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Homerton', 1760, 295, 'og' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Hackney Wick', 1840, 295, 'og' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Crouch Hill', 1206, 138, 'og' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Harringay Green Lanes', 1326, 138, 'og' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Leyton Midland Road', 1860, 138, 'og' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Renwick Road', 2280, 433, 'og' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Barking Riverside', 2390, 433, 'og' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Haggerston', 1588.625, 369, 'og' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Hoxton', 1606.625, 393, 'og' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Shoreditch High Street', 1624.625, 417, 'og' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Wapping', 1700, 622.5, 'og' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Rotherhithe', 1700, 652.5, 'og' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Surrey Quays', 1700, 730, 'og' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'New Bermondsey', 1644, 827, 'og' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Queens Road Peckham', 1584, 872, 'og' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Peckham Rye', 1524, 917, 'og' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Denmark Hill', 1440, 946, 'og' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Wandsworth Road', 1180, 946, 'og' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Battersea Park', 1110, 946, 'og' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'New Cross', 1744.67, 818.5, 'og' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'New Cross Gate', 1700, 852, 'og' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Brockley', 1700, 887, 'og' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Honor Oak Park', 1684, 919, 'og' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Forest Hill', 1644, 949, 'og' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Sydenham', 1604, 979, 'og' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Crystal Palace', 1514, 1009, 'og' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Penge West', 1524, 1039, 'og' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Anerley', 1484, 1069, 'og' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Norwood Junction', 1444, 1099, 'og' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'West Croydon', 1404, 1129, 'og' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Enfield Town', 1403, -61.5, 'og' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Bush Hill Park', 1403, -31.5, 'og' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Cheshunt', 1509, -91, 'og' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Theobalds Grove', 1479, -68.5, 'og' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Turkey Street', 1449, -46, 'og' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Southbury', 1419, -23.5, 'og' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Edmonton Green', 1403, 8.5, 'og' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Silver Street', 1403, 31, 'og' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'White Hart Lane', 1403, 53.5, 'og' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Bruce Grove', 1403, 76, 'og' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Stamford Hill', 1527, 189, 'og' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Stoke Newington', 1557, 211.5, 'og' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Rectory Road', 1587, 234, 'og' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'London Fields', 1635, 355, 'og' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Cambridge Heath', 1635, 390, 'og' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Bethnal Green overground', 1615, 478.25, 'og' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Chingford', 1682, 23, 'og' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Highams Park', 1682, 53, 'og' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Wood Street', 1682, 83, 'og' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'St James Street', 1682, 170, 'og' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Clapton', 1682, 210, 'og' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Emerson Park', 2330.25, 149, 'og' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'South Kenton', 547, 357, 'bakerloo' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'North Wembley', 575, 378, 'bakerloo' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Stonebridge Park', 631, 420, 'bakerloo' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Harlesden', 659, 441, 'bakerloo' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Kensal Green', 725, 490.5, 'bakerloo' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'South Kenton overground', 550, 353, 'og' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'North Wembley overground', 578, 374, 'og' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Stonebridge Park overground', 634, 416, 'og' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Harlesden overground', 662, 437, 'og' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Kensal Green overground', 728, 486.5, 'og' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Heathrow Central', 105, 936.5, 'tflrail' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Reading', 0, 480, 'crossrail' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Twyford', 0, 510, 'crossrail' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Maidenhead', 0, 540, 'crossrail' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Taplow', 0, 570, 'crossrail' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Burnham', 0, 600, 'crossrail' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Slough', 0, 630, 'crossrail' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Langley', 0, 660, 'crossrail' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Iver', 36, 723.9, 'crossrail' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'West Drayton', 86, 723.9, 'crossrail' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Hayes and Harlington', 160, 723.9, 'crossrail' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Southall', 200, 723.9, 'tflrail' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Hanwell', 240, 723.9, 'tflrail' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'West Ealing', 294.667, 723.9, 'tflrail' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Acton Main Line', 460, 723.9, 'tflrail' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Abbey Wood', 2353.33, 704, 'crossrail' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Maryland', 2013, 301, 'tflrail' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Ilford', 2137, 208, 'tflrail' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Seven Kings', 2167, 185.5, 'tflrail' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Goodmayes', 2197, 163, 'tflrail' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Chadwell Heath', 2227, 140.5, 'tflrail' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Gidea Park', 2287, 95.5, 'tflrail' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Harold Wood', 2317, 73, 'tflrail' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Brentwood', 2347, 50.5, 'tflrail' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Shenfield', 2377, 28, 'tflrail' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'South Greenford', 224, 554, 'tflrail' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Castle Bar Park', 224, 594, 'tflrail' );
INSERT INTO stations ( name, x, y, line ) VALUES ( 'Drayton Green', 224, 634, 'tflrail' );

DROP PROCEDURE IF EXISTS new_target;

DELIMITER  //
CREATE PROCEDURE new_target()
BEGIN
  INSERT INTO target_station(name) SELECT s.name FROM stations s left outer join target_station ts on s.name = ts.name WHERE ts.name is null order by rand() limit 1;
END //
DELIMITER ;

CREATE VIEW current_target AS SELECT name FROM target_station ORDER BY id DESC LIMIT 1;

DELIMITER  //
CREATE PROCEDURE target_distance(IN curX FLOAT, IN curY FLOAT)
BEGIN
SELECT s.*
FROM
  (SELECT name, DIST, @curRank := @curRank + 1 AS rank
    FROM (SELECT name, MIN(POWER(X - curX, 2) + POWER(Y - curY, 2)) DIST FROM stations GROUP BY name) s,
         (SELECT @curRank := 0) r
ORDER BY DIST) s INNER JOIN current_target t ON s.name = t.name;
END //
DELIMITER ;

CREATE PROCEDURE score_target(IN inPlayerId INT, IN inName VARCHAR(35), IN inTimestamp DATETIME)
BEGIN
  UPDATE target_station SET playerId = inPlayerId, timestamp = inTimestamp WHERE name = inName AND playerId is NULL;
  SELECT ROW_COUNT() INTO @affectedRows;
  UPDATE target_station SET playerId = inPlayerId, timestamp = inTimestamp WHERE name = inName AND timestamp > inTimestamp;

  IF @affectedRows > 0 THEN INSERT INTO target_station(name) SELECT s.name FROM stations s left outer join target_station ts on s.name = ts.name WHERE ts.name is null order by rand() limit 1;
  END IF;
END;

CREATE USER londontubeuser IDENTIFIED BY 'simplepass123';

GRANT SELECT ON stations TO londontubeuser;
GRANT SELECT ON current_target TO londontubeuser;
GRANT EXECUTE ON PROCEDURE new_target TO londontubeuser;
GRANT EXECUTE ON PROCEDURE target_distance TO londontubeuser;
GRANT EXECUTE ON PROCEDURE score_target TO londontubeuser;

CALL new_target();
CALL target_distance(250, 300);
