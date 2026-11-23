#!/usr/bin/env bash

# Open/Create Database
sqlite3 practice.db

# Create Table
CREATE TABLE notes (
    id INTEGER PRIMARY KEY,
    note TEXT
);

# Insert
INSERT INTO notes (note)
VALUES ("boogers");

# Read
SELECT * FROM notes;

# Update
UPDATE notes
SET note = "classified boogers"
WHERE id = 1;

# Delete
DELETE FROM notes
WHERE id = 1;

.quit
