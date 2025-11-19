-- ============================================
-- SAMPLE DATA FOR TESTING
-- ============================================

-- PRAGMA foreign_keys = ON; -- SQLite-specific; removed to avoid "set_verb" error on non-SQLite engines

-- ------------------------------
-- Addresses
-- ------------------------------
INSERT INTO Addresses (Street, City, State, ZIPCode) VALUES ('123 Maple Street', 'Detroit', 'MI', '48201');
INSERT INTO Addresses (Street, City, State, ZIPCode) VALUES ('45 Oak Drive', 'Toledo', 'OH', '43604');
INSERT INTO Addresses (Street, City, State, ZIPCode) VALUES ('789 Birch Lane', 'Cleveland', 'OH', '44114');

-- ------------------------------
-- Family Members
-- ------------------------------
INSERT INTO FamilyMembers (FirstName, LastName, Status, ContactPhone, ContactEmail, AddressID) VALUES ('John',   'Zastrow', 'F', '555-1111', 'john.z@example.com', 1);
INSERT INTO FamilyMembers (FirstName, LastName, Status, ContactPhone, ContactEmail, AddressID) VALUES ('Mary',   'Zastrow', 'M', '555-2222', 'mary.z@example.com', 1);
INSERT INTO FamilyMembers (FirstName, LastName, Status, ContactPhone, ContactEmail, AddressID) VALUES ('Emily',  'Zastrow', 'C', NULL,       NULL,                 1);
INSERT INTO FamilyMembers (FirstName, LastName, Status, ContactPhone, ContactEmail, AddressID) VALUES ('Robert', 'Green',   'A', '555-3333', 'rob.green@example.com', 2);
INSERT INTO FamilyMembers (FirstName, LastName, Status, ContactPhone, ContactEmail, AddressID) VALUES ('Sarah',  'Green',   'C', NULL,       NULL,                     2);
INSERT INTO FamilyMembers (FirstName, LastName, Status, ContactPhone, ContactEmail, AddressID) VALUES ('Paul',   'Martinez', 'F', '555-4444', 'paul.m@example.com', 3);
INSERT INTO FamilyMembers (FirstName, LastName, Status, ContactPhone, ContactEmail, AddressID) VALUES ('Linda',  'Martinez', 'M', '555-5555', 'linda.m@example.com', 3);
INSERT INTO FamilyMembers (FirstName, LastName, Status, ContactPhone, ContactEmail, AddressID) VALUES ('Jacob',  'Martinez', 'C', NULL,       NULL,                 3);
INSERT INTO FamilyMembers (FirstName, LastName, Status, ContactPhone, ContactEmail, AddressID) VALUES ('Lily',   'Martinez', 'C', NULL,       NULL,                 3);

-- ------------------------------
-- Allergy Types
-- ------------------------------
INSERT INTO Allergies (AllergyDescription) VALUES ('Peanuts');
INSERT INTO Allergies (AllergyDescription) VALUES ('Gluten');
INSERT INTO Allergies (AllergyDescription) VALUES ('Dairy');
INSERT INTO Allergies (AllergyDescription) VALUES ('Shellfish');

-- ------------------------------
-- FamilyMemberAllergies
-- (Many-to-many: link members to allergy IDs)
-- ------------------------------
INSERT INTO FamilyMemberAllergies (FamilyMemberID, AllergyID) VALUES (3, 1); -- Emily Zastrow -> Peanuts
INSERT INTO FamilyMemberAllergies (FamilyMemberID, AllergyID) VALUES (4, 2); -- Robert Green  -> Gluten
INSERT INTO FamilyMemberAllergies (FamilyMemberID, AllergyID) VALUES (8, 3); -- Jacob Martinez -> Dairy

-- ------------------------------
-- Reunion Locations
-- ------------------------------
INSERT INTO ReunionLocations (LocationName, LocationDescription, LocationAddress) VALUES ('Riverside Park', 'Picnic area with pavilions and river view', '900 Park Ave, Detroit, MI');
INSERT INTO ReunionLocations (LocationName, LocationDescription, LocationAddress) VALUES ('Lakeside Hall', 'Indoor banquet hall with kitchen', '411 Lake Rd, Toledo, OH');

-- ------------------------------
-- Reunions
-- ------------------------------
INSERT INTO Reunions (ReunionName, LocationID, DateOfReunion, FoodProvided, DrinksProvided, SingleCost, FamilyCost) VALUES
('Zastrow Summer Reunion', 1, '2025-07-15', 'BBQ, salads, desserts', 'Water, lemonade, soda', 15.00, 40.00);
INSERT INTO Reunions (ReunionName, LocationID, DateOfReunion, FoodProvided, DrinksProvided, SingleCost, FamilyCost) VALUES
('Green-Miller Fall Gathering', 2, '2025-10-05', 'Hot dogs, chili, sides', 'Coffee, cider, soda', 10.00, 30.00);

-- ------------------------------
-- Reunion Responses (RSVPs)
-- ------------------------------
-- John and Mary Zastrow + 1 child (Family rate)
INSERT INTO ReunionResponses (FamilyID, ReunionID, AdultCount, ChildCount, DateFeeReceived, FeeAmount) VALUES
(1, 1, 2, 1, '2025-06-20', 40.00);

-- Robert + Sarah (Single + child)
INSERT INTO ReunionResponses (FamilyID, ReunionID, AdultCount, ChildCount, DateFeeReceived, FeeAmount) VALUES
(4, 1, 1, 1, '2025-06-22', 25.00);

-- Martinez family (Family rate)
INSERT INTO ReunionResponses (FamilyID, ReunionID, AdultCount, ChildCount, DateFeeReceived, FeeAmount) VALUES
(6, 2, 2, 2, '2025-09-15', 30.00);
