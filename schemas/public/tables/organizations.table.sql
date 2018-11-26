CREATE TABLE IF NOT EXISTS public.organizations
(
  id   SERIAL NOT NULL,
  name TEXT   NOT NULL,
  code TEXT   NOT NULL,
  CONSTRAINT organizations_pkey
  PRIMARY KEY (id)
);

ALTER TABLE public.organizations
  ADD CONSTRAINT organizations_code_check_length
CHECK ((length(code) > 2) AND (length(code) < 7));

ALTER TABLE public.organizations
  ADD CONSTRAINT organizations_name_check_length
CHECK ((length(name) > 2) AND (length(name) < 36));

