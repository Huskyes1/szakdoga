package application.dao;

import application.model.Termek;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Repository;

import javax.annotation.PostConstruct;
import javax.sql.DataSource;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Repository
public class TermekDAO extends JdbcDaoSupport {
    @Autowired
    DataSource dataSource;

    @PostConstruct
    private void initialize() {
        setDataSource(dataSource);
    }

    /*public void insertUser(User user) {
        String sql = "INSERT INTO felh(name, email, password, isActive, hirlevelE, telefonszam, iranyitoszam, telepules, utca, hazszam_ajto) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        assert getJdbcTemplate() != null;
        getJdbcTemplate().update(sql, user.getName(), user.getEmail(), user.getPassword(), user.isActive(), user.isHirlevelE(), user.getTelefonszam(), user.getIranyitoszam(), user.getTelepules(), user.getUtca(), user.getHazszam_ajto());
    }*/

    public int getMaxID() {
        String sql = "SELECT * FROM termek ORDER BY id ASC";

        List<Map<String, Object>> rows = getJdbcTemplate().queryForList(sql);

        Termek termek = new Termek();
        for (Map<String, Object> row : rows) {
            termek.setId((Integer) row.get("id"));
        }
        return termek.getId() + 1;
    }

    public Termek getTermekById(int id) {
        String sql = "SELECT * FROM termek WHERE id=" + id;
        List<Map<String, Object>> rows = getJdbcTemplate().queryForList(sql);

        List<Termek> result = new ArrayList<Termek>();
        for (Map<String, Object> row : rows) {
            Termek termek = new Termek();
            termek.setAkcio((String) row.get("akcio"));
            termek.setNev((String) row.get("nev"));
            termek.setAr((Integer) row.get("ar"));

            result.add(termek);
        }
        return result.get(0);
    }


}
