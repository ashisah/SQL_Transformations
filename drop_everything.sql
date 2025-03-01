DO $$ 
DECLARE
    table_name TEXT;
BEGIN
    -- Loop through all tables in the current schema
    FOR table_name IN 
        SELECT tablename
        FROM pg_tables
        WHERE schemaname = 'public'  -- Replace 'public' with your schema name if different
    LOOP
        -- Generate and execute the DROP TABLE command
        EXECUTE 'DROP TABLE IF EXISTS ' || table_name || ' CASCADE';
    END LOOP;
END $$;