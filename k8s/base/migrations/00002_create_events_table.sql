-- +goose Up
CREATE TABLE IF NOT EXISTS analytics.events
(
    event_id    String  DEFAULT toString(generateUUIDv4()),
    event_name  String,
    user_id     UInt64,
    created_at  DateTime DEFAULT now()
)
ENGINE = MergeTree()
ORDER BY (event_name, user_id, created_at);

-- +goose Down
DROP TABLE IF EXISTS analytics.events;
