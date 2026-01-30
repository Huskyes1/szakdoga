# Kutyushop Webáruház - Projekt Dokumentáció

## 1. Áttekintés
A **Kutyushop** egy Java-alapú webes alkalmazás, amely egy állateledel webáruház alapvető funkcióit látja el. A projekt a **Spring Boot** keretrendszerre épül, és a klasszikus **MVC (Model-View-Controller)** tervezési mintát követi.

## 2. Technológiai Stack
* **Backend:** Java 17+, Spring Boot
* **Adatkezelés:** Spring JDBC (JdbcDaoSupport)
* **Build rendszer:** Maven
* **Frontend:** Szerveroldali renderelés (Thymeleaf/JSP feltételezett a kontrollerek alapján)



## 3. Rendszerarchitektúra
Az alkalmazás logikailag négy fő részre tagozódik:
* **Controller (`application.controller`):** A HTTP kérések fogadása és a navigáció vezérlése (pl. `KutyushopController`).
* **DAO (`application.dao`):** Az adatbázis-műveletek végrehajtása direkt SQL lekérdezésekkel (`UserDAO`, `TermekDAO`).
* **Model (`application.model`):** Az adatok struktúráját leíró POJO osztályok (`User`, `Termek`).
* **Application Root:** A program belépési pontja (`Application.java`).

## 4. Funkcionális Specifikáció
* **Kezdőlap kezelése:** A rendszer az adatbázisból dinamikusan tölti be a kiemelt és akciós termékeket azonosító alapján.
* **Felhasználói CRUD:**
    * **Regisztráció:** Új felhasználó rögzítése névvel, címmel és elérhetőségekkel.
    * **Módosítás:** Meglévő adatok frissítése az adatbázisban.
    * **Törlés:** Felhasználói profil eltávolítása ID alapján.
* **Autentikáció:** Egyszerű bejelentkezési logika e-mail és jelszó ellenőrzésével.
* **Navigáció:** Elkülönített felületek a webshophoz, kosárhoz és a fizetési folyamathoz.



## 5. Adatbázis sémák (Lekérdezések alapján)
A projekt futtatásához az alábbi táblák megléte szükséges az adatbázisban:

### `felh` tábla
* `id` (int, Primary Key)
* `name`, `email`, `password` (varchar)
* `isactive`, `hirlevele` (int/boolean)
* `telefonszam`, `iranyitoszam`, `telepules`, `utca`, `hazszam_ajto` (varchar)

### `termek` tábla
* `id` (int, Primary Key)
* `nev`, `kategoria`, `leiras`, `akcio` (varchar)
* `ar`, `raktartone` (int)

## 6. Telepítési útmutató
1.  Klónozza a projektet, vagy másolja át a forrásfájlokat.
2.  Győződjön meg róla, hogy a Java JDK telepítve van.
3.  Állítsa be az adatbázis elérhetőségét az `application.properties` fájlban (ha létezik).
4.  Futtassa a következő parancsot a projekt gyökerében:
    ```bash
    ./mvnw spring-boot:run
    ```
5.  Az alkalmazás alapértelmezetten a `http://localhost:8080` címen érhető el.
