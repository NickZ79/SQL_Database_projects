# 📘 Family Reunion Database — SQL → SQLite Case Study

## 📝 Overview
This project is a relational database system originally designed as a SQL Server assignment for a college course. It models real-world family reunion data, including members, addresses, allergies, event locations, and RSVP attendance.

The project has been fully **converted to SQLite** for portability, easy testing, and cross-platform compatibility. The repository now includes all scripts needed to create, populate, and reset the database.

---

## 🎯 Project Goals

- Demonstrate complete relational database modeling  
- Show normalized table design with foreign keys  
- Provide schema, data, and reset scripts  
- Offer example queries for analytics and reporting  
- Deliver a fully functional `.db` file for exploration or portfolio use  

---

## 🗂️ File Structure

```
README.md                     → Project documentation (this file)
family_reunion.db            → Prebuilt SQLite database
family_reunion_schema.sql    → CREATE TABLE statements + constraints
family_reunion_data.sql      → Sample INSERT statements
reset_family_reunion.sql     → Drops and recreates the database schema
.vscode/                     → Editor settings (ignored in Git)
```

---

## 🏗️ Database Schema Overview

The database contains **seven core tables**, each modeling a different real-world entity:

1. **Addresses** – shared household address information  
2. **FamilyMembers** – one record per person  
3. **Allergies** – list of allergy types  
4. **FamilyMemberAllergies** – many-to-many relationship between members and allergies  
5. **ReunionLocations** – physical locations for reunion events  
6. **Reunions** – individual reunion events + date + pricing  
7. **ReunionResponses** – RSVP counts, attendance, and fee totals  

---

## 🔄 SQL Server → SQLite Conversion Changes

During conversion, several updates were made to ensure full compatibility:

- Replaced `IDENTITY` with `AUTOINCREMENT`
- Converted all NVARCHAR types to `TEXT`
- Standardized dates to `YYYY-MM-DD`
- Removed SQL Server–specific commands (`GO`, certain constraint syntax)
- Added `PRAGMA foreign_keys = ON` to enforce referential integrity
- Implemented a proper many-to-many allergy model via junction table
- Added consistent sample data for demonstration
- Created reset script for quick rebuilding

These changes retain the intent of the original assignment while making the database portable.

---

## 🚀 How to Use the Project

### **1. Install SQLite**
Download and extract SQLite tools to a location like:

```
C:\sqlite\
```

### **2. Create the Database (Schema Only)**

```
sqlite3 family_reunion.db < family_reunion_schema.sql
```

### **3. Insert Sample Data**

```
sqlite3 family_reunion.db < family_reunion_data.sql
```

### **4. Reset the Database Entirely**

```
sqlite3 family_reunion.db < reset_family_reunion.sql
```

### **5. Open the Database in the SQLite Shell**

```
sqlite3 family_reunion.db
```

### **6. View All Tables**

```
.tables
```

### **7. Test Query**

```
SELECT * FROM FamilyMembers;
```

---

## 📊 Example Queries

### **1. Attendance & Revenue per Reunion**

```sql
SELECT 
    R.ReunionName,
    R.DateOfReunion,
    SUM(RR.AdultCount + RR.ChildCount) AS TotalAttendees,
    SUM(RR.FeeAmount) AS TotalRevenue
FROM Reunions R
JOIN ReunionResponses RR ON R.ReunionID = RR.ReunionID
GROUP BY R.ReunionName, R.DateOfReunion;
```

### **2. Family Members With Documented Allergies**

```sql
SELECT 
    FM.FirstName,
    FM.LastName,
    A.AllergyDescription
FROM FamilyMembers FM
JOIN FamilyMemberAllergies FMA 
      ON FM.FamilyMemberID = FMA.FamilyMemberID
JOIN Allergies A 
      ON FMA.AllergyID = A.AllergyID;
```

---

## 📌 Notes

- The `.db` file is included for convenience, but can be rebuilt at any time using the schema + data scripts.  
- The reset script (`reset_family_reunion.sql`) is ideal for testing or demonstrating a clean database setup.  
- This project is part of a backend / database-focused portfolio showcasing SQL modeling and data relationships.

---

## ✅ License
This project is available for **personal and educational use**.
