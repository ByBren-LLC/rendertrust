BEGIN;
CREATE TABLE IF NOT EXISTS usage_events (
    event_id      UUID PRIMARY KEY,
    created_at    TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    module_id     TEXT NOT NULL,
    creator_id    TEXT NOT NULL,
    units         INTEGER NOT NULL,
    unit_price_usd NUMERIC(10,4) NOT NULL,
    gross_usd     NUMERIC(12,4) GENERATED ALWAYS AS (units * unit_price_usd) STORED
);

CREATE TABLE IF NOT EXISTS ledger_entries (
    id            BIGSERIAL PRIMARY KEY,
    created_at    TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    account_id    TEXT NOT NULL,
    delta_usd     NUMERIC(12,4) NOT NULL,
    ref_event_id  UUID REFERENCES usage_events(event_id)
);
COMMIT;
