CREATE TABLE IF NOT EXISTS public.users
(
  id              SERIAL                  NOT NULL,
  organization_id INTEGER                 NOT NULL,
  username        TEXT                    NOT NULL,
  email           TEXT                    NOT NULL,
  password        TEXT                    NOT NULL,
  created_date    TIMESTAMP DEFAULT now() NOT NULL,
  created_by      TEXT                    NOT NULL,
  modified_date   DATE,
  modified_by     TEXT,
  CONSTRAINT users_pkey
  PRIMARY KEY (id),
  CONSTRAINT users_organization_id_username_unique
  UNIQUE (organization_id, username),
  CONSTRAINT users_organization_id_email_unique
  UNIQUE (organization_id, email),
  CONSTRAINT users_organization_id_fkey
  FOREIGN KEY (organization_id) REFERENCES organizations
);

ALTER TABLE public.users
  ADD CONSTRAINT users_username_check_length
CHECK ((length(username) > 3) AND (length(username) < 16));

ALTER TABLE public.users
  ADD CONSTRAINT users_email_check_length
CHECK (length(email) < 255);

ALTER TABLE public.users
  ADD CONSTRAINT users_email_check_format
CHECK (validate_email_format(email) = TRUE);

