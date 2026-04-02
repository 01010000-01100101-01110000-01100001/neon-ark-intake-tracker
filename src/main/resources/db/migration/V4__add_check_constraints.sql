DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM pg_constraint
        WHERE conname = 'chk_habitats_biome'
    ) THEN
        ALTER TABLE habitats
        ADD CONSTRAINT chk_habitats_biome
            CHECK (biome IN ('FOREST', 'DESERT', 'OCEAN'));
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM pg_constraint
        WHERE conname = 'chk_creatures_danger_level'
    ) THEN
        ALTER TABLE creatures
        ADD CONSTRAINT chk_creatures_danger_level
            CHECK (danger_level IN ('LOW', 'MEDIUM', 'HIGH'));
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM pg_constraint
        WHERE conname = 'chk_creatures_condition'
    ) THEN
        ALTER TABLE creatures
        ADD CONSTRAINT chk_creatures_condition
            CHECK (condition IN ('STABLE', 'QUARANTINED', 'CRITICAL'));
    END IF;
END $$;