-- +goose Up
ALTER TABLE analytics.events
    ADD COLUMN IF NOT EXISTS session_id String DEFAULT '';

-- +goose Down
ALTER TABLE analytics.events
    DROP COLUMN IF EXISTS session_id;
