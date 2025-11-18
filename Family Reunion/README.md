# 📘 Family Reunion Database — SQL → SQLite Case Study

## 📝 Overview  
This project began as a SQL Server assignment for a college database course. The goal was to design a relational database to manage information for a family reunion, including family members, addresses, allergies, event locations, and RSVP records.

For this repository, the project was **converted to SQLite** to make it fully portable and easy to run without a SQL Server installation. The schema was updated for SQLite compatibility, and sample data was added to create a complete, working database suitable for use in a portfolio.

---

## 🎯 Project Goals

- Demonstrate relational database modeling  
- Represent real-world data entities and relationships  
- Implement referential integrity using foreign keys  
- Provide a functioning example database for exploration  
- Include example reporting queries for analytics  

---

## 🏗️ Database Schema

The system includes **seven core tables**, each representing a different part of the reunion–management workflow.

### **1. Addresses**  
Stores household address information shared by multiple family members.

### **2. FamilyMembers**  
Contains one record per person associated with the reunion.

### **3. Allergies**  
Stores the list of allergy types.

### **4. FamilyMemberAllergies**  
A many-to-many junction table connecting members to their allergies.

### **5. ReunionLocations**  
Lists locations where reunion events take place.

### **6. Reunions**  
Describes individual reunion events, dates, food, and pricing.

### **7. ReunionResponses**  
RSVP data including adult/child counts and fee amounts.

---

## 🔧 Technologies Used

- SQL Server (original version)  
- SQLite 3.51 (current version)  
- Raw SQL schema + insert scripts  
- SQLite command-line tools  

---

## 🔄 SQL Server → SQLite Conversion Changes

During conversion, the following adjustments were made:

- Replaced `IDENTITY` with `AUTOINCREMENT`  
- Converted `NVARCHAR` to `TEXT`  
- Standardized dates to `YYYY-MM-DD` string format  
- Removed SQL Server-specific commands such as `GO`  
- Adjusted constraint syntax for SQLite  
- Added a junction table for many-to-many allergy modeling  
- Enabled referential integrity using:

  ```sql
  PRAGMA foreign_keys = ON;
  ```

- Added a full sample dataset for testing and demos  

These changes maintain the original project intent while ensuring cross-platform compatibility.

---

## 📂 Files in This Repository

```
family_reunion.db                 → Prebuilt SQLite database (optional)
family_reunion_sqlite.sql         → Schema: tables + foreign keys
family_reunion_sample_data.sql    → Insert script for sample data
README.md                         → Documentation (this file)
```

---

## 🚀 How to Use

### **1. Install SQLite**
Download the CLI tools and extract them somewhere like:

```
C:\sqlite\
```

### **2. Build the Database**
Run the schema:

```
sqlite3 family_reunion.db < family_reunion_sqlite.sql
```

### **3. Insert Sample Data**
```
sqlite3 family_reunion.db < family_reunion_sample_data.sql
```

### **4. Open the Database**
```
sqlite3 family_reunion.db
```

### **5. List All Tables**
```
.tables
```

### **6. Run a Test Query**
```
SELECT * FROM FamilyMembers;
```

---

## 📊 Example Queries

### **Attendance & Revenue per Reunion**

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

### **List All Members With Their Allergies**

```sql
SELECT 
    FM.FirstName,
    FM.LastName,
    A.AllergyDescription
FROM FamilyMembers FM
JOIN FamilyMemberAllergies FMA ON FM.FamilyMemberID = FMA.FamilyMemberID
JOIN Allergies A ON FMA.AllergyID = A.AllergyID;
```

---

## 📌 Project Notes

This database project is part of a broader backend and data-modeling portfolio. Converting the project from SQL Server to SQLite allows it to:

- Run on any operating system  
- Function without a database server  
- Be showcased easily as a standalone `.db` file  
- Be integrated into a professional portfolio website  

---

## ✅ License  
This project is available for **personal and educational use**.
