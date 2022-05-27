CREATE TABLE `red_note$local` on cluster clickhouse_server ( 
  user_id String COMMENT '用户id',
  user_name String COMMENT '用户名',
  user_avatar String COMMENT '用户头像',
  note_id String COMMENT '笔记id',
  note_type String COMMENT '笔记类型',
  note_title String COMMENT '笔记标题',
  note_content String COMMENT '笔记内容',
  note_tag String COMMENT '笔记标签',
  images_list String COMMENT '图片列表',
  note_time String COMMENT '笔记发布时间',
  last_update_time String COMMENT '最新更新时间',
  poi_id String COMMENT '位置id',
  poi_name String COMMENT '位置名称',
  like_count Int32 COMMENT '点赞数量',
  collected_count Int32 COMMENT '收藏数量',
  comment_count Int32 COMMENT '评论数量',
  process_time DateTime COMMENT 'etl处理时间'
) ENGINE = ReplicatedReplacingMergeTree('/clickhouse/tables/{shard}/red/red_note$local', '{replica}')  
partition by formatDateTime(process_time, '%Y-%m-%d %H:00:00')
ORDER BY (note_id)
SETTINGS index_granularity = 8192;