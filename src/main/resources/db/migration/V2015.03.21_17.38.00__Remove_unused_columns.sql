SET search_path = public, pg_catalog;

ALTER TABLE t_user DROP COLUMN activated;

ALTER TABLE t_user DROP COLUMN activation_key;

ALTER TABLE t_user DROP COLUMN first_name;

ALTER TABLE t_user DROP COLUMN lang_key;

ALTER TABLE t_user DROP COLUMN last_name;