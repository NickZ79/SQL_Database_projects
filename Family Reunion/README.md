📘 Family Reunion Database — SQL → SQLite Case Study
📝 Overview

This project began as a standard SQL Server (.sql) assignment for a college database course. The original task was to design a relational database to manage information for a family reunion — including family members, addresses, allergies, event locations, and RSVP responses.

For this repository, the project was converted to SQLite to make the database portable, easy to run, and accessible without requiring a full SQL Server environment. The schema was slightly refined, and sample data was added to create a complete, working demo suitable for portfolio presentation.

🎯 Project Goals

Demonstrate relational database design skills

Model real-world data entities and relationships

Implement referential integrity using foreign keys

Provide a working sample database for exploration

Showcase SQL query examples for reporting and analysis

🏗️ Database Schema

The database contains six core tables, each representing part of the family reunion management system:

1. Addresses

Stores shared household address information.

2. FamilyMembers

One record per person attending or associated with the reunion.

3. Allergies

List of possible allergy types.

4. FamilyMemberAllergies

A junction (many-to-many) table linking family members to their allergies.

5. ReunionLocations

Physical locations where reunion events occur.

6. Reunions

Individual reunion events, including date, food/drinks, and pricing.

7. ReunionResponses

RSVP data: number of adults/children attending and fees paid.

🔧 Technology Used

SQL Server (original assignment)

SQLite 3.51 (current version in repo)

SQL schema & data scripts

Command-line SQLite tools (no server required)

🔄 Changes from Original SQL Server Version

During the conversion from SQL Server to SQLite:

Replaced IDENTITY with AUTOINCREMENT

Replaced NVARCHAR with TEXT

Updated DATE types to ISO-formatted text (YYYY-MM-DD)

Removed SQL Server–specific syntax (GO, constraints syntax)

Simplified many-to-one allergy model using a junction table

Added PRAGMA foreign_keys = ON to enforce referential integrity

Added a sample dataset for easier testing and demonstration

These adjustments were made to ensure compatibility and portability while maintaining the original intent of the assignment.

📂 Files in This Repository
/family_reunion.db                  → Pre-built SQLite database (optional)
/family_reunion_sqlite.sql          → Schema (tables + constraints)
/family_reunion_sample_data.sql     → Sample data insert script
/README.md                          → Documentation (this file)

🚀 How to Use
1. Install SQLite

Download sqlite-tools-win-x64 from the official SQLite website and extract it somewhere like:

C:\sqlite\

2. Run the Schema

Open the terminal in the folder where your .sql files are located and run:

sqlite3 family_reunion.db < family_reunion_sqlite.sql

3. Insert Sample Data
sqlite3 family_reunion.db < family_reunion_sample_data.sql

4. Open the Database
sqlite3 family_reunion.db

5. List all tables
.tables

6. Run a test query
SELECT * FROM FamilyMembers;

📊 Example Queries
Total attendance and revenue per reunion
SELECT 
    R.ReunionName,
    R.DateOfReunion,
    SUM(RR.AdultCount + RR.ChildCount) AS TotalAttendees,
    SUM(RR.FeeAmount) AS TotalRevenue
FROM Reunions R
JOIN ReunionResponses RR ON R.ReunionID = RR.ReunionID
GROUP BY R.ReunionName, R.DateOfReunion;

List all members with allergies
SELECT 
    FM.FirstName,
    FM.LastName,
    A.AllergyDescription
FROM FamilyMembers FM
JOIN FamilyMemberAllergies FMA ON FM.FamilyMemberID = FMA.FamilyMemberID
JOIN Allergies A ON FMA.AllergyID = A.AllergyID;

📌 Project Notes

This database project is part of a larger portfolio focused on backend development, SQL modeling, and real-world data management. Converting the project from SQL Server to SQLite allows it to be used:

On any platform (Windows, macOS, Linux)

Without needing a server

As a standalone .db file for demonstrations

In your professional portfolio or website

✅ License

This project is available for personal and educational use.