CREATE TABLE public."client"
(
	"code" integer,
	"naame" character varying(25),
	"surname" character varying(45),
	"age" integer,
	"nphone" integer,
	"email" character varying,
	PRIMARY KEY ("code")
);

INSERT INTO client (code, naame, surname, age, nphone, email)
VALUES (12, 'Manolo', 'Segarra', 32, 645362216, NULL);

INSERT INTO client (code, naame, surname, age, nphone, email)
VALUES (8, 'Javier', 'Fuentes', 30, 677692422, NULL);

INSERT INTO client (code, naame, surname, age, nphone, email)
VALUES (3, 'Pablo', NULL, 18, 645362216, NULL);

INSERT INTO client (code, naame, surname, age, nphone, email)
VALUES (13, 'Tomas', 'Navarro', 41, 666666888, NULL);

INSERT INTO client (code, naame, surname, age, nphone, email)
VALUES (14, 'Marina', 'Garcia', 25, 666666999, NULL);

INSERT INTO client (code, naame, surname, age, nphone, email)
VALUES (15, 'Paco', 'Canos', 23, 666666000, NULL);

INSERT INTO client (code, naame, surname, age, nphone, email)
VALUES (16, 'Rebeca', 'Marin', 62, 66666611, NULL);