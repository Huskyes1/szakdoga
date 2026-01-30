package application.dao;

import application.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Repository;

import javax.annotation.PostConstruct;
import javax.sql.DataSource;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Repository
public class UserDAO extends JdbcDaoSupport {
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
        String sql = "SELECT * FROM felh ORDER BY id ASC";

        List<Map<String, Object>> rows = getJdbcTemplate().queryForList(sql);

        User user = new User();
        for (Map<String, Object> row : rows) {
            user.setId((Integer) row.get("id"));
        }
        return user.getId() + 1;
    }

    public void insertUser(User user) {
        String sql = "INSERT INTO felh(id, name, email, password, isactive, hirlevele, telefonszam, iranyitoszam, telepules, utca, hazszam_ajto) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        getJdbcTemplate().update(sql, getMaxID(), user.getName(), user.getEmail(), user.getPassword(), user.isActive(), user.isHirlevelE(), user.getTelefonszam(), user.getIranyitoszam(), user.getTelepules(), user.getUtca(), user.getHazszam_ajto());
    }

    public List<User> listUsers() {
        String sql = "SELECT * FROM felh";
        List<Map<String, Object>> rows = getJdbcTemplate().queryForList(sql);

        List<User> result = new ArrayList<User>();
        for (Map<String, Object> row : rows) {
            User user = new User();
            user.setId((Integer) row.get("id"));
            user.setName((String) row.get("name"));
            user.setEmail((String) row.get("email"));
            user.setPassword((String) row.get("password"));
            user.setActive((Integer) row.get("isactive"));
            user.setActive((Integer) row.get("hirlevele"));
            user.setTelefonszam((String) row.get("telefonszam"));
            user.setIranyitoszam((String) row.get("iranyitoszam"));
            user.setTelepules((String) row.get("telepules"));
            user.setUtca((String) row.get("utca"));
            user.setHazszam_ajto((String) row.get("hazszam_ajto"));

            result.add(user);
        }

        return result;
    }

    public User getUserById(int id) {
        String sql = "SELECT * FROM felh WHERE id=" + id;
        List<Map<String, Object>> rows = getJdbcTemplate().queryForList(sql);

        List<User> result = new ArrayList<User>();
        for (Map<String, Object> row : rows) {
            User user = new User();
            user.setId((Integer) row.get("id"));
            user.setName((String) row.get("name"));
            user.setEmail((String) row.get("email"));
            user.setPassword((String) row.get("password"));
            user.setActive((Integer) row.get("isactive"));
            user.setHirlevelE((Integer) row.get("hirelevele"));
            user.setTelefonszam((String) row.get("telefonszam"));
            user.setIranyitoszam((String) row.get("iranyitoszam"));
            user.setTelepules((String) row.get("telepules"));
            user.setUtca((String) row.get("utca"));
            user.setHazszam_ajto((String) row.get("hazszam_ajto"));

            result.add(user);
        }

        return result.get(0);
    }

    public void deleteUser(int id) {
        String sql = "DELETE FROM felh WHERE id=" + id;
        getJdbcTemplate().update(sql);
    }

    public void updateUser(int id, String name, String email, String password, String telefonszam) {
        String sql = "UPDATE felh SET name='" + name + "', email='" + email + "', password='" + password + "', isactive='" + 1 + "', hirlevele='" + 0 + "', telefonszam='" + telefonszam + "' WHERE id=" + id;
        getJdbcTemplate().update(sql);
    }

    public boolean loginCheck(String email, String password) {
        String sql = "SELECT * FROM felh";

        List<Map<String, Object>> rows = getJdbcTemplate().queryForList(sql);

        User user = new User();
        for (Map<String, Object> row : rows) {
            user.setEmail((String) row.get("email"));
            user.setPassword((String) row.get("password"));

            if (user.getEmail().equals(email) && user.getPassword().equals(password)) {
                return true;
            }
        }
        return false;
    }

    public void loginBrains(String email, String password) {
        if (loginCheck(email, password)) {
            System.out.println("login gut");
        } else {
            System.out.println("login bat");
        }
    }

    /*public void updateUser(int id, String name, String email, String password, boolean isActive, boolean hirlevelE, String telefonszam, String iranyitoszam, String telepules, String utca, String hazszam_ajto){
        String sql = "UPDATE felh SET name='"+name+"', email='"+email+"', password='"+password+"', isactive='"+isActive+"', hirlevele='"+hirlevelE+"', telefonszam='"+telefonszam+"', iranyitoszam='"+iranyitoszam+"', telepules='"+telepules+"', utca='"+utca+"', hazszam_ajto='"+hazszam_ajto+"' WHERE id="+id;
        getJdbcTemplate().update(sql);
    }*/
}
