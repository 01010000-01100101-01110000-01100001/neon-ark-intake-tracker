INSERT INTO habitats (biome, location, min_temp_c, max_temp_c, created_at)
VALUES
('FOREST', 'Sector A - Moss Caverns', 8, 18, NOW()),
('FOREST', 'Sector B - Ember Grove', 14, 26, NOW()),
('FOREST', 'Sector C - Hollow Canopy', 10, 22, NOW()),
('DESERT', 'Sector D - Glass Dunes', 24, 39, NOW()),
('DESERT', 'Sector E - Sunspike Basin', 28, 44, NOW()),
('DESERT', 'Sector F - Ash Mirage', 20, 34, NOW()),
('OCEAN', 'Sector G - Tidal Vault', 2, 12, NOW()),
('OCEAN', 'Sector H - Deep Current Bay', 4, 10, NOW()),
('OCEAN', 'Sector I - Brinefall Shelf', 6, 14, NOW()),
('FOREST', 'Sector J - Moonroot Wilds', 9, 19, NOW());

INSERT INTO creatures (name, species, danger_level, condition, notes, habitat_id, created_at)
SELECT
    v.name,
    v.species,
    v.danger_level,
    v.condition,
    v.notes,
    h.id,
    NOW()
FROM (
    VALUES
        ('Nyx', 'Void Fox', 'HIGH', 'QUARANTINED', 'Avoid bright light', 'Sector A - Moss Caverns'),
        ('Mosslight Vulpin', 'Vulpin lumina', 'LOW', 'STABLE', 'Bioluminescent fur; shy but curious.', 'Sector A - Moss Caverns'),
        ('Barkback Grazer', 'Cervid arboris', 'LOW', 'STABLE', 'Feeds on fungal mats; social.', 'Sector C - Hollow Canopy'),
        ('Thorncoil Lynx', 'Felis spina', 'MEDIUM', 'QUARANTINED', 'Reactive during feeding windows.', 'Sector B - Ember Grove'),
        ('Ashroot Elk', 'Cervus pyra', 'MEDIUM', 'STABLE', 'Prefers heated moss beds.', 'Sector B - Ember Grove'),
        ('Hollowfang Stalker', 'Canis cavus', 'HIGH', 'CRITICAL', 'Escaped enclosure once during storm event.', 'Sector C - Hollow Canopy'),
        ('Glimmer Antler', 'Aureoceros sylva', 'LOW', 'STABLE', 'Tracks light sources in groups.', 'Sector J - Moonroot Wilds'),
        ('Moonvine Serpent', 'Serpens lunaris', 'MEDIUM', 'QUARANTINED', 'Do not house near open vents.', 'Sector J - Moonroot Wilds'),
        ('Cinder Hopper', 'Lepus ignis', 'LOW', 'STABLE', 'Short bursts of heat under stress.', 'Sector B - Ember Grove'),
        ('Glassclaw Scuttler', 'Scorpio vitreus', 'HIGH', 'QUARANTINED', 'Tail fragments remain hazardous.', 'Sector D - Glass Dunes'),
        ('Sand Wraith Pup', 'Canis arena', 'MEDIUM', 'STABLE', 'Burrows rapidly when startled.', 'Sector D - Glass Dunes'),
        ('Sunflare Drakelet', 'Draco minor', 'HIGH', 'CRITICAL', 'Keep isolated from reflective surfaces.', 'Sector E - Sunspike Basin'),
        ('Dunebreak Ram', 'Ovis arida', 'MEDIUM', 'STABLE', 'Charges barriers when overheated.', 'Sector E - Sunspike Basin'),
        ('Mirage Mantis', 'Mantis phasma', 'HIGH', 'QUARANTINED', 'Camouflage interferes with sensor lock.', 'Sector F - Ash Mirage'),
        ('Ashglass Tortoise', 'Testudo cineris', 'LOW', 'STABLE', 'Shell stores heat for several hours.', 'Sector F - Ash Mirage'),
        ('Dustcoil Viper', 'Vipera solis', 'HIGH', 'CRITICAL', 'Venom potency increased after intake.', 'Sector D - Glass Dunes'),
        ('Sirocco Hound', 'Canis calidus', 'MEDIUM', 'STABLE', 'Responds to whistle-based commands.', 'Sector F - Ash Mirage'),
        ('Tideveil Eel', 'Anguilla obscura', 'MEDIUM', 'QUARANTINED', 'Disrupts low-voltage monitoring lines.', 'Sector G - Tidal Vault'),
        ('Brineback Ray', 'Raja salina', 'LOW', 'STABLE', 'Calm unless habitat lighting shifts suddenly.', 'Sector G - Tidal Vault'),
        ('Deep Current Leviathan Calf', 'Leviathan pelagus', 'HIGH', 'CRITICAL', 'Requires reinforced tank partition.', 'Sector H - Deep Current Bay'),
        ('Pearlscale Otter', 'Lutra marina', 'LOW', 'STABLE', 'Collects tools and hides them in filters.', 'Sector I - Brinefall Shelf'),
        ('Abyss Lantern Squid', 'Teuthis lumen', 'MEDIUM', 'STABLE', 'Light pulses increase during alarms.', 'Sector H - Deep Current Bay'),
        ('Coralhorn Grazer', 'Bos corallus', 'LOW', 'STABLE', 'Gentle herd behavior; salt-sensitive diet.', 'Sector I - Brinefall Shelf'),
        ('Stormfin Raptor', 'Raptor unda', 'HIGH', 'QUARANTINED', 'Talons puncture mesh if agitated.', 'Sector G - Tidal Vault'),
        ('Kelpmaw Lurker', 'Mawia kelpis', 'MEDIUM', 'CRITICAL', 'Do not introduce live feed unsupervised.', 'Sector H - Deep Current Bay')
) AS v(name, species, danger_level, condition, notes, habitat_location)
JOIN habitats h
    ON h.location = v.habitat_location;