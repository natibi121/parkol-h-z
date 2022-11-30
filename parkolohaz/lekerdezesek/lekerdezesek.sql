-- A feladatok megoldására elkészített SQL parancsokat illessze be a feladat sorszáma után!
-- 13. feladat
CREATE DATABASE parkolohaz
	CHARACTER SET utf8
	COLLATE utf8_hungarian_ci;
-- ***
-- 15. feladat
SELECT
  COUNT(parkolohely.id) AS `masfeles parkolohelyek szama`
FROM parkolohely
WHERE parkolohely.szelesseg = 1.5
-- ***
-- 16. feladat
UPDATE parkolohely SET jarmutipusId = (SELECT
  jarmutipus.id
FROM jarmutipus
WHERE jarmutipus.nev = 'Elekrtomos gépjármű')
  WHERE felirat="P001"
-- ***
-- 17. feladat
SELECT
  foglalas.ar,
  foglalas.datum
FROM foglalas
  INNER JOIN felhasznalo
    ON foglalas.felhasznaloId = felhasznalo.id
WHERE felhasznalo.nev = "Kovács Anna"
-- ***
-- 18. feladat
SELECT
  SUM(foglalas.ar) AS `szumma tartozas`,
  felhasznalo.nev AS nev
FROM parkolohely
  INNER JOIN jarmutipus
    ON parkolohely.jarmutipusId = jarmutipus.id
  INNER JOIN foglalas
    ON foglalas.parkolohelyId = parkolohely.id
  INNER JOIN felhasznalo
    ON foglalas.felhasznaloId = felhasznalo.id
WHERE foglalas.fizetve = 0
AND jarmutipus.nev = "Motorkerékpár"
GROUP BY foglalas.felhasznaloId
ORDER BY `szumma tartozas` DESC
  LIMIT 1
-- ***
