-- -------------------------------
-- Database name : clubs_efrei  --
-- Author : Pablo Sanchez       --
-- -------------------------------

DROP DATABASE IF EXISTS clubs_efrei;
CREATE DATABASE clubs_efrei;
USE clubs_efrei;
-- Tables destructions

drop table if exists CLUB ;
drop table if exists  MEMBERS ;
drop table if exists  CLUBRESPONSIBILITY ;
drop table if exists  COMMITTEE ;
drop table if exists  TASK ;
drop table if exists COMMITTEERESPONSIBILITY ;
drop table if exists ACTIVITYREPORT ;
drop table if exists AWARD ;
drop table if exists EXPENSES ;
drop table if exists SANCTION ;
drop table if exists EVENTS ;
drop table if exists BUDGET ;
drop table if exists HAVE ;
drop table if exists DELIVERS_CLUB ;
drop table if exists HOLDS ;
drop table if exists MADE_OF ;
drop table if exists USES ;
drop table if exists HAS ;
drop table if exists GENERATE ;
drop table if exists PERFORMS ;
drop table if exists TAKE_PART ;
drop table if exists WINS ;
drop table if exists MODIFY ;
drop table if exists SPENDS ;
drop table if exists DELIVERS_COMMITTEE ;
drop table if exists IS_PUNISHED ;

-- Tables creation

CREATE TABLE Club(
   ClubID VARCHAR(50),
   CreationDate DATE,
   Name VARCHAR(50),
   Type VARCHAR(50),
   Description VARCHAR(50),
   PRIMARY KEY(ClubID)
)engine = InnoDB;

CREATE TABLE Members(
   EfreiStudentNb INT,
   FirstName VARCHAR(50),
   LastName VARCHAR(50),
   Class VARCHAR(50),
   Level VARCHAR(50),
   DateOfBirth DATE,
   Gender VARCHAR(50),
   PRIMARY KEY(EfreiStudentNb)
)engine = InnoDB;

CREATE TABLE ClubResponsibility(
   ClubResponsibilityID VARCHAR(50),
   Role VARCHAR(50),
   PRIMARY KEY(ClubResponsibilityID)
)engine = InnoDB;

CREATE TABLE Committee(
   CommitteeID VARCHAR(50),
   CreationDate DATETIME,
   EndDate DATETIME,
   Schedule DATE,
   IncomeAllocation DECIMAL(7,2),
   PRIMARY KEY(CommitteeID)
)engine = InnoDB;

CREATE TABLE Task(
   TaskID VARCHAR(50),
   Description VARCHAR(50),
   PRIMARY KEY(TaskID)
)engine = InnoDB;

CREATE TABLE CommitteeResponsibility(
   CommitteeResponsibilityID VARCHAR(50),
   Role VARCHAR(50),
   PRIMARY KEY(CommitteeResponsibilityID)
)engine = InnoDB;

CREATE TABLE ActivityReport(
   ActivityReportID VARCHAR(50),
   ReportYear DATE,
   Status VARCHAR(50),
   ModificationDate DATETIME,
   PRIMARY KEY(ActivityReportID)
)engine = InnoDB;

CREATE TABLE Award(
   AwardID VARCHAR(50),
   Source VARCHAR(50),
   Name VARCHAR(50),
   PRIMARY KEY(AwardID)
)engine = InnoDB;

CREATE TABLE Expenses(
   ExpensesID VARCHAR(50),
   Amount DECIMAL(7,2),
   PRIMARY KEY(ExpensesID)
)engine = InnoDB;

CREATE TABLE Sanction(
   SanctionID VARCHAR(50),
   Description VARCHAR(50),
   PRIMARY KEY(SanctionID)
)engine = InnoDB;

CREATE TABLE Events(
   EventsID VARCHAR(50),
   Name VARCHAR(50),
   StartDateAndTime DATETIME,
   EndDateAndTime DATETIME,
   Type VARCHAR(50),
   CommitteeID VARCHAR(50),
   PRIMARY KEY(EventsID),
   UNIQUE(CommitteeID),
   FOREIGN KEY(CommitteeID) REFERENCES Committee(CommitteeID)
)engine = InnoDB;

CREATE TABLE Budget(
   BudgetID VARCHAR(50),
   Amount DECIMAL(7,2) NOT NULL,
   EventsID VARCHAR(50) NOT NULL,
   PRIMARY KEY(BudgetID),
   UNIQUE(EventsID),
   FOREIGN KEY(EventsID) REFERENCES Events(EventsID)
)engine = InnoDB;

CREATE TABLE Have(
   EfreiStudentNb INT,
   ClubResponsibilityID VARCHAR(50),
   RoleYear DATE NOT NULL,
   PRIMARY KEY(EfreiStudentNb, ClubResponsibilityID),
   FOREIGN KEY(EfreiStudentNb) REFERENCES Members(EfreiStudentNb),
   FOREIGN KEY(ClubResponsibilityID) REFERENCES ClubResponsibility(ClubResponsibilityID)
)engine = InnoDB;

CREATE TABLE Delivers_club(
   ClubID VARCHAR(50),
   ClubResponsibilityID VARCHAR(50),
   PRIMARY KEY(ClubID, ClubResponsibilityID),
   FOREIGN KEY(ClubID) REFERENCES Club(ClubID),
   FOREIGN KEY(ClubResponsibilityID) REFERENCES ClubResponsibility(ClubResponsibilityID)
)engine = InnoDB;

CREATE TABLE Holds(
   ClubID VARCHAR(50),
   EventsID VARCHAR(50),
   PRIMARY KEY(ClubID, EventsID),
   FOREIGN KEY(ClubID) REFERENCES Club(ClubID),
   FOREIGN KEY(EventsID) REFERENCES Events(EventsID)
)engine = InnoDB;

CREATE TABLE Made_of(
   EfreiStudentNb INT,
   CommitteeID VARCHAR(50),
   PRIMARY KEY(EfreiStudentNb, CommitteeID),
   FOREIGN KEY(EfreiStudentNb) REFERENCES Members(EfreiStudentNb),
   FOREIGN KEY(CommitteeID) REFERENCES Committee(CommitteeID)
)engine = InnoDB;

CREATE TABLE Uses(
   BudgetID VARCHAR(50),
   CommitteeID VARCHAR(50) NOT NULL,
   PRIMARY KEY(BudgetID),
   UNIQUE(CommitteeID),
   FOREIGN KEY(BudgetID) REFERENCES Budget(BudgetID),
   FOREIGN KEY(CommitteeID) REFERENCES Committee(CommitteeID)
)engine = InnoDB;

CREATE TABLE has(
   TaskID VARCHAR(50),
   ExpensesID VARCHAR(50),
   PRIMARY KEY(TaskID, ExpensesID),
   FOREIGN KEY(TaskID) REFERENCES Task(TaskID),
   FOREIGN KEY(ExpensesID) REFERENCES Expenses(ExpensesID)
)engine = InnoDB;

CREATE TABLE Generate(
   EfreiStudentNb INT,
   CommitteeResponsibilityID VARCHAR(50),
   PRIMARY KEY(EfreiStudentNb, CommitteeResponsibilityID),
   FOREIGN KEY(EfreiStudentNb) REFERENCES Members(EfreiStudentNb),
   FOREIGN KEY(CommitteeResponsibilityID) REFERENCES CommitteeResponsibility(CommitteeResponsibilityID)
)engine = InnoDB;

CREATE TABLE Performs(
   TaskID VARCHAR(50),
   CommitteeResponsibilityID VARCHAR(50),
   PRIMARY KEY(TaskID, CommitteeResponsibilityID),
   FOREIGN KEY(TaskID) REFERENCES Task(TaskID),
   FOREIGN KEY(CommitteeResponsibilityID) REFERENCES CommitteeResponsibility(CommitteeResponsibilityID)
)engine = InnoDB;

CREATE TABLE Take_part(
   ClubID VARCHAR(50),
   EfreiStudentNb INT,
   PRIMARY KEY(ClubID, EfreiStudentNb),
   FOREIGN KEY(ClubID) REFERENCES Club(ClubID),
   FOREIGN KEY(EfreiStudentNb) REFERENCES Members(EfreiStudentNb)
)engine = InnoDB;

CREATE TABLE Wins(
   ClubID VARCHAR(50),
   AwardID VARCHAR(50),
   PriceYear DATE NOT NULL,
   PRIMARY KEY(ClubID, AwardID),
   FOREIGN KEY(ClubID) REFERENCES Club(ClubID),
   FOREIGN KEY(AwardID) REFERENCES Award(AwardID)
)engine = InnoDB;

CREATE TABLE Modify(
   ClubResponsibilityID_n_n VARCHAR(50),
   ActivityReportID VARCHAR(50),
   PresidentModifications VARCHAR(50),
   OfficersSignature VARCHAR(50),
   PRIMARY KEY(ClubResponsibilityID_n_n, ActivityReportID),
   FOREIGN KEY(ClubResponsibilityID_n_n) REFERENCES ClubResponsibility(ClubResponsibilityID),
   FOREIGN KEY(ActivityReportID) REFERENCES ActivityReport(ActivityReportID)
)engine = InnoDB;

CREATE TABLE Spends(
   CommitteeID VARCHAR(50),
   ExpensesID VARCHAR(50),
   PRIMARY KEY(CommitteeID, ExpensesID),
   FOREIGN KEY(CommitteeID) REFERENCES Committee(CommitteeID),
   FOREIGN KEY(ExpensesID) REFERENCES Expenses(ExpensesID)
)engine = InnoDB;

CREATE TABLE Delivers_committee(
   CommitteeID VARCHAR(50),
   CommitteeResponsibilityID VARCHAR(50),
   PRIMARY KEY(CommitteeID, CommitteeResponsibilityID),
   FOREIGN KEY(CommitteeID) REFERENCES Committee(CommitteeID),
   FOREIGN KEY(CommitteeResponsibilityID) REFERENCES CommitteeResponsibility(CommitteeResponsibilityID)
)engine = InnoDB;

CREATE TABLE is_punished(
   ClubID VARCHAR(50),
   SanctionID VARCHAR(50),
   SanctionYear DATE NOT NULL,
   PRIMARY KEY(ClubID, SanctionID),
   FOREIGN KEY(ClubID) REFERENCES Club(ClubID),
   FOREIGN KEY(SanctionID) REFERENCES Sanction(SanctionID)
)engine = InnoDB;


-- Fill tables 

INSERT INTO `club` (`ClubID`, `CreationDate`, `Name`, `Type`, `Description`) VALUES 
('1', '2012-08-24', 'BDS', 'sports', 'Association for sports practice and competitions'), 
('2', '2015-05-27', 'SEPEFREI', 'entrepreneurial', 'Efrei\'s junior company '), 
('3', '2011-03-17', 'Live Music', 'cultural', 'Association for live music practice and concerts'), 
('4', '2011-09-04', 'Video Games Efrei', 'sports', 'Association for e-sports practice and competitions'), 
('5', '2013-08-25', 'ICE Efrei', 'technical', 'Association for robot building and tech testing ');

INSERT INTO `sanction` (`SanctionID`, `Description`) VALUES 
('1', 'Misbehavior in events'), 
('2', 'Financial issue '), 
('3', 'Copyrights issue');

INSERT INTO `is_punished` (`ClubID`, `SanctionID`, `SanctionYear`) VALUES 
('1', '1', '2018-07-31'), 
('2', '2', '2021-07-31');

INSERT INTO `committee` (`CommitteeID`, `CreationDate`, `EndDate`, `Schedule`, `IncomeAllocation`) VALUES 
('1', '2021-12-08 00:00:00', '2022-01-15 00:00:00', '2022-01-08', '4000.00'), 
('2', '2021-09-23 00:00:00', '2021-10-30 00:00:00', '2021-10-23', NULL), 
('3', '2022-02-12 00:00:00', '2022-03-19 00:00:00', '2022-03-12', '8000.00'), 
('4', '2022-03-01 00:00:00', '2022-04-08 00:00:00', '2022-04-01', '12000.00'), 
('5', '2021-08-23 00:00:00', '2021-09-30 00:00:00', '2021-09-23', NULL), 
('6', '2021-12-14 00:00:00', '2022-01-21 00:00:00', '2021-01-14', NULL),
('7', '2021-09-01 12:00:00', '2021-10-10 12:00:00', '2021-10-01', '15000.00'),
('8', '2022-03-29 12:00:00', '2022-04-22 21:00:00', '2022-04-17', NULL),
('9', '2022-04-02 12:00:00', '2022-04-23 10:00:00', '2022-04-17', '450.00');

INSERT INTO `award` (`AwardID`, `Source`, `Name`) VALUES 
('1', 'EFREI Administration', 'Most influence '), 
('2', 'EFREI Students', 'Students choice Award ');

INSERT INTO `members` (`EfreiStudentNb`, `FirstName`, `LastName`, `Class`, `Level`, `DateOfBirth`, `Gender`) VALUES 
('20170001', 'Chappell', 'Rouze', 'INT', 'M2', '1999-04-13', 'F'), 
('20170002', 'Faustin', 'Trépanier', 'B', 'M1', '1998-09-27', 'M'), 
('20170003', 'Gradasso', 'Pouchard', 'A', 'M2', '1999-07-14', 'M'), 
('20170004', 'Voleta', 'Lamour', 'INT', 'M2', '1999-04-27', 'F'), 
('20170005', 'Raoul', 'Busson', 'A', 'M1', '1998-03-07', 'M'), 
('20170006', 'Luc', 'Barjavel', 'B', 'M2', '1999-12-15', 'M'), 
('20170007', 'Joseph', 'Caouette', 'INT', 'M2', '1999-02-09', 'M'), 
('20170008', 'Pascal', 'Roy', 'INT', 'M2', '1999-01-20', 'M'), 
('20170009', 'Barry', 'Echeverri', 'A', 'M2', '1999-06-10', 'M'), 
('20170010', 'Ansel', 'Perillard', 'INT', 'M2', '1999-09-22', 'M'), 
('20170011', 'Aymon', 'Petit', 'B', 'M2', '1999-07-21', 'M'), 
('20170012', 'Christiane', 'Boulé', 'B', 'M2', '1999-03-16', 'F'), 
('20170013', 'Alphonse', 'Primeau', 'A', 'M2', '1999-02-17', 'M'), 
('20170014', 'Huette', 'Bonneville', 'B', 'M2', '1999-05-19', 'F'), 
('20170015', 'Valérie', 'Racicot', 'A', 'M2', '1999-07-07', 'F'),
('20180001', 'Francis', 'Neufville', 'INT', 'M1', '2000-06-21', 'M'), 
('20180002', 'Jules', 'Caisse', 'A', 'M1', '2000-02-14', 'M'), 
('20180003', 'Joy', 'Marcheterre', 'INT', 'M1', '2000-10-12', 'F'), 
('20180004', 'Melisande', 'Masson', 'B', 'L3', '1999-09-17', 'F'), 
('20180005', 'Hélène', 'Salois', 'B', 'M1', '2000-12-20', 'F'), 
('20180006', 'Desire', 'Fluet', 'INT', 'M1', '2000-03-14', 'F'), 
('20180007', 'Moore', 'Mailloux', 'INT', 'M1', '2000-03-09', 'M'), 
('20180008', 'Frédéric', 'Dodier', 'INT', 'M1', '2000-10-19', 'M'), 
('20180009', 'Alain', 'David', 'A', 'M1', '2000-10-12', 'M'), 
('20180010', 'Varden', 'Bordeleau', 'B', 'L3', '2000-11-07', 'M'), 
('20180011', 'Laurent', 'Chassé', 'B', 'M1', '2000-08-02', 'M'), 
('20180012', 'Saber', 'Massé', 'A', 'M1', '2000-04-18', 'M'), 
('20180013', 'Tabor', 'Arnoux', 'A', 'M1', '2000-01-14', 'M'), 
('20180014', 'Gilles', 'Talon', 'B', 'M1', '2000-09-14', 'M'), 
('20180015', 'Corinne', 'Gougeon', 'A', 'M1', '2000-10-04', 'F'),
('20190001', 'Ancelina', 'Ruel', 'INT', 'L3', '2001-04-24', 'F'), 
('20190002', 'Cendrillon', 'Margand', 'INT', 'L3', '2001-06-15', 'F'), 
('20190003', 'Aloin', 'Fongemie', 'B', 'L3', '2001-02-13', 'M'), 
('20190004', 'Inès', 'Longpré', 'B', 'L3', '2001-01-09', 'F'), 
('20190005', 'Porter', 'Barrette', 'B', 'L3', '2001-08-18', 'M'), 
('20190006', 'Gustave', 'Lacasse', 'INT', 'L2', '2001-06-15', 'M'), 
('20190007', 'Xarles', 'Arpin', 'INT', 'L3', '2001-12-13', 'M'), 
('20190008', 'Grégoire', 'Quiron', 'B', 'L3', '2001-01-15', 'M'), 
('20190009', 'Jean', 'Lizotte', 'B', 'L3', '2001-05-25', 'M'), 
('20190010', 'Varden', 'Ruest', 'INT', 'L3', '2001-01-15', 'M'), 
('20190011', 'Hugues', 'Lamontagne', 'A', 'L2', '2001-07-13', 'M'), 
('20190012', 'Jules', 'Champagne', 'A', 'L3', '2001-10-17', 'M'), 
('20190013', 'Fitz', 'Houle', 'A', 'L3', '2001-10-24', 'M'), 
('20190014', 'Benjamin', 'Bernard', 'A', 'L3', '2001-02-13', 'M'), 
('20190015', 'Percy', 'Gendron', 'A', 'L3', '2001-08-15', 'M'),
('20200001', 'Stéphane', 'Grimard', 'INT', 'L2', '2002-04-18', 'M'), 
('20200002', 'Sargent', 'Berger', 'A', 'L2', '2002-07-11', 'M'), 
('20200003', 'Véronique', 'Marquis', 'B', 'L2', '2002-01-08', 'F'), 
('20200004', 'Baptiste', 'Marseau', 'A', 'L2', '2002-07-17', 'M'), 
('20200005', 'Yvon', 'Crête', 'B', 'L2', '2002-09-19', 'M'), 
('20200006', 'Gustave', 'Gilbert', 'A', 'L2', '2002-06-28', 'M'), 
('20200007', 'Antoine', 'Léveillé', 'INT', 'L1', '2002-11-19', 'M'), 
('20200008', 'Marthe', 'Champagne', 'B', 'L2', '2002-12-12', 'F'), 
('20200009', 'René', 'Routhier', 'B', 'L2', '2002-10-09', 'M'), 
('20200010', 'Claude', 'Souplet', 'B', 'L1', '2002-04-22', 'M'), 
('20200011', 'Sophie', 'Perillard', 'INT', 'L2', '2002-08-14', 'F'), 
('20200012', 'Gilbert', 'Boivin', 'INT', 'L2', '2002-11-26', 'M'), 
('20200013', 'Bayard', 'Laderoute', 'A', 'L2', '2002-03-11', 'M'), 
('20200014', 'Constance', 'Huppé', 'B', 'L2', '2002-01-15', 'F'), 
('20200015', 'Marshall', 'Goulet', 'A', 'L2', '2002-05-18', 'M'),
('20210001', 'Yvette', 'Demers', 'B', 'L1', '2003-04-11', 'F'), 
('20210002', 'Henri', 'Melanson', 'B', 'L1', '2003-02-11', 'M'), 
('20210003', 'Adélaïde', 'Tardif', 'A', 'L1', '2003-01-14', 'F'), 
('20210004', 'Franck', 'Bonenfant', 'B', 'L1', '2003-07-11', 'M'), 
('20210005', 'Alexandre', 'Fortier', 'A', 'L1', '2003-10-31', 'M'), 
('20210006', 'Caroline', 'Primeau', 'A', 'L1', '2003-12-12', 'F'), 
('20210007', 'Dexter', 'LeBatelier', 'INT', 'L1', '2003-04-24', 'M'), 
('20210008', 'Honoré', 'Dodier', 'INT', 'L1', '2003-06-19', 'M'), 
('20210009', 'Ansel', 'Vertefeuille', 'B', 'L1', '2003-07-15', 'M'), 
('20210010', 'Ferrau', 'LaCaille', 'INT', 'L1', '2003-08-08', 'M'), 
('20210011', 'Alphonse', 'Devoe', 'A', 'L1', '2003-02-17', 'M'), 
('20210012', 'Albertine', 'LaGrande', 'INT', 'L1', '2003-08-21', 'F'), 
('20210013', 'Germain', 'L\'Heureux', 'B', 'L1', '2003-01-20', 'M'), 
('20210014', 'Brice', 'Melanson', 'A', 'L1', '2003-07-24', 'M'), 
('20210015', 'Gaetane', 'Lalonde', 'INT', 'L1', '2003-09-11', 'F');

INSERT INTO `clubresponsibility` (`ClubResponsibilityID`, `Role`) VALUES 
('1', 'President'), 
('2', 'Vice-president'), 
('3', 'Secretary'), 
('4', 'Treasurer');

INSERT INTO `activityreport` (`ActivityReportID`, `ReportYear`, `Status`, `ModificationDate`) VALUES 
('BDS2021', '2021-09-01', 'missing', NULL), 
('SEP2021', '2021-09-01', 'created', '2021-11-11 18:30:02'), 
('LIVE2021', '2021-09-01', 'created', '2022-02-10 11:30:48'), 
('GAMING2021', '2021-09-01', 'created', '2021-10-16 23:27:22'), 
('ICE2021', '2021-09-01', 'created', '2021-09-22 15:58:02'), 
('BDS2020', '2020-09-01', 'submitted', '2021-08-23 21:03:02'), 
('SEP2020', '2020-09-01', 'submitted', '2021-08-30 02:17:56'), 
('LIVE2020', '2020-09-01', 'submitted', '2021-07-31 22:30:02'), 
('GAMING2020', '2020-09-01', 'signed', '2021-06-10 17:42:18'), 
('ICE2020', '2020-09-01', 'submitted', '2021-07-31 23:03:20'), 
('BDS2019', '2019-09-01', 'submitted', '2020-07-27 18:30:02'), 
('SEP2019', '2019-09-01', 'submitted', '2020-07-31 11:22:45'), 
('LIVE2019', '2019-09-01', 'submitted', '2020-07-25 23:58:40'), 
('GAMING2019', '2019-09-01', 'submitted', '2020-07-30 19:47:26'), 
('ICE2019', '2019-09-01', 'submitted', '2022-07-31 11:56:48');

INSERT INTO `expenses` (`ExpensesID`, `Amount`) VALUES 
('1', '50.00'), 
('2', '1652.00'), 
('3', '10000.00'), 
('4', '600.00'), 
('5', '285.00'), 
('6', '49.99'), 
('7', '75.00'), 
('8', '999.99'), 
('9', '65.99'), 
('10', '9.99'),
('11', '98000.00'),
('12', '780.00'),
('13', '16000.00');

INSERT INTO `committeeresponsibility` (`CommitteeResponsibilityID`, `Role`) VALUES 
('1', 'President'), 
('2', 'Vice-president'), 
('3', 'Sponsorship'), 
('4', 'Treasurer');

INSERT INTO `task` (`TaskID`, `Description`) VALUES 
('1', 'manages the event'), 
('2', 'helps and replaces if needed the president '), 
('3', 'handles event and committee communication'), 
('4', 'manages event\'s budget'),  
('5', 'finds money for the event'), 
('6', 'organizes the event'), 
('7', 'finds a place for the event'),
('8', 'sound system rental'),
('9', 'bus rental');

INSERT INTO `events` (`EventsID`, `Name`, `StartDateAndTime`, `EndDateAndTime`, `Type`, `CommitteeID`) VALUES 
('1', 'Junior Companies Gala Night', '2022-01-08 19:30:00', '2022-01-09 03:00:00', 'party', '1'), 
('2', 'E-Sports Tournament', '2021-10-23 12:30:00', '2021-10-23 18:00:00', 'workshop', '2'), 
('3', 'Music Party 1', '2022-03-12 23:00:00', '2022-03-13 06:00:00', 'party', '3'), 
('4', 'Music Party 2', '2022-04-01 21:30:00', '2022-04-02 01:00:00', 'party', '4'), 
('5', 'BDS Meeting 1', '2021-09-23 14:30:00', '2021-09-23 19:30:00', 'training', '5'), 
('6', 'BDS Meeting 2', '2022-01-14 15:00:00', '2022-01-14 20:00:00', 'training', '6'),
('7', 'WEI', '2021-10-01 20:30:00', '2021-10-03 22:00:00', 'party', '7'),
('8', 'BDS Meeting 3', '2022-04-17 19:30:00', '2022-04-17 23:30:00', 'training', '8'),
('9', 'ICE display', '2022-04-17 12:30:00', '2022-04-21 18:00:00', 'workshop', '9');

INSERT INTO `performs` (`TaskID`, `CommitteeResponsibilityID`) VALUES 
('1', '1'), 
('1', '2'), 
('2', '2'), 
('3', '1'), 
('3', '2'), 
('4', '4'), 
('5', '3'), 
('6', '1'), 
('6', '2'), 
('7', '1'), 
('7', '2');

INSERT INTO `generate` (`EfreiStudentNb`, `CommitteeResponsibilityID`) VALUES 
('20170001', '1'), 
('20170015', '2'), 
('20180002', '3'), 
('20190005', '4'), 
('20170009', '1'), 
('20180008', '2'), 
('20180015', '3'), 
('20190013', '4'), 
('20200005', '1'), 
('20200011', '2'), 
('20200013', '3'), 
('20210010', '4'), 
('20170002', '1'), 
('20190003', '2'), 
('20190004', '3'), 
('20190011', '4'), 
('20200007', '1'), 
('20210002', '2'), 
('20210007', '3'), 
('20210008', '4'), 
('20200006', '1'), 
('20210003', '2'), 
('20200015', '3'), 
('20200007', '4'),
('20210002', '1'),
('20200015', '2'),
('20210008', '3'),
('20210005', '4');

INSERT INTO `made_of` (`EfreiStudentNb`, `CommitteeID`) VALUES 
('20170015', '1'), 
('20190005', '1'), 
('20180002', '1'), 
('20170001', '1'), 
('20180008', '2'), 
('20180015', '2'), 
('20190013', '2'), 
('20170009', '2'), 
('20200005', '3'), 
('20200011', '3'), 
('20210010', '3'), 
('20200013', '3'), 
('20190004', '4'), 
('20190011', '4'), 
('20170002', '4'), 
('20190003', '4'), 
('20200007', '5'), 
('20210002', '5'), 
('20210007', '5'), 
('20210008', '5'), 
('20200006', '6'), 
('20200015', '6'), 
('20210003', '6'), 
('20200007', '6'),
('20210002', '7'),
('20200015', '7'),
('20210008', '7'),
('20210005', '7');


INSERT INTO `delivers_committee` (`CommitteeID`, `CommitteeResponsibilityID`) VALUES 
('1', '1'), 
('1', '2'), 
('1', '3'), 
('1', '4'), 
('2', '1'), 
('2', '2'), 
('2', '3'), 
('2', '4'), 
('3', '1'), 
('3', '2'), 
('3', '3'), 
('3', '4'), 
('4', '1'), 
('4', '2'), 
('4', '3'), 
('4', '4'), 
('5', '1'), 
('5', '2'), 
('5', '3'), 
('5', '4'), 
('6', '1'), 
('6', '2'), 
('6', '3'), 
('6', '4'),
('7', '1'),
('7', '2'),
('7', '3'),
('7', '4');


INSERT INTO `holds` (`ClubID`, `EventsID`) VALUES 
('2', '1'), 
('4', '2'), 
('3', '3'), 
('3', '4'), 
('1', '5'), 
('1', '6'),
('1', '7'),
('3', '7'),
('1', '8'),
('5', '9');

INSERT INTO `wins` (`ClubID`, `AwardID`, `PriceYear`) VALUES 
('3', '1', '2017-06-30'), 
('4', '2', '2017-06-30'), 
('2', '1', '2018-06-29'), 
('2', '2', '2018-06-29'), 
('5', '1', '2019-06-28'), 
('1', '2', '2019-06-28'), 
('4', '1', '2020-06-26'), 
('5', '2', '2020-06-26'), 
('1', '1', '2021-06-25'), 
('3', '2', '2021-06-25');

INSERT INTO `spends` (`CommitteeID`, `ExpensesID`) VALUES 
('1', '1'), 
('4', '2'), 
('4', '3'), 
('1', '4'), 
('3', '5'), 
('3', '6'), 
('1', '7'), 
('3', '8'), 
('3', '9'), 
('4', '10'),
('7', '11'),
('7', '13'),
('7', '12');

INSERT INTO `budget` (`BudgetID`, `Amount`, `EventsID`) VALUES 
('1', '10000.00', '1'), 
('2', '0.00', '2'), 
('3', '9000.00', '3'), 
('4', '12000.00', '4'), 
('5', '0.00', '5'), 
('6', '0.00', '6'),
('7', '78000.00', '7');

INSERT INTO `uses` (`BudgetID`, `CommitteeID`) VALUES 
('1', '1'), 
('3', '3'), 
('4', '4'),
('7', '7');

INSERT INTO `take_part` (`ClubID`, `EfreiStudentNb`) VALUES 
('1', '20200007'), 
('1', '20210002'), 
('1', '20210007'), 
('1', '20210005'), 
('1', '20200006'), 
('1', '20200015'), 
('1', '20210008'), 
('1', '20210003'), 
('1', '20190002'), 
('1', '20210004'),
('2', '20170001'), 
('2', '20180002'), 
('2', '20210013'), 
('2', '20180010'), 
('2', '20170005'), 
('2', '20190005'), 
('2', '20210009'), 
('2', '20200014'), 
('2', '20210007'), 
('2', '20210008'),
('3', '20200003'), 
('3', '20190004'), 
('3', '20200011'), 
('3', '20200013'), 
('3', '20210011'), 
('3', '20210010'), 
('3', '20190011'), 
('3', '20190003'), 
('3', '20170002'), 
('3', '20200005'),
('4', '20180015'), 
('4', '20190012'), 
('4', '20170009'), 
('4', '20190006'), 
('4', '20180008'), 
('4', '20210012'), 
('4', '20190007'), 
('4', '20180011'), 
('4', '20180006'), 
('4', '20190013'),
('5', '20180013'), 
('5', '20180014'), 
('5', '20170015'), 
('5', '20180004'), 
('5', '20180001'), 
('5', '20180003'), 
('5', '20170014'), 
('5', '20190008'), 
('5', '20170004'), 
('5', '20210002');

INSERT INTO `delivers_club` (`ClubID`, `ClubResponsibilityID`) VALUES 
('1', '1'), 
('1', '2'), 
('1', '3'), 
('1', '4'), 
('2', '1'), 
('2', '2'), 
('2', '3'), 
('2', '4'), 
('3', '1'), 
('3', '2'), 
('3', '3'), 
('3', '4'), 
('4', '1'), 
('4', '2'), 
('4', '3'), 
('4', '4'), 
('5', '1'), 
('5', '2'), 
('5', '3'), 
('5', '4');

INSERT INTO `have` (`EfreiStudentNb`, `ClubResponsibilityID`, `RoleYear`) VALUES 
('20200006', '1', '2021-09-01'), 
('20210004', '2', '2021-09-01'), 
('20210002', '3', '2021-09-01'), 
('20210008', '4', '2021-09-01'), 
('20170001', '1', '2021-09-01'), 
('20180002', '2', '2021-09-01'), 
('20200014', '3', '2021-09-01'), 
('20210009', '4', '2021-09-01'), 
('20200003', '1', '2021-09-01'), 
('20190004', '2', '2021-09-01'), 
('20200013', '3', '2021-09-01'), 
('20200011', '4', '2021-09-01'), 
('20190006', '1', '2021-09-01'), 
('20180011', '2', '2021-09-01'), 
('20190012', '3', '2021-09-01'), 
('20180008', '4', '2021-09-01'), 
('20170015', '1', '2021-09-01'), 
('20180004', '2', '2021-09-01'), 
('20200005', '3', '2021-09-01'), 
('20170012', '4', '2021-09-01'),
('20190002', '1', '2020-09-01'), 
('20210002', '2', '2020-09-01'), 
('20210004', '3', '2020-09-01'), 
('20210007', '4', '2020-09-01'), 
('20210008', '1', '2020-09-01'), 
('20200014', '2', '2020-09-01'), 
('20210007', '3', '2020-09-01'), 
('20180010', '4', '2020-09-01'), 
('20190004', '1', '2020-09-01'), 
('20200003', '2', '2020-09-01'), 
('20210010', '3', '2020-09-01'), 
('20200005', '4', '2020-09-01'), 
('20190015', '1', '2020-09-01'), 
('20180006', '2', '2020-09-01'), 
('20190013', '3', '2020-09-01'), 
('20190006', '4', '2020-09-01'), 
('20180001', '1', '2020-09-01'), 
('20180013', '2', '2020-09-01'), 
('20180001', '3', '2020-09-01'), 
('20170014', '4', '2020-09-01'),
('20210003', '1', '2019-09-01'), 
('20190002', '2', '2019-09-01'), 
('20210005', '3', '2019-09-01'), 
('20200007', '4', '2019-09-01'), 
('20170005', '1', '2019-09-01'), 
('20170001', '2', '2019-09-01'), 
('20190010', '3', '2019-09-01'), 
('20190005', '4', '2019-09-01'), 
('20190011', '1', '2019-09-01'), 
('20190003', '2', '2019-09-01'), 
('20170002', '3', '2019-09-01'), 
('20200013', '4', '2019-09-01'), 
('20170009', '1', '2019-09-01'), 
('20190013', '2', '2019-09-01'), 
('20190006', '3', '2019-09-01'), 
('20190012', '4', '2019-09-01'), 
('20170014', '1', '2019-09-01'), 
('20170015', '2', '2019-09-01'), 
('20170004', '3', '2019-09-01'), 
('20180004', '4', '2019-09-01');

INSERT INTO `has` (`TaskID`, `ExpensesID`) VALUES 
('5', '1'), 
('7', '2'), 
('7', '3'), 
('6', '4'), 
('6', '5'), 
('1', '6'), 
('2', '7'), 
('3', '8'), 
('3', '9'), 
('5', '10'),
('8', '13'),
('9', '12');

INSERT INTO `modify` (`ClubResponsibilityID_n_n`, `ActivityReportID`, `PresidentModifications`, `OfficersSignature`) VALUES 
('1', 'BDS2019', 'Y', 'N'), 
('1', 'BDS2020', 'Y', 'N'), 
('1', 'GAMING2019', 'Y', 'N'), 
('1', 'GAMING2020', 'Y', 'N'), 
('1', 'ICE2019', 'Y', 'N'), 
('1', 'ICE2020', 'Y', 'N'), 
('1', 'LIVE2019', 'Y', 'N'), 
('1', 'LIVE2020', 'Y', 'N'), 
('1', 'SEP2019', 'Y', 'N'), 
('1', 'SEP2020', 'Y', 'N'),
('1', 'GAMING2021', 'N', 'N'), 
('1', 'ICE2021', 'N', 'N'), 
('1', 'LIVE2021', 'N', 'N'), 
('1', 'SEP2021', 'N', 'N'),
('2', 'BDS2019', 'N', 'Y'), 
('2', 'BDS2020', 'N', 'Y'), 
('2', 'GAMING2019', 'N', 'Y'), 
('2', 'GAMING2020', 'N', 'Y'), 
('2', 'ICE2019', 'N', 'Y'), 
('2', 'ICE2020', 'N', 'Y'), 
('2', 'LIVE2019', 'N', 'Y'), 
('2', 'LIVE2020', 'N', 'Y'), 
('2', 'SEP2019', 'N', 'Y'), 
('2', 'SEP2020', 'N', 'Y'),
('3', 'BDS2019', 'N', 'Y'), 
('3', 'BDS2020', 'N', 'Y'), 
('3', 'GAMING2019', 'N', 'Y'), 
('3', 'GAMING2020', 'N', 'Y'), 
('3', 'ICE2019', 'N', 'Y'), 
('3', 'ICE2020', 'N', 'Y'), 
('3', 'LIVE2019', 'N', 'Y'), 
('3', 'LIVE2020', 'N', 'Y'), 
('3', 'SEP2019', 'N', 'Y'), 
('3', 'SEP2020', 'N', 'Y'),
('4', 'BDS2019', 'N', 'Y'), 
('4', 'BDS2020', 'N', 'Y'), 
('4', 'GAMING2019', 'N', 'Y'), 
('4', 'GAMING2020', 'N', 'Y'), 
('4', 'ICE2019', 'N', 'Y'), 
('4', 'ICE2020', 'N', 'Y'), 
('4', 'LIVE2019', 'N', 'Y'), 
('4', 'LIVE2020', 'N', 'Y'), 
('4', 'SEP2019', 'N', 'Y'), 
('4', 'SEP2020', 'N', 'Y');



COMMIT;