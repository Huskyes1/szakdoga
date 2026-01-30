package application.model;

import java.io.Serializable;

public class User implements Serializable {

    private static final long serialVersionUID = 1L;

    int id;
    String name;
    private String email;
    private String password;
    private int isActive;
    private int hirlevelE;
    private String telefonszam;
    private String iranyitoszam;
    private String telepules;
    private String utca;
    private String hazszam_ajto;

    public User() {
    }

    public User(String name, String email, String password, int isActive, int hirlevelE, String telefonszam, String iranyitoszam, String telepules, String utca, String hazszam_ajto) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.isActive = isActive;
        this.hirlevelE = hirlevelE;
        this.telefonszam = telefonszam;
        this.iranyitoszam = iranyitoszam;
        this.telepules = telepules;
        this.utca = utca;
        this.hazszam_ajto = hazszam_ajto;
    }

    public User(int id, String name, String email, String password, int isActive, int hirlevelE, String telefonszam, String iranyitoszam, String telepules, String utca, String hazszam_ajto) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.password = password;
        this.isActive = isActive;
        this.hirlevelE = hirlevelE;
        this.telefonszam = telefonszam;
        this.iranyitoszam = iranyitoszam;
        this.telepules = telepules;
        this.utca = utca;
        this.hazszam_ajto = hazszam_ajto;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int isActive() {
        return isActive;
    }

    public void setActive(int active) {
        isActive = active;
    }

    public int isHirlevelE() {
        return hirlevelE;
    }

    public void setHirlevelE(int hirlevelE) {
        this.hirlevelE = hirlevelE;
    }

    public String getTelefonszam() {
        return telefonszam;
    }

    public void setTelefonszam(String telefonszam) {
        this.telefonszam = telefonszam;
    }

    public String getIranyitoszam() {
        return iranyitoszam;
    }

    public void setIranyitoszam(String iranyitoszam) {
        this.iranyitoszam = iranyitoszam;
    }

    public String getTelepules() {
        return telepules;
    }

    public void setTelepules(String telepules) {
        this.telepules = telepules;
    }

    public String getUtca() {
        return utca;
    }

    public void setUtca(String utca) {
        this.utca = utca;
    }

    public String getHazszam_ajto() {
        return hazszam_ajto;
    }

    public void setHazszam_ajto(String hazszam_ajto) {
        this.hazszam_ajto = hazszam_ajto;
    }
}
