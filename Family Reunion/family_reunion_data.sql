-- family_reunion_data.sql
-- Sample data for testing the Family Reunion SQLite database

PRAGMA foreign_keys = ON;

-- ------------------------------
-- Addresses
-- ------------------------------
INSERT INTO Addresses (Street, City, State, ZIPCode) VALUES
('123 Maple Street', 'Detroit', 'MI', '48201'),
('45 Oak Drive', 'Toledo', 'OH', '43604'),
('789 Birch Lane', 'Cleveland', 'OH', '44114');

-- ------------------------------
-- Family Members
-- ------------------------------
INSERT INTO FamilyMembers (FirstName, LastName, Status, ContactPhone, ContactEmail, AddressID) VALUES
('John',   'Zastrow',  'F', '555-1111', 'john.z@example.com', 1),
('Mary',   'Zastrow',  'M', '555-2222', 'mary.z@example.com', 1),
('Emily',  'Zastrow',  'C', NULL,        NULL,                 1),
('Robert', 'Green',    'A', '555-3333', 'rob.green@example.com', 2),
('Sarah',  'Green',    'C', NULL,        NULL,                 2),
('Paul',   'Martinez', 'F', '555-4444', 'paul.m@example.com', 3),
('Linda',  'Martinez', 'M', '555-5555', 'linda.m@example.com', 3),
('Jacob',  'Martinez', 'C', NULL,        NULL,                 3),
('Lily',   'Martinez', 'C', NULL,        NULL,                 3);

-- ------------------------------
-- Allergies
-- ------------------------------
INSERT INTO Allergies (AllergyDescription) VALUES
('Peanuts'),
('Gluten'),
('Dairy'),
('Shellfish');

-- ------------------------------
-- FamilyMemberAllergies
-- ------------------------------
INSERT INTO FamilyMemberAllergies (FamilyMemberID, AllergyID) VALUES
(3, 1),  -- Emily Zastrow -> Peanuts
(4, 2),  -- Robert Green  -> Gluten
(8, 3);  -- Jacob Martinez -> Dairy

-- ------------------------------
-- Reunion Locations
-- ------------------------------
INSERT INTO ReunionLocations (LocationName, LocationDescription, LocationAddress) VALUES
('Riverside Park', 'Picnic area with pavilions and river view', '900 Park Ave, Detroit, MI'),
('Lakeside Hall', 'Indoor banquet hall with kitchen', '411 Lake Rd, Toledo, OH');

-- ------------------------------
-- Reunions
-- ------------------------------
INSERT INTO Reunions (ReunionName, LocationID, DateOfReunion, FoodProvided, DrinksProvided, SingleCost, FamilyCost) VALUES
('Zastrow Summer Reunion', 1, '2025-07-15', 'BBQ, salads, desserts', 'Water, lemonade, soda', 15.00, 40.00),
('Green-Miller Fall Gathering', 2, '2025-10-05', 'Hot dogs, chili, sides', 'Coffee, cider, soda', 10.00, 30.00);

-- ------------------------------
-- Reunion Responses
-- ------------------------------
INSERT INTO ReunionResponses (FamilyID, ReunionID, AdultCount, ChildCount, DateFeeReceived, FeeAmount) VALUES
(1, 1, 2, 1, '2025-06-20', 40.00),
(4, 1, 1, 1, '2025-06-22', 25.00),
(6, 2, 2, 2, '2025-09-15', 30.00);
