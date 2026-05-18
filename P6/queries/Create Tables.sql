CREATE SCHEMA IF NOT EXISTS "public";

CREATE TABLE "public"."User"
(
    "id"            bigint NOT NULL,
    "name"          text   NOT NULL,
    "email"         text   NOT NULL,
    "password_hash" text   NOT NULL,
    "role_id"       bigint NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "public"."3D Model"
(
    "id"         bigint NOT NULL,
    "bucket_id"  bigint NOT NULL,
    "created_at" date   NOT NULL,
    "name"       text   NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "public"."Permission"
(
    "id"          bigint  NOT NULL,
    "can_read"    boolean NOT NULL,
    "can_write"   boolean NOT NULL,
    "can_delete"  boolean NOT NULL,
    "3d_model_id" bigint  NOT NULL,
    "user_id"     bigint  NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "public"."Role"
(
    "id"   bigint NOT NULL,
    "name" text   NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "public"."HistoryChange"
(
    "id"             bigint NOT NULL,
    "created_at"     date   NOT NULL,
    "type_change_id" bigint NOT NULL,
    "user_id"        bigint NOT NULL,
    "3d_model_id"    bigint NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "public"."TypeChange"
(
    "id"   bigint NOT NULL,
    "name" text   NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "public"."ModelMetadata"
(
    "id"          bigint NOT NULL,
    "model_id"    bigint NOT NULL,
    "description" text,
    "author_id"   bigint NOT NULL,
    "created_at"  date   NOT NULL,
    PRIMARY KEY ("id")
);

-- Foreign key constraints
-- Schema: public
ALTER TABLE "public"."User"
    ADD CONSTRAINT "fk_User_role_id_Role_id" FOREIGN KEY ("role_id") REFERENCES "public"."Role" ("id");
ALTER TABLE "public"."HistoryChange"
    ADD CONSTRAINT "fk_HistoryChange_type_change_id_TypeChange_id" FOREIGN KEY ("type_change_id") REFERENCES "public"."TypeChange" ("id");
ALTER TABLE "public"."HistoryChange"
    ADD CONSTRAINT "fk_HistoryChange_user_id_User_id" FOREIGN KEY ("user_id") REFERENCES "public"."User" ("id");
ALTER TABLE "public"."HistoryChange"
    ADD CONSTRAINT "fk_HistoryChange_3d_model_id_3D_Model_id" FOREIGN KEY ("3d_model_id") REFERENCES "public"."3D Model" ("id");
ALTER TABLE "public"."Permission"
    ADD CONSTRAINT "fk_Permission_3d_model_id_3D_Model_id" FOREIGN KEY ("3d_model_id") REFERENCES "public"."3D Model" ("id");
ALTER TABLE "public"."Permission"
    ADD CONSTRAINT "fk_Permission_user_id_User_id" FOREIGN KEY ("user_id") REFERENCES "public"."User" ("id");
ALTER TABLE "public"."ModelMetadata"
    ADD CONSTRAINT "fk_ModelMetadata_model_id_3D_Model_id" FOREIGN KEY ("model_id") REFERENCES "public"."3D Model" ("id");
ALTER TABLE "public"."ModelMetadata"
    ADD CONSTRAINT "fk_ModelMetadata_author_id_User_id" FOREIGN KEY ("author_id") REFERENCES "public"."User" ("id");
