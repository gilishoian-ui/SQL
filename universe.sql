
CREATE DATABASE universe;

\c universe;
CREATE TABLE galaxy (
  galaxy_id SERIAL PRIMARY KEY,
  name VARCHAR(40) UNIQUE NOT NULL,
  galaxy_type TEXT,
  distance_from_earth_million_light_years NUMERIC,
  has_a_blackhole BOOLEAN,
  age_million_years INT
);
INSERT INTO galaxy (name, galaxy_type, distance_from_earth_million_light_years, has_a_blackhole, age_million_years)
VALUES
('Milky Way', 'Barred Spiral', 0, TRUE, 13600),
('Andromeda', 'Spiral', 2.5, TRUE, 10000),
('Triangulum', 'Spiral', 2.9, FALSE, 8000),
('Large Magellanic Cloud', 'Irregular', 163, FALSE, 13000),
('Whirlpool', 'Spiral', 31, TRUE, 400),
('Sombrero', 'Lenticular', 29, TRUE, 9000);

CREATE TABLE star (
  star_id SERIAL PRIMARY KEY,
  name VARCHAR(50) UNIQUE NOT NULL,
  galaxy_id INT REFERENCES galaxy(galaxy_id),
  star_type TEXT,
  mass_solar_masses NUMERIC,
  visible_from_earth BOOLEAN,
  temperature_k INT
);
INSERT INTO star (name, galaxy_id, star_type, mass_solar_masses, visible_from_earth, temperature_k)
VALUES
('Sun', 1, 'G-type Main Sequence', 1.0, TRUE, 5778),
('M51-ULS-1', 5, 'X-ray Binary', 20, FALSE, 30000),
('RZ 2109-1', 6, 'Black Hole Binary System', 10, FALSE, 25000),
('M31-V1', 2, 'Cepheid Variable', 5, FALSE, 6000),
('M33 Variable C', 3, 'Luminous Blue Variable', 15, FALSE, 20000),
('S Doradus', 4, 'Luminous Blue Variable', 24, TRUE, 20000);
 
 CREATE TABLE planet (
  planet_id SERIAL PRIMARY KEY,
  name VARCHAR(40) UNIQUE NOT NULL,
  star_id INT REFERENCES star(star_id),
  planet_type TEXT,
  radius_km NUMERIC,
  has_life BOOLEAN,
  orbit_period_days INT,
  moons_count INT
);
INSERT INTO planet (name, star_id, planet_type, radius_km, has_life, orbit_period_days, moons_count)
VALUES
('Mercury', 1, 'Terrestrial', 2440, FALSE, 88, 0),
('Venus', 1, 'Terrestrial', 6052, FALSE, 225, 0),
('Earth', 1, 'Terrestrial', 6371, TRUE, 365, 1),
('Mars', 1, 'Terrestrial', 3389, FALSE, 687, 2),
('Jupiter', 1, 'Gas Giant', 69911, FALSE, 4333, 95),
('Saturn', 1, 'Gas Giant', 58232, FALSE, 10759, 145),
('Uranus', 1, 'Ice Giant', 25362, FALSE, 30687, 27),
('Neptune', 1, 'Ice Giant', 24622, FALSE, 60190, 14),
('M51-b', 2, 'Gas Giant', 70000, FALSE, 420, 0),
('Andromeda-X', 4, 'Terrestrial', 5800, FALSE, 290, 0),
('Triangulum-X', 3, 'Super-Earth', 9000, FALSE, 140, 0),
('Doradus-b', 6, 'Gas Giant', 65000, FALSE, 600, 0);

CREATE TABLE moon (
  moon_id SERIAL PRIMARY KEY,
  name VARCHAR(50) UNIQUE NOT NULL,
  planet_id INT REFERENCES planet(planet_id),
  discovered_year INT,
  is_spherical BOOLEAN,
  radius_km NUMERIC
);
INSERT INTO moon (name, planet_id, discovered_year, is_spherical, radius_km)
VALUES
('Moon', 3, 0, TRUE, 1737),
('Phobos', 4, 1877, FALSE, 11),
('Deimos', 4, 1877, FALSE, 6),

('Io', 5, 1610, TRUE, 1821),
('Europa', 5, 1610, TRUE, 1560),
('Ganymede', 5, 1610, TRUE, 2634),
('Callisto', 5, 1610, TRUE, 2410),

('Titan', 6, 1655, TRUE, 2574),
('Enceladus', 6, 1789, TRUE, 252),
('Rhea', 6, 1672, TRUE, 763),

('Miranda', 7, 1948, TRUE, 236),
('Ariel', 7, 1851, TRUE, 578),
('Umbriel', 7, 1851, TRUE, 584),

('Triton', 8, 1846, TRUE, 1353),

('Alpha-1', 9, 2200, FALSE, 120),
('Beta-1', 9, 2201, FALSE, 90),

('Andro-Moon1', 10, 2300, FALSE, 300),

('Tri-Moon1', 11, 2350, FALSE, 400),

('Dora-Moon1', 12, 2400, FALSE, 500);
