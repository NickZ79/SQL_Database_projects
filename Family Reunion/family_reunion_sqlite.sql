-- family_reunion_sqlite.sql
-- SQLite version of the Family Reunion database
-- Based on your original SQL Server assignment, with a cleaned-up allergy design

-- Enable foreign key enforcement when running on SQLite. Some SQL parsers (e.g., SQL Server)
-- do not accept PRAGMA statements and will report errors like "set_verb is invalid".
-- Run the following line manually in a SQLite client if needed:
-- PRAGMA foreign_keys = ON;

-- ==========================
-- Addresses: shared household info
-- ==========================
CREATE TABLE Addresses (
    AddressID      INTEGER PRIMARY KEY,
    Street         TEXT NOT NULL,
    City           TEXT NOT NULL,
    State          TEXT NOT NULL,
    ZIPCode        TEXT NOT NULL
);

-- ==========================
-- Family Members: one row per person
-- ==========================
CREATE TABLE FamilyMembers (
    FamilyMemberID INTEGER PRIMARY KEY,
    FirstName      TEXT NOT NULL,
    LastName       TEXT NOT NULL,
    Status         TEXT NOT NULL CHECK (Status IN ('F','M','C','A')),
    -- F = Father, M = Mother, C = Child, A = Single Adult
    ContactPhone   TEXT,
    ContactEmail   TEXT,
    AddressID      INTEGER NOT NULL,
    FOREIGN KEY (AddressID) REFERENCES Addresses(AddressID)
);

-- ==========================
-- Allergy types (e.g., Peanuts, Gluten, Dairy)
-- ==========================
CREATE TABLE Allergies (
    AllergyID          INTEGER PRIMARY KEY,
    AllergyDescription TEXT NOT NULL
);

-- ==========================
-- Junction table: which member has which allergy
-- (many-to-many between FamilyMembers and Allergies)
-- ==========================
CREATE TABLE FamilyMemberAllergies (
    FamilyMemberID INTEGER NOT NULL,
    AllergyID      INTEGER NOT NULL,
    PRIMARY KEY (FamilyMemberID, AllergyID),
    FOREIGN KEY (FamilyMemberID) REFERENCES FamilyMembers(FamilyMemberID),
    FOREIGN KEY (AllergyID)      REFERENCES Allergies(AllergyID)
);

-- ==========================
-- Reunion Locations
-- ==========================
CREATE TABLE ReunionLocations (
    LocationID          INTEGER PRIMARY KEY,
    LocationName        TEXT NOT NULL,
    LocationDescription TEXT,
    LocationAddress     TEXT NOT NULL
);

-- ==========================
-- Reunions (individual events)
-- ==========================
CREATE TABLE Reunions (
    ReunionID      INTEGER PRIMARY KEY,
    ReunionName    TEXT NOT NULL,
    LocationID     INTEGER NOT NULL,
    DateOfReunion  TEXT NOT NULL,    -- store as ISO date string: 'YYYY-MM-DD'
    FoodProvided   TEXT NOT NULL,
    DrinksProvided TEXT NOT NULL,
    SingleCost     NUMERIC(10,2) NOT NULL,
    FamilyCost     NUMERIC(10,2) NOT NULL,
    FOREIGN KEY (LocationID) REFERENCES ReunionLocations(LocationID)
);

-- ==========================
-- Reunion Responses (RSVPs)
-- ==========================
CREATE TABLE ReunionResponses (
    ResponseID      INTEGER PRIMARY KEY,
    FamilyID        INTEGER NOT NULL,   -- primary contact person for the family
    ReunionID       INTEGER NOT NULL,
    AdultCount      INTEGER NOT NULL CHECK (AdultCount >= 0),
    ChildCount      INTEGER NOT NULL CHECK (ChildCount >= 0),
    DateFeeReceived TEXT NOT NULL,      -- 'YYYY-MM-DD'
    FeeAmount       NUMERIC(10,2) NOT NULL,
    FOREIGN KEY (FamilyID)  REFERENCES FamilyMembers(FamilyMemberID),
    FOREIGN KEY (ReunionID) REFERENCES Reunions(ReunionID)
);
