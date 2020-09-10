/*
Database: MariaDB
Language: German
Schema: Shop
*/

/* TABLE: SHOP.ANREDE */
INSERT INTO shop.anrede (id, text) VALUES (1, 'Herr');
INSERT INTO shop.anrede (id, text) VALUES (2, 'Frau');
INSERT INTO shop.anrede (id, text) VALUES (3, '');

/* TABLE: SHOP.MWST_SATZ */
INSERT INTO shop.mwst_satz (id, bezeichnung, prozentsatz) VALUES (1, 'Standard', 19);
INSERT INTO shop.mwst_satz (id, bezeichnung, prozentsatz) VALUES (2, 'Ermäßigt', 7);

/* TABLE: SHOP.BESTELLSTATUS */
INSERT INTO shop.bestellstatus (id, bezeichnung) VALUES (1, 'Angenommen');
INSERT INTO shop.bestellstatus (id, bezeichnung) VALUES (2, 'In Bearbeitung');
INSERT INTO shop.bestellstatus (id, bezeichnung) VALUES (3, 'Versand vorbereitet');
INSERT INTO shop.bestellstatus (id, bezeichnung) VALUES (4, 'Versand erfolgt');
INSERT INTO shop.bestellstatus (id, bezeichnung) VALUES (5, 'Fakturiert');
INSERT INTO shop.bestellstatus (id, bezeichnung) VALUES (6, 'Storniert');
