-- +goose Up
CREATE DATABASE IF NOT EXISTS analytics;

-- +goose Down
DROP DATABASE IF EXISTS analytics;
