ATTACH TABLE _ UUID '17d8770a-22a3-44b5-9c8a-ecd9458d97ac'
(
    `event_date` Date,
    `event_time` DateTime,
    `event_time_microseconds` DateTime64(6),
    `metric` LowCardinality(String),
    `value` Float64
)
ENGINE = MergeTree
PARTITION BY toYYYYMM(event_date)
ORDER BY (event_date, event_time)
SETTINGS index_granularity = 8192
