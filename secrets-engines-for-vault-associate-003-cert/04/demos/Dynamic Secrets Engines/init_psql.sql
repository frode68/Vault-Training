-- Create a new user with superuser privileges
CREATE USER vault WITH SUPERUSER PASSWORD 'vaultpass';

-- Create schema if it does not exist
CREATE SCHEMA IF NOT EXISTS roster;

-- Create players table
CREATE TABLE IF NOT EXISTS roster.players (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    position TEXT NOT NULL,
    age INT NOT NULL
);

-- Insert 10 player records
INSERT INTO roster.players (name, position, age) VALUES
('John Doe', 'Forward', 25),
('Jane Smith', 'Midfielder', 22),
('Alex Johnson', 'Defender', 28),
('Chris Lee', 'Goalkeeper', 30),
('Patricia Brown', 'Striker', 24),
('Michael Davis', 'Winger', 26),
('Emily Wilson', 'Center Back', 27),
('Robert White', 'Right Back', 23),
('Daniel Harris', 'Left Back', 29),
('Sarah Miller', 'Attacking Midfielder', 21);

-- Verify insertion
SELECT * FROM roster.players;