/*
Database: MariaDB
Language: German
Schema: Shop
*/

create database shop;
grant all privileges on shop.* to 'student'@'%' with grant option;
use shop;

create or replace table shop.anrede
(
    id   int auto_increment comment 'Eindeutiger Identifier des Datensatzes'
        primary key,
    text varchar(32) not null comment 'Text der Anrede / des Prefix',
    constraint anrede_text_uindex
        unique (text)
)
    comment 'Prefix mit welchem der Kunde angesprochen werden soll';

create or replace table shop.artikel_kategorie
(
    id          int auto_increment comment 'Eindeutiger Identifier des Datensatzes'
        primary key,
    bezeichnung varchar(64) not null comment 'Eindeutige Bezeichnung / Name der Kategorie',
    constraint artikel_kategorie_bezeichnung_uindex
        unique (bezeichnung)
)
    comment 'Kategorien der Artikel';

create or replace table shop.bestellstatus
(
    id          int auto_increment comment 'Eindeutiger Identifier des Datensatzes'
        primary key,
    bezeichnung varchar(64) not null comment 'Eindeutige Bezeichnung / Name des Bestellstatus',
    constraint bestellstatus_bezeichnung_uindex
        unique (bezeichnung)
)
    comment 'Status, in welchem sich eine Bestellung befinden kann';

create or replace table shop.kunde
(
    id           int auto_increment comment 'Eindeutiger Identifier des Datensatzes'
        primary key,
    kundennummer varchar(64)  not null comment 'Eindeutige alphanumerische Kundennummer',
    anrede_id    int          not null comment 'ID der Anrede, mit welcher der Kunde angesprochen werden möchte',
    vorname      varchar(128) not null comment 'Vorname des Kunden',
    nachname     varchar(128) not null comment 'Nachname des Kunden',
    strasse      varchar(256) not null comment 'Straße der Kundenanschrift',
    hausnummer   int          not null comment 'Hausnummer der Kundenanschrift',
    postleitzahl int          not null comment 'Postleitzahl der Kundenanschrift',
    ort          varchar(256) not null comment 'Ort der Kundenanschrift',
    constraint kunde_kundennummer_uindex
        unique (kundennummer),
    constraint kunde_anrede_id_fk
        foreign key (anrede_id) references shop.anrede (id)
)
    comment 'Kunden des Shops';

create or replace table shop.bestellung
(
    id               int auto_increment comment 'Eindeutiger Identifier des Datensatzes'
        primary key,
    bestellnummer    varchar(64)                           not null comment 'Eindeutige alphanumerische Bestellnummer',
    kunde_id         int                                   not null comment 'ID des Kunden, der die Bestellung aufgegeben hat',
    bestellstatus_id int                                   not null comment 'ID des Bestellstatus der Bestellung',
    datum            timestamp default current_timestamp() not null comment 'Zeitpunkt der Bestellung',
    vermerk          varchar(1024)                         null comment 'Optionaler Vermerk bei der Bestellung',
    constraint bestellung_bestellnummer_uindex
        unique (bestellnummer),
    constraint bestellung_bestellstatus_id_fk
        foreign key (bestellstatus_id) references shop.bestellstatus (id),
    constraint bestellung_kunde_id_fk
        foreign key (kunde_id) references shop.kunde (id)
)
    comment 'Bestellungen des Shops';

create or replace table shop.mwst_satz
(
    id          int auto_increment comment 'Eindeutiger Identifier des Datensatzes'
        primary key,
    bezeichnung varchar(64) not null comment 'Eindeutige Bezeichnung des Mehrwertsteuersatzes',
    prozentsatz double      not null comment 'Prozentsatz, welcher auf den Nettopreis von Waren und Dienstleistungen angewendet wird',
    constraint mwst_satz_bezeichnung_uindex
        unique (bezeichnung)
)
    comment 'Mehrwersteuersatz';

create or replace table shop.artikel
(
    id                   int auto_increment comment 'Eindeutiger Identifier des Datensatzes'
        primary key,
    artikelnummer        varchar(64)   not null comment 'Eindeutige Alphanumerische Artikelnummer',
    artikel_kategorie_id int           not null comment 'ID der Kategorie, zu welcher der Artikel gehört',
    bezeichnung          varchar(2048) not null comment 'Bezeichnung / Namen des Artikels',
    einkaufspreis        double        not null comment 'Preis, zu welchem der Artikel vom Shop eingekauft wird',
    verkaufspreis        double        not null comment 'Preis, zu welchem der Artikel vom Shop verkauft wird',
    mwst_satz_id         int           not null comment 'ID des Mehrwertsteuer-Satzes, welcher auf diesen Artikel angewendet wird',
    constraint artikel_artikelnummer_uindex
        unique (artikelnummer),
    constraint artikel_artikel_kategorie_id_fk
        foreign key (artikel_kategorie_id) references shop.artikel_kategorie (id),
    constraint artikel_mwst_satz_id_fk
        foreign key (mwst_satz_id) references shop.mwst_satz (id)
)
    comment 'Artikel, welche im Shop verkauft werden können';

create or replace table shop.position
(
    id            int auto_increment comment 'Eindeutiger Identifier des Datensatzes'
        primary key,
    bestellung_id int    not null comment 'ID der Bestellung, welche diese Position beinhaltet',
    artikel_id    int    not null comment 'ID des Artikels, welcher mit dieser Position verkauft wird',
    menge         int    not null comment 'Anzahl, wie oft der Artikel mit dieser Position verkauft wird',
    preis         double not null comment 'Gesamtpreis der Position in Euro',
    rabatt        double null comment 'Rabatt in Euro, welcher bei der Rechnungsstellung auf den Preis der Position angewendet wird',
    constraint position_artikel_id_fk
        foreign key (artikel_id) references shop.artikel (id),
    constraint position_bestellung_id_fk
        foreign key (bestellung_id) references shop.bestellung (id)
)
    comment 'Position (Bestandteil) einer Bestellung';

