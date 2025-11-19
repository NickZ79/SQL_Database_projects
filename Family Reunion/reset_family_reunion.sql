-- reset_family_reunion.sql
-- Drops all tables for the Family Reunion database so the schema + data
-- scripts can be re-run cleanly.

-- Temporarily disable foreign key enforcement so we can drop in any order
PRAGMA foreign_keys = OFF;

DROP TABLE IF EXISTS ReunionResponses;
DROP TABLE IF EXISTS FamilyMemberAllergies;
DROP TABLE IF EXISTS Reunions;
DROP TABLE IF EXISTS ReunionLocations;
DROP TABLE IF EXISTS FamilyMembers;
DROP TABLE IF EXISTS Allergies;
DROP TABLE IF EXISTS Addresses;

-- Re-enable foreign key checks
PRAGMA foreign_keys = ON;
