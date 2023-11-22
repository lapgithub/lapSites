
关键词 “必须”("MUST")、“一定不可/一定不能”("MUST NOT")、“需要”("REQUIRED")、
“将会”("SHALL")、“不会”("SHALL NOT")、“应该”("SHOULD")、“不该”("SHOULD NOT")、
“推荐”("RECOMMENDED")、“可以”("MAY")和”可选“("OPTIONAL")的详细描述可参见RFC 2119[http://www.ietf.org/rfc/rfc2119.txt]

## 字段定义规范
- 每个表**必须**有 前缀`hay_`字段
- 每个表**必须**有`created_at`字段，对应`Eloquent`模型的`CREATED_AT`常量，特殊情况例外
- 每个表**必须**有`update_at`字段，对应`Eloquent`模型的`UPDATE_AT`常量，特殊情况例外
- 每个表**必须**有`deleted_at`字段，对应`Eloquent`模型的软删除字段，特殊情况例外，如：不会有删除操作的表
- 业务需求中有按最后更新时间排序的表 **必须** 有 `updated_at` 字段
- 表示精确到秒的时间字段定义 **必须** 是 `datetime not null`, **推荐** 使用动词过去式 + `_at`, , 如：发布时间 pubdate_at
- 表示精确到日期的字段定义 **必须** 是 `date not null`,  **推荐** 使用动词过去式 + `_date`, 如：计划上架日期 added_date
- `json`形式的数据**可以**用`json`格式存储和`varchar`字符串格式。
- 表示数量的字段**推荐**使用`quantity`, 表示总数的字段**推荐**使用`total`, **不该**使用`count`
- 布尔值 **需要** 使用 (`is_` | `should_` | `need_` | `must_` | `has_`) 作为前缀,
  字段定义 **必须** 是 `tinyint(1) unsigned not null default 0`，`0` 表示 `false`, `1` 表示 `true`
- 表示单据编号字段 **必须** 使用 varchar, 字段名以 `_code` 为后缀
- 表示状态的字段 **必须** 使用 tinyint, 默认值为 0, 且 0 不能有业务含义
- 时间字段根据业务场景 **建议** 使用 datetime

## 索引定义规范
- index 普通索引所有使用前缀 idx_字段名称
- unique  唯一所以必须使用前缀uk_或uniq_字段名称

## 例如：
    CREATE TABLE `hay_lottery_activity`
    (
    `id`         int(11)       NOT NULL AUTO_INCREMENT,
    `title`      varchar(100)  NOT NULL DEFAULT '' COMMENT '活动标题',
    `remarks`    varchar(2000) NOT NULL DEFAULT '' COMMENT '规则描述',
    `start_date` datetime      NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '开始时间',
    `end_date`   datetime      NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '结束时间',
    `is_close`   tinyint(3)    NOT NULL DEFAULT '0' COMMENT '是否关闭:{1:是,2:否}',
    `extra`      varchar(2000) NOT NULL DEFAULT '' COMMENT '扩展字段json',
    `created_at` datetime      NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` datetime      NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `deleted_at` datetime      NOT NULL DEFAULT '1970-01-01 08:00:01',
    PRIMARY KEY (`id`),
    KEY          `idx_update_deleted` (`updated_at`,`deleted_at`),
    KEY          `idx_start_end_is_close_update_deleted` (`start_date`,`end_date`,`is_close`,`updated_at`,`deleted_at`)
    ) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin
