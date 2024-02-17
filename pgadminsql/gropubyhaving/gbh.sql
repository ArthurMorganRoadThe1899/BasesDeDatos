CREATE TABLE champion(
    cnum VARCHAR(4),
    cname VARCHAR(22),
    tipo VARCHAR(26),
    precio SMALLINT,
    fecha data,
    PRIMARY KEY (cnum)
    CONSTRAINT rulesType CHECK (tipo IN ('Asesino', 'Mago', 'Carry'))
);

INSERT INTO champion(cnum, cname, tipo, precio, fecha)
VALUES
('C1', 'Akali', 'Asesino', 790, '11-5-2019'),
('C2', 'Brand', 'Asesino', 975, '24-9-2019'),
('C3', 'Caitlyn', 'Mago', 880, '1-1-2020'),
('C4', 'Diana', 'Carry', 975, '24-9-2019'),
('C5', 'Draven', 'Carry', NULL, '11-5-2019'),
('C6', 'Elisse', 'Mago', 975, '11-5-2019')