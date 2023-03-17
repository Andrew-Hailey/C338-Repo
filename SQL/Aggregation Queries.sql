use PersonalTrainer;
SELECT *
FROM Client;

-- Use an aggregate to count the number of Clients.
-- 500 rows

SELECT Count(ClientId)
FROM Client;

--------------------

-- Use an aggregate to count Client.BirthDate.
-- The number is different than total Clients. Why?
-- 463 rows

SELECT Count(Client.BirthDate)
FROM Client;
/*
Because some rows are NULL and contain no data
*/
--------------------

-- Group Clients by City and count them.
-- Order by the number of Clients desc.
-- 20 rows

SELECT City, COUNT(ClientID)
FROM Client
GROUP BY City
ORDER BY count(ClientID)
DESC;
--------------------

-- Calculate a total per invoice using only the InvoiceLineItem table.
-- Group by InvoiceId.
-- You'll need an expression for the line item total: Price * Quantity.
-- Aggregate per group using SUM().
-- 1000 rows

SELECT InvoiceId, SUM(Price * Quantity) AS LineItemTotal
FROM InvoiceLineItem
GROUP BY InvoiceId
LIMIT 0, 1000;
--------------------

-- Calculate a total per invoice using only the InvoiceLineItem table.
-- (See above.)
-- Only include totals greater than $500.00.
-- Order from lowest total to highest.
-- 234 rows

SELECT InvoiceId, SUM(Price * Quantity) AS LineItemTotal
FROM InvoiceLineItem
GROUP BY InvoiceId
HAVING SUM(Price * Quantity) > 500
ORDER BY SUM(Price * Quantity) ASC
LIMIT 0, 1000;

--------------------

-- Calculate the average line item total
-- grouped by InvoiceLineItem.Description.
-- 3 rows

SELECT Description, AVG(Price * Quantity) AS LineItemTotal
FROM InvoiceLineItem
GROUP BY Description;
--------------------

-- Select ClientId, FirstName, and LastName from Client
-- for clients who have *paid* over $1000 total.
-- Paid is Invoice.InvoiceStatus = 2.
-- Order by LastName, then FirstName.
-- 146 rows

SELECT c.ClientId, c.FirstName, c.LastName, SUM(li.Price *li.Quantity) AS LineItemTotal
FROM Client c
JOIN Invoice i ON i.ClientId = c.ClientId
JOIN InvoiceLineItem li ON i.InvoiceId = li.InvoiceId
WHERE i.InvoiceStatus = 2
GROUP BY c.ClientID
HAVING SUM(li.Price *li.Quantity) > 1000
ORDER BY LastName, FirstName;

--------------------

-- Count exercises by category.
-- Group by ExerciseCategory.Name.
-- Order by exercise count descending.
-- 13 rows

SELECT ec.Name, COUNT(e.ExerciseCategoryId)
FROM ExerciseCategory ec
INNER JOIN Exercise e ON e.ExerciseCategoryId = ec.ExerciseCategoryId
GROUP BY ec.Name
ORDER BY COUNT(ExerciseCategoryId)
DESC;
--------------------

-- Select Exercise.Name along with the minimum, maximum,
-- and average ExerciseInstance.Sets.
-- Order by Exercise.Name.
-- 64 rows

SELECT e.Name, MIN(ei.Sets) AS MinimumSets, MAX(ei.Sets) AS MaximumSets, AVG(ei.sets) AS AverageSets
FROM Exercise e
INNER JOIN ExerciseInstance ei ON e.ExerciseId = ei.ExerciseId
GROUP BY e.ExerciseId
ORDER BY e.Name;

--------------------

-- Find the minimum and maximum Client.BirthDate
-- per Workout.
-- 26 rows
-- Sample: 
-- WorkoutName, EarliestBirthDate, LatestBirthDate
-- '3, 2, 1... Yoga!', '1928-04-28', '1993-02-07'

SELECT w.Name, MIN(c.Birthdate) AS EarliestBirthDate, MAX(c.Birthdate) AS LatestBirthDate
FROM Workout w
INNER JOIN ClientWorkout cw ON w.WorkoutId = cw.WorkoutId
INNER JOIN Client c ON cw.ClientId = c.ClientId
GROUP BY w.Name;
--------------------

-- Count client goals.
-- Be careful not to exclude rows for clients without goals.
-- 500 rows total
-- 50 rows with no goals

SELECT c.FirstName, COUNT(cg.GoalID) AS CountOfGoals
FROM Client c
LEFT OUTER JOIN ClientGoal cg ON c.ClientId = cg.ClientId
GROUP BY c.ClientID
ORDER BY COUNT(cg.GoalID);

--------------------

-- Select Exercise.Name, Unit.Name, 
-- and minimum and maximum ExerciseInstanceUnitValue.Value
-- for all exercises with a configured ExerciseInstanceUnitValue.
-- Order by Exercise.Name, then Unit.Name.
-- 82 rows

SELECT e.Name, u.Name, MIN(eiuv.Value), MAX(eiuv.Value)
FROM Exercise e
INNER JOIN ExerciseInstance ei ON e.ExerciseId = ei.ExerciseId
INNER JOIN ExerciseInstanceUnitValue eiuv ON ei.ExerciseInstanceId = eiuv.ExerciseInstanceId
INNER JOIN Unit u ON eiuv.UnitId = u.UnitId
WHERE eiuv.Value IS NOT NULL
GROUP BY e.ExerciseId, e.Name, u.UnitId, u.Name
ORDER BY e.Name, u.Name;

--------------------

-- Modify the query above to include ExerciseCategory.Name.
-- Order by ExerciseCategory.Name, then Exercise.Name, then Unit.Name.
-- 82 rows

SELECT ec.Name, e.Name, u.Name, MIN(eiuv.Value), MAX(eiuv.Value)
FROM Exercise e
INNER JOIN ExerciseInstance ei ON e.ExerciseId = ei.ExerciseId
INNER JOIN ExerciseInstanceUnitValue eiuv ON ei.ExerciseInstanceId = eiuv.ExerciseInstanceId
INNER JOIN Unit u ON eiuv.UnitId = u.UnitId
INNER JOIN ExerciseCategory ec ON ec.ExerciseCategoryId = e.ExerciseCategoryId
WHERE eiuv.Value IS NOT NULL
GROUP BY e.ExerciseId, e.Name, u.UnitId, u.Name
ORDER BY ec.Name, e.Name, u.Name;
--------------------

-- Select the minimum and maximum age in years for
-- each Level.
-- To calculate age in years, use the MySQL function DATEDIFF.
-- 4 rows

SELECT l.Name, MIN(DATEDIFF(CURDATE(), c.BirthDate) / 365) AS MinimumAge,
MAX(DATEDIFF(CURDATE(), c.BirthDate) / 365 ) AS MaximumAge
FROM Client c
INNER JOIN ClientWorkout cw ON c.ClientId = cw.ClientId
INNER JOIN Workout w ON cw.WorkoutId = w.WorkoutId
INNER JOIN Level l ON w.LevelId = l.LevelId
GROUP BY l.LevelId;
--------------------
-- Stretch Goal!
-- Count logins by email extension (.com, .net, .org, etc...).
-- Research SQL functions to isolate a very specific part of a string value.
-- 27 rows (27 unique email extensions)

--------------------

-- Stretch Goal!
-- Match client goals to workout goals.
-- Select Client FirstName and LastName and Workout.Name for
-- all workouts that match at least 2 of a client's goals.
-- Order by the client's last name, then first name.
-- 139 rows
--------------------