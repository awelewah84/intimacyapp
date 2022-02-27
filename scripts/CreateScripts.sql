CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

----------------***************************************************----------------------

-- Table: public.accessControl

DROP TABLE IF EXISTS public."accessControl";

CREATE TABLE IF NOT EXISTS public."accessControl"
(
    "ID" serial NOT NULL,
    "UserUID" uuid DEFAULT uuid_generate_v4 (),
    "Username" character varying(35) NOT NULL,
    "Password" character varying(35) NOT NULL,
    "Scope" character varying(35),
    "DateCreated" timestamp with time zone,
    "Status" boolean
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."accessControl"
    OWNER to postgres;
	
	
----------------***************************************************----------------------

-- Table: public.eventDetails

DROP TABLE IF EXISTS public."eventDetails";

CREATE TABLE IF NOT EXISTS public."eventDetails"
(
    "ID" serial NOT NULL,
    "EventUID" uuid DEFAULT uuid_generate_v4 (),
    "ParentUID" uuid,
    "Name" character varying(35),
    "Description" character varying(35),
    "EventType" character varying(35),
    "EventClass" character varying(35),
    "StartDate" timestamp with time zone,
    "StopDate" timestamp with time zone,
    "EventStatus" boolean,
    "Monitored" boolean,
    "CreatedBy" character varying(35),
    "DateCreated" timestamp with time zone
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."eventDetails"
    OWNER to postgres;
	
----------------***************************************************----------------------

-- Table: public.eventTracker

DROP TABLE IF EXISTS public."eventTracker";

CREATE TABLE IF NOT EXISTS public."eventTracker"
(
    "ID" serial NOT NULL,
    "EventUID" uuid,
    "UserUID" uuid,
    "TrackerType" character varying(35),
    "ActivityStamp" time with time zone
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."eventTracker"
    OWNER to postgres;
	
	
----------------***************************************************----------------------

-- Table: public.user

DROP TABLE IF EXISTS public."user";

CREATE TABLE IF NOT EXISTS public."user"
(
    "ID" serial NOT NULL,
    "UserGUID" uuid DEFAULT uuid_generate_v4 (),
    "Username" character varying(35) NOT NULL,
    "UserType" character varying(35) NOT NULL,
    "DateCreated" timestamp with time zone,
    "Status" boolean
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."user"
    OWNER to postgres;
	
----------------***************************************************----------------------

-- Table: public.userActivity

DROP TABLE IF EXISTS public."userActivity";

CREATE TABLE IF NOT EXISTS public."userActivity"
(
    "ID" serial NOT NULL,
    "UserUID" uuid,
    "LoginTS" timestamp with time zone,
    "ActivityType" character varying(35)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."userActivity"
    OWNER to postgres;