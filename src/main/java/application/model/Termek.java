package application.model;

public class Termek {
    private int id;
    private String nev;
    private String kategoria;
    private String leiras;
    private int raktartone;
    private int ar;
    private String akcio;
    private String erkezett;

    public Termek() {
    }

    public Termek(String nev, String kategoria, String leiras, int raktartone, int ar, String akcio, String erkezett) {
        this.nev = nev;
        this.kategoria = kategoria;
        this.leiras = leiras;
        this.raktartone = raktartone;
        this.ar = ar;
        this.akcio = akcio;
        this.erkezett = erkezett;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNev() {
        return nev;
    }

    public void setNev(String nev) {
        this.nev = nev;
    }

    public String getKategoria() {
        return kategoria;
    }

    public void setKategoria(String kategoria) {
        this.kategoria = kategoria;
    }

    public String getLeiras() {
        return leiras;
    }

    public void setLeiras(String leiras) {
        this.leiras = leiras;
    }

    public int getRaktartone() {
        return raktartone;
    }

    public void setRaktartone(int raktartone) {
        this.raktartone = raktartone;
    }

    public int getAr() {
        return ar;
    }

    public void setAr(int ar) {
        this.ar = ar;
    }

    public String getAkcio() {
        return akcio;
    }

    public void setAkcio(String akcio) {
        this.akcio = akcio;
    }

    public String getErkezett() {
        return erkezett;
    }

    public void setErkezett(String erkezett) {
        this.erkezett = erkezett;
    }

    @Override
    public String toString() {
        if (akcio == null) {
            return nev + "\n" + ar;
        } else {
            return nev + "\n" + ar + "  " + akcio;
        }
    }
}
