CREATE TABLE "user"
(
	"code_user" integer,
	"naame" character varying(26),
	"surname" character varying(46),
    "email" character varying(41),
	"password" character varying(100),
	PRIMARY KEY (code_user)
);

CREATE TABLE "movie"
(
	"title" character varying(46),
	"director" character varying(36),
	"realse_date" date,
	"duration" smallint,
	"desc" text,
	PRIMARY KEY (title, realse_date)
);

CREATE TABLE "series"
(
	"title" character varying(46),
	"creator" character varying(26),
	"realse_date" date,
	"actual_season" integer,
	"desc" text,
	PRIMARY KEY (title, realse_date)
);

CREATE TABLE "type"
(
	idN character varying(5),
	PRIMARY KEY (idN),
    "genero" character varying(16) DEFAULT 'definir',
    CONSTRAINT rulesMovie FOREIGN KEY (movie) REFERENCES movie(title),
    CONSTRAINT rulesSerie FOREIGN KEY (serie) REFERENCES series(title)
); 