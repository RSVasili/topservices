INSERT INTO "service_groups"
---------------------------------
("id",    "groups_name" ) VALUES
---------------------------------
(1   , 'home_and_office' ),
(2   , 'transport' ),
(3   , 'business' ),
(4   , 'education' ),
(5   , 'ceremony' ),
(6   , 'relaxation' ),
(7   , 'lease' ),
(8   , 'consumer_services' );
--(9   , 'Бытовые услуги' ),
--(10   , 'Услуги по организации праздников' ),
SELECT setval('service_groups_id_seq', 8);
--SELECT setval('author_id_seq', (SELECT max("id") FROM "author"));

INSERT INTO "group_directions"
-----------------------------------------------
("id", "direction_name","service_groups_id" ) VALUES
-----------------------------------------------
(1   , 'building ', 1 ),
(2   , 'repair', 1 ),
(3   , 'designing', 1 ),
(4   , 'furniture', 1 ),
(5   , 'cargo_transportation', 2 ),
(6   , 'passenger_traffic', 2 ),
(7   , 'auto_repairs', 2 ),
(8   , 'financial', 3 ),
(9   , 'juristic', 3 ),
(10  , 'it_services', 3 ),
(11  , 'coaching', 4 ),
(12  , 'course', 4 ),
(13  , 'assistance_student', 4 ),
(14  , 'festivity', 5 ),
(15  , 'funeral', 5 ),
(16  , 'official', 5 ),
(17  , 'recreation', 6 ),
(18  , 'touring', 6 ),
(19  , 'quarters',7 ),
(20  , 'transport',7 ),
(21  , 'instrument', 7 ),
(22  , 'consumer_electronics', 7 ),
(23  , 'repair', 8 ),
(24  , 'cleaning', 8 ),
(25  , 'societal', 8 );
--(14  , 'Ремонт фото\видео аппаратуры' ),
--(15  , 'Ремонт мобильной техники' ),
--(16  , 'Уборка помещений' ),
--(17  , 'Услуги грузчиков' ),
--(18  , 'Прочая помощь по дому' ),
--(20  , 'Услуги няни\присмотр за нуждающимися' ),
--(22  , 'Оформление помещений' ),
--(23  , 'Проведение праздников' ),
--(24  , 'Транспорт на праздник' ),
SELECT setval('group_directions_id_seq', 25);

INSERT INTO "category_directions"
-----------------------------------
("id",    "category_name", "group_directions_id" ) VALUES
-----------------------------------
(1   , 'buildings_constructions', 1 ),
(2   , 'landscape', 1 ),
(3   , 'outside', 2 ),
(4   , 'inside', 2 ),
(5   , 'plumbing', 2 ),
(6   , 'electricity', 2 ),
(7   , 'architecture', 3 ),
(8   , 'interior', 3 ),
(9   , 'furniture', 3 ),
(10  , 'cushioned_furniture', 4 ),
(11  , 'cabinet_furniture', 4 ),
(12  , 'office_furniture', 4 ),
(13  , 'light_tonnage', 5 ),
(14  , 'large_tonnage', 5 ),
(15  , 'group', 6 ),
(16  , 'private', 6 ),
(17  , 'freight_transport', 7 ),
(18  , 'passenger_transport', 7 ),
(19  , 'agricultural_machinery', 7 ),
(20  , 'bookkeeping', 8 ),
(21  , 'marketing', 8 ),
(22  , 'lending', 8 ),
(23  , 'criminal', 9 ),
(24  , 'administrative', 9 ),
(25  , 'business', 9 ),
(26  , 'development', 10 ),
(27  , 'network', 10 ),
(28  , 'humanitarian', 11 ),
(29  , 'exact_sciences', 11 ),
(30  , 'creative', 11 ),
(31  , 'sport', 11 ),
(32  , 'professional', 12 ),
(33  , 'educational', 12 ),
(34  , 'personal', 12 ),
(35  , 'school', 13),
(36  , 'student', 13),
(37  , 'event_holding', 14),
(38  , 'performances', 14),
(39  , 'decor', 14),
(40  , 'cortege', 14),
(41  , 'premises', 14),
(42  , 'transportation', 15),
(43  , 'paraphernalia', 15),
(44  , 'communication', 16),
(45  , 'escort', 16),
(46  , 'athletic', 17),
(47  , 'intelligence', 17),
(48  , 'in-republican', 18),
(49  , 'international', 18),
(51  , 'apartments', 19),
(52  , 'houses', 19),
(53  , 'garages_boxes', 19),
(54  , 'manufacturing', 19),
(55  , 'car', 20),
(56  , 'garden', 20),
(57  , 'manual', 21),
(58  , 'electric', 21),
(59  , 'tv_computers', 22),
(60  , 'consumer', 22),
(61  , 'photo_video', 22),
(62  , 'small_household_appliances', 23),
(63  , 'large_household_appliances', 23),
(64  , 'computer_laptops', 23),
(65  , 'photo_video_equipment', 23),
(66  , 'rooms', 24),
(67  , 'territories', 24),
(68  , 'childcare', 25),
(69  , 'care_for_the_needy', 25),
(70  , 'delivery', 25);
SELECT setval('category_directions_id_seq', 70);

-- INSERT INTO "products_services"
-- -----------------------------------
-- ("id",    "product_name", "types_of_services_id" ) VALUES
-- -----------------------------------
-- (1   , 'Гарнитуры', NULL),
-- (2   , 'Диваны,кресла, пуфики', NULL ),
-- (3   , 'Стулья и прочее', NULL ),
-- (4   , 'Мебель для кухни', NULL ),
-- (5   , 'Мебель для спальни', NULL ),
-- (6   , 'Мебель для гардеробных комнат', NULL ),
-- (7   , 'Мебель для детских комнат', NULL ),
-- (8   , 'Гостинная мебель', NULL ),
-- (9   , 'Мебель для прихожей', NULL ),
-- (10  , 'Мебель для ванных комнат', NULL ),
-- (11  , 'Шкафы, комоды, тумбы', NULL ),
-- (12  , 'Офисная мебель', NULL ),
-- (13  , 'Алгебра и геометрия', 36 ),
-- (14  , 'Физика', 36 ),
-- (15  , 'Химия', 36 ),
-- (16  , 'Русский язык и литература', 37 ),
-- (17  , 'Иностранные языки', 37 ),
-- (18  , 'История и георгафия', 37 ),
-- (19  , 'Музыка и пение', 38 ),
-- (20  , 'Черчение и рисование', 38 ),
-- (21  , 'Спорт и туризм', 38 ),
-- (22  , 'Бизнес стратегия', 39 ),
-- (23  , 'Бухгалтерия и экономика', 39 ),
-- (24  , 'Навыки продаж', 39 ),
-- (25  , 'Java разработка', 40 ),
-- (26  , 'WEB разработка', 40 ),
-- (27  , 'QA тестирование', 40 ),
-- (28  , 'Кулинарния', 41 ),
-- (29  , 'Фитнес', 41 ),
-- (30  , 'Молодые родители', 41 );
-- SELECT setval('products_services_id_seq', 30);

-- INSERT INTO "types_of_services_vs_products_services"
-- -------------------------------
-- ("types_of_services_id", "products_services_id") VALUES
-- -------------------------------
-- (13                    , 1         ),
-- (13                    , 2         ),
-- (13                    , 3         ),
-- (14                    , 1         ),
-- (14                    , 2         ),
-- (14                    , 3         ),
-- (16                    , 4         ),
-- (16                    , 5         ),
-- (16                    , 6         ),
-- (16                    , 7         ),
-- (16                    , 8         ),
-- (16                    , 9         ),
-- (16                    , 10        ),
-- (16                    , 11        ),
-- (16                    , 12        ),
-- (17                    , 4         ),
-- (17                    , 5         ),
-- (17                    , 6         ),
-- (17                    , 7         ),
-- (17                    , 8         ),
-- (17                    , 9         ),
-- (17                    , 10        ),
-- (17                    , 11        ),
-- (17                    , 12        );

--INSERT INTO "user"
-----------------------------------
--("id",    "login",  "password", "role") VALUES
-----------------------------------
--(1   , 'Wassart' ,  'Wassart', 0),
--(2   , 'Dast_reih', 'Dast_reih',4),
--(3   , 'Smiles',    'Smiles',   4),
--(4   , 'Daydream',  'Daydream', 4);
----(9   , 'Бытовые услуги' ),
----(10   , 'Услуги по организации праздников' ),
--SELECT setval('user_id_seq', 4);
----SELECT setval('author_id_seq', (SELECT max("id") FROM "author"));

/*
INSERT INTO "task"
------------------------------------------------------------
("id", "title", "category_id", "date"               ) VALUES
------------------------------------------------------------
(  20, 'Abc'  , 4            , '2018-12-07 14:30:00'),
(  21, 'Def'  , NULL         , '2018-12-06 10:55:00'),
(  22, 'Ghi'  , 9            , '2018-12-08 16:30:00');
*/
