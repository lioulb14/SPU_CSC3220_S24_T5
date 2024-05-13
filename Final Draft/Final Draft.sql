--
-- File generated with SQLiteStudio v3.4.4 on Sun May 12 21:38:45 2024
--
-- Text encoding used: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: Categorize
CREATE TABLE IF NOT EXISTS Categorize (categorizeID INTEGER PRIMARY KEY AUTOINCREMENT, userId TEXT, description TEXT, created TEXT, updated TEXT, groupingID INTEGER REFERENCES Grouping (groupingID)) STRICT;

-- Table: features
CREATE TABLE IF NOT EXISTS features (featuresId INTEGER PRIMARY KEY AUTOINCREMENT, "Delete" ANY, "quick-copy" ANY, oneclickLogin ANY) STRICT;

-- Table: forCategory
CREATE TABLE IF NOT EXISTS forCategory (categorizeID INTEGER REFERENCES Categorize (categorizeID) NOT NULL, userID INTEGER REFERENCES User (userID) NOT NULL, PRIMARY KEY (categorizeID, userID)) STRICT;

-- Table: ForSetting
CREATE TABLE IF NOT EXISTS ForSetting (settingId INTEGER REFERENCES Settings (settingId) NOT NULL, userID INTEGER REFERENCES User (userID) NOT NULL, PRIMARY KEY (settingId, userID)) STRICT;

-- Table: Foruser
CREATE TABLE IF NOT EXISTS Foruser (userID INTEGER NOT NULL REFERENCES User (userID), passwordId INTEGER REFERENCES Password (passwordId) NOT NULL, PRIMARY KEY (userID, passwordId));

-- Table: Grouping
CREATE TABLE IF NOT EXISTS Grouping (groupingID INTEGER PRIMARY KEY AUTOINCREMENT, favoritCatg TEXT UNIQUE NOT NULL, recentsCatg TEXT NOT NULL UNIQUE) STRICT;

-- Table: Password
CREATE TABLE IF NOT EXISTS Password (passwordId INTEGER PRIMARY KEY AUTOINCREMENT, website TEXT UNIQUE NOT NULL, username TEXT UNIQUE NOT NULL, SavePass TEXT NOT NULL UNIQUE, GeneratePass TEXT UNIQUE NOT NULL, RetrievePass TEXT UNIQUE NOT NULL, featuresID INTEGER REFERENCES features (featuresId)) STRICT;

-- Table: Settings
CREATE TABLE IF NOT EXISTS Settings (settingId INTEGER PRIMARY KEY AUTOINCREMENT, biometricAuthentication INTEGER NOT NULL, securityAlert INTEGER NOT NULL, autoLockin INTEGER NOT NULL, Language TEXT NOT NULL, display TEXT NOT NULL) STRICT;

-- Table: User
CREATE TABLE IF NOT EXISTS User (userID INTEGER PRIMARY KEY AUTOINCREMENT, Username TEXT NOT NULL UNIQUE, Email ANY NOT NULL UNIQUE, PasswordLogin TEXT UNIQUE NOT NULL) STRICT;

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
