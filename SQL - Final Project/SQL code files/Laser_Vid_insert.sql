USE [Laser Videos];

INSERT INTO films
VALUES 
('Star Wars','30', 'Science Fiction', 'English', 'PG', 'Luke Skywalker joins forces with a Jedi Knight, a cocky pilot, a Wookiee and two droids to save the galaxy from the Empires world-destroying battle station, while also attempting to rescue Princess Leia from the mysterious Darth Vader.'),
('The Seven Samurai', '40', 'Action', 'Japanese', 'PG', 'A poor village under attack by bandits recruits seven unemployed samurai to help them defend themselves.'),
('Rashomon', '40', 'Drama', 'Japanese', 'PG', 'The rape of a bride and the murder of her samurai husband are recalled from the perspectives of a bandit, the bride, the samurais ghost and a woodcutter.'),
('Casablanca','30','Romance','English', 'U', 'A cynical expatriate American cafe owner struggles to decide whether or not to help his former lover and her fugitive husband escape the Nazis in French Morocco.'),
('Raiders of the Lost Ark', '30', 'Action','English', 'PG', 'In 1936, archaeologist and adventurer Indiana Jones is hired by the U.S. government to find the Ark of the Covenant before Adolf Hitlers Nazis can obtain its awesome powers.'),
('The Lives of Others', '30','Drama', 'German', '18', 'In 1984 East Berlin, an agent of the secret police, conducting surveillance on a writer and his lover, finds himself becoming increasingly absorbed by their lives.'),
('Toy Story', '30','Childrens', 'English', 'U', 'Toys come to life in the absence of humans and get up to all kinds of hijinks.'),
('The Shining', '30','Horror', 'English', '18', 'A family heads to an isolated hotel for the winter where a sinister presence influences the father into violence, while his psychic son sees horrific forebodings from both past and future.'),
('The 400 Blows', '40','Drama', 'French', 'PG', 'A young boy, left without attention, delves into a life of petty crime.'),
('Mission Impossible', '30', 'Action','English', '15', 'An American agent, under false suspicion of disloyalty, must discover and expose the real spy without the help of his organization.'),
('Tokyo Story', '40','Drama', 'Japanese', 'U', 'An old couple visit their children and grandchildren in the city, but receive little attention.'),
('Wings of Desire', '40','Drama', 'German', '15', 'An angel tires of his purely ethereal life of merely overseeing the human activity of Berlins residents, and longs for the tangible joys of physical existence when he falls in love with a mortal.'),
('There Will Be Blood', '30','Drama','English', '18', 'A story of family, religion, hatred, oil and madness, focusing on a turn-of-the-century prospector in the early days of the business.'),
('The Seventh Seal', '40','Drama', 'Swedish', 'U', 'A knight returning to Sweden after the Crusades seeks answers about life, death, and the existence of God as he plays chess against the Grim Reaper during the Black Plague.'),
('The Conformist', '40','Drama', 'Italien', '15', 'A weak-willed Italian man becomes a fascist flunky who goes abroad to arrange the assassination of his old teacher, now a political dissident.'),
('Amores Perros', '30','Drama', 'Spanish', '18', 'A horrific car accident connects three stories, each involving characters dealing with loss, regret, and lifes harsh realities, all in the name of love.'),
('The Big Lebowski', '30','Comedy', 'English', '18', 'Jeff, The Dude, Lebowski, mistaken for a millionaire of the same name, seeks restitution for his ruined rug and enlists his bowling buddies to help get it.'),
('Trainspotting', '30','Drama', 'English', '18', 'Renton, deeply immersed in the Edinburgh drug scene, tries to clean up and get out, despite the allure of the drugs and influence of friends.'),
('Iron Man', '30', 'Action', 'English', 'PG', 'Man builds high tech suit of armour, then takes on international terrorism while battling his own ego.'),
('The Avengers', '30', 'Action', 'English', 'PG', 'Group of superheros take on aliens while battling with their own egos.'),
('Forrest Gump', '30', 'Drama', 'English', 'PG', 'Man battles to find his own ego, while inadvertently changing the course of world events.'),
('My Left Foot', '30', 'Drama', 'English', 'PG', 'Disabled man writes a great book and breaks his poor Mammies heart'),
('Minority Report', '30', 'Science Fiction', 'English', '15', 'In a future where a special police unit is able to arrest murderers before they commit their crimes, an officer from that unit is himself accused of a future murder.')

INSERT INTO actor
VALUES
('Mark', 'Hamill'),
('Harrison', 'Ford'),
('Carrie', 'Fisher'),
('Jean-Louis', 'Trintignant'),
('Gunnar', 'Björnstrand'),
('Ewen', 'Bremner'),
('Toshiro', 'Mifune'),
('Lauren', 'Bacall'),
('Paul', 'Dano'),
('Robert', 'Downey Jr'),
('Humphrey', 'Bogart'),
('Jack', 'Nicholson'),
('Tom', 'Hanks'),
('Jean-Pierre', 'Léaud'),
('Tom', 'Cruise'),
('Max', 'von Sydow'),
('Bruno', 'Ganz'),
('Ewan', 'McGregor'),
('Gael García', 'Bernal'),
('Daniel', 'Day Lewis'),
('Chieko', 'Higashiyama'),
('Jeff', 'Bridges'),
('Ulrich', 'Mühe'),
('Karen', 'Allen')

INSERT INTO inventory
VALUES
('1', '2021-01-12'),
('1', '2021-01-13'),
('1', '2021-01-14'),
('2','2021-01-20'),
('2',	'2021-01-21'),
('2',	'2021-01-22'),
('3',	'2021-01-23'),
('3',	'2021-01-24'),
('3', '2021-01-25'),
('3',	'2021-01-26'),
('4',	'2021-01-27'),
('4',	'2021-01-28'),
('4',	'2021-01-29'),
('4',	'2021-01-30'),
('5',	'2021-02-03'),
('5',	'2021-02-04'),
('5',	'2021-02-05'),
('6',	'2021-02-06'),
('6',	'2021-02-07'),
('6',	'2021-02-08'),
('6',	'2021-02-09'),
('7',	'2021-02-12'),
('7',	'2021-02-13'),
('7',	'2021-02-14'),
('8',	'2021-02-18'),
('8',	'2021-02-19'),
('8',	'2021-02-20'),
('9',	'2021-02-21'),
('9',	'2021-02-22'),
('9',	'2021-02-23'),
('10',	'2021-03-02'),
('10',	'2021-03-03'),
('10',	'2021-03-04'),
('11',	'2021-03-05'),
('11',	'2021-03-06'),
('11',	'2021-03-07'),
('11',	'2021-03-08'),
('12',	'2021-03-15'),
('12',	'2021-03-16'),
('12',	'2021-03-17'),
('12',	'2021-03-18'),
('13',	'2021-03-19'),
('13',	'2021-03-20'),
('13',	'2021-03-21'),
('13',	'2021-03-22'),
('14',	'2021-03-23'),
('14',	'2021-03-24'),
('14',	'2021-03-25'),
('15',	'2021-03-26'),
('15',	'2021-03-27'),
('15',	'2021-03-28'),
('16',	'2021-03-29'),
('16',	'2021-03-30'),
('16',	'2021-03-31'),
('16',	'2021-04-01')

INSERT INTO customers
VALUES
('Anna',	'Hill',	'anna.hill@sakilacustomer.org',	'(073) 5701859', CURRENT_TIMESTAMP),
('Rebecca',	'Scott',	'rebecca.scott@sakilacustomer.org',	'(073) 9796723', CURRENT_TIMESTAMP),
('Virginia',	'Green',	'virginia.green@sakilacustomer.org',	'(073) 5243800', CURRENT_TIMESTAMP),
('Kathleen', 'Adams',	'kathleen.adams@sakilacustomer.org',	'(073) 3410466', CURRENT_TIMESTAMP),
('Pamela',	'Baker',	'pamela.baker@sakilacustomer.org',	'(073) 7312884', CURRENT_TIMESTAMP),
('Martha',	'Gonzalez',	'martha.gonzalez@sakilacustomer.org',	'(08) 3952987', CURRENT_TIMESTAMP),
('Debra',	'Nelson',	'debra.nelson@sakilacustomer.org',	'(08) 3553764', CURRENT_TIMESTAMP),
('Amanda',	'Carter',	'amanda.carter@sakilacustomer.org',	'(08) 1052751', CURRENT_TIMESTAMP),
('Stephanie',	'Mitchell',	'stephanie.mitchell@sakilacustomer.org',	'(08) 4740043', CURRENT_TIMESTAMP),
('Carolyn',	'Perez',	'carolyn.perez@sakilacustomer.org',	'(08) 5040497', CURRENT_TIMESTAMP),
('Christine',	'Roberts',	'christine.roberts@sakilacustomer.org',	'(070) 1157299', CURRENT_TIMESTAMP),
('Marie',	'Turner',	'marie.turner@sakilacustomer.org',	'(070) 2625016', CURRENT_TIMESTAMP),
('Janet',	'Phillips',	'janet.phillips@sakilacustomer.org',	'(070) 9807443', CURRENT_TIMESTAMP),
('Catherine',	'Campbell',	'catherine.campbell@sakilacustomer.org',	'(070) 7052177', CURRENT_TIMESTAMP),
('Frances',	'Parker',	'frances.parker@sakilacustomer.org',	'(070) 6748152', CURRENT_TIMESTAMP),
('Ann',	'Evans',	'ann.evans@sakilacustomer.org',	'(091) 1390145', CURRENT_TIMESTAMP),
('Joyce',	'Edwards',	'joyce.edwards@sakilacustomer.org',	'(091) 9424061', CURRENT_TIMESTAMP),
('Diane',	'Collins',	'diane.collins@sakilacustomer.org',	'(091) 8673276', CURRENT_TIMESTAMP),
('Alice',	'Stewart',	'alice.stewart@sakilacustomer.org',	'(091) 9710605', CURRENT_TIMESTAMP),
('Julie',	'Sanchez',	'julie.sanchez@sakilacustomer.org',	'(091) 1323878', CURRENT_TIMESTAMP)

INSERT INTO staff
VALUES
('Anne',	'Powell',	'anne.powell@sakilacustomer.org', '13 Grange Gardens, Cahir', '(071) 9016424', '2020-10-10'),
('Jacqueline',	'Long',	'jacqueline.long@sakilacustomer.org', '44 Cherry Lane, Clonmel', '(08) 9576138', '2020-03-14'),
('William',	'Patterson',	'william.patterson@sakilacustomer.org', '12 Eiger Lane, Timbuktu', '(070) 7730816', '2019-08-11'),
('Bonnie',	'Hughes',	'bonnie.hughes@sakilacustomer.org', '105 Esmondale Estate, Naas', '(052) 4251832', '2020-06-05'),
('Julia',	'Flores',	'julia.flores@sakilacustomer.org', '18 Gardenia Drive, Roseton', '(055) 9134432', '2018-11-05')

INSERT INTO staff_id_card
VALUES
('1','Anne Powell', '2022-09-09', '2022-09-10'),
('2','Jacqueline Long', '2022-10-02', '2022-10-03'),
('3', 'William Patterson', '2022-09-11', '2022-09-12'),
('4', 'Bonnie Hughes', '2022-11-27', '2022-11-28'),
('5', 'Julia Flores', '2022-12-01', '2022-12-02')

INSERT INTO rentals
VALUES
('4', '2021-04-03', '2021-04-05', '5', '2'),
('15', '2021-04-10', '2021-04-11', '7', '3'),
('11', '2021-04-13', '2021-04-15', '2', '3'),
('10', '2021-04-20', '2021-04-21', '10', '1'),
('7', '2021-04-22', '2021-04-25', '11', '5'),
('20', '2021-04-27', '2021-04-29', '12', '4')

INSERT INTO rentals
VALUES
('4', '2021-04-03', '2021-04-05', '5', '2'),
('15', '2021-04-10', '2021-04-11', '7', '3'),
('11', '2021-04-13', '2021-04-15', '2', '3'),
('10', '2021-04-20', '2021-04-21', '10', '1'),
('7', '2021-04-22', '2021-04-25', '11', '5')

INSERT INTO rentals
VALUES
('4','2021-05-05','2021-05-06','5','2'),
('11','2021-05-07',	'2021-05-08', '7','3'),
('15','2021-05-08', '2021-05-09','2','3'),
('10','2021-05-09','2021-05-10', '10','1'),
('7','2021-05-10','2021-05-11', '11','5'),
('20','2021-05-11','2021-05-12','5','2'),
('4','2021-05-12','2021-05-13', '7','3'),
('11','2021-05-13','2021-05-14', '2','3'),
('15','2021-05-14',	'2021-05-15', '10','1'),
('10','2021-05-15',	'2021-05-16', '11','5'),
('7','2021-05-16','2021-05-17', '5','2'),
('20','2021-05-17','2021-05-18', '7','3'),
('4','2021-05-18', '2021-05-19', '2','3')


INSERT INTO payment
VALUES
('5', '2', '13', '40', '2021-04-03'),
('7', '3', '14', '40', '2021-04-10'),
('2', '3', '15',  '40', '2021-04-13'),
('10', '1', '16', '30', '2021-04-21'),
('11', '5', '17', '30', '2021-04-22'),
('12', '4', '18', '30', '2021-04-27')

INSERT INTO payment
VALUES
('4', '1', '20', '30', '2021-05-05'),
('5', '2', '21', '40', '2021-05-08'),
('7', '3', '22', '40', '2021-05-09'),
('2', '3', '23',  '40', '2021-05-10'),
('10', '1', '24', '30', '2021-05-11'),
('11', '5', '25', '30', '2021-05-12'),
('4', '1', '26', '30', '2021-05-13'),
('5', '2', '27', '40', '2021-05-14'),
('7', '3', '28', '40', '2021-05-15'),
('2', '3', '29',  '40', '2021-05-16'),
('10', '1', '30', '30', '2021-05-17'),
('11', '5', '31', '30', '2021-05-18'),
('4', '1', '32', '30', '2021-05-19')

INSERT INTO film_actor
VALUES
('1', '1'),
('1', '2'),
('1', '3'),
('2', '7'),
('3', '7'),
('4', '8'),
('4', '11'),
('5', '2'),
('5', '24'),
('6', '23'),
('7', '13'),
('8', '12'),
('9', '14'),
('10', '15'),
('11', '21'),
('12', '17'),
('13', '20'),
('14', '5'),
('14', '16'),
('15', '4'),
('16', '19'),
('17', '22'),
('18', '18'),
('19', '10'),
('20', '10'),
('21', '13'),
('22', '20'),
('23', '15'),
('23', '16')