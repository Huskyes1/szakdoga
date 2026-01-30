package application.controller;

import application.dao.TermekDAO;
import application.dao.UserDAO;
import application.model.Termek;
import application.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class KutyushopController {

    @Autowired
    private UserDAO userDAO;
    @Autowired
    private TermekDAO termekDAO;

    @Autowired
    public String getTermekInfo() {
        return "termek1";
    }

    @GetMapping(value = "/")
    public String init(Model model) {
        User user = new User();
        Termek termek = new Termek();
        Termek egytermek = termekDAO.getTermekById(2);
        termek.setNev(egytermek.getNev());
        termek.setAr(egytermek.getAr());

        Termek termek2 = new Termek();
        Termek kettermek = termekDAO.getTermekById(8);
        termek2.setNev(kettermek.getNev());
        termek2.setAr(kettermek.getAr());

        Termek termek3 = new Termek();
        Termek haromtermek = termekDAO.getTermekById(12);
        termek3.setNev(haromtermek.getNev());
        termek3.setAr(haromtermek.getAr());

        Termek termek4 = new Termek();
        Termek negytermek = termekDAO.getTermekById(14);
        termek4.setNev(negytermek.getNev());
        termek4.setAr(negytermek.getAr());

        Termek termek5 = new Termek();
        Termek ottermek = termekDAO.getTermekById(23);
        termek5.setNev(ottermek.getNev());
        termek5.setAr(ottermek.getAr());

        Termek akciosTermek = new Termek();
        Termek elsoAkciosTermek = termekDAO.getTermekById(1);
        akciosTermek.setNev(elsoAkciosTermek.getNev());
        akciosTermek.setAr(elsoAkciosTermek.getAr());
        akciosTermek.setAkcio(elsoAkciosTermek.getAkcio());

        Termek akciosTermek2 = new Termek();
        Termek masodikAkciosTermek = termekDAO.getTermekById(5);
        akciosTermek2.setNev(masodikAkciosTermek.getNev());
        akciosTermek2.setAr(masodikAkciosTermek.getAr());
        akciosTermek2.setAkcio(masodikAkciosTermek.getAkcio());

        Termek akciosTermek3 = new Termek();
        Termek harmadikAkciosTermek = termekDAO.getTermekById(11);
        akciosTermek3.setNev(harmadikAkciosTermek.getNev());
        akciosTermek3.setAr(harmadikAkciosTermek.getAr());
        akciosTermek3.setAkcio(harmadikAkciosTermek.getAkcio());

        Termek akciosTermek4 = new Termek();
        Termek negyedikAkciosTermek = termekDAO.getTermekById(13);
        akciosTermek4.setNev(negyedikAkciosTermek.getNev());
        akciosTermek4.setAr(negyedikAkciosTermek.getAr());
        akciosTermek4.setAkcio(negyedikAkciosTermek.getAkcio());

        Termek akciosTermek5 = new Termek();
        Termek otodikAkciosTermek = termekDAO.getTermekById(15);
        akciosTermek5.setNev(otodikAkciosTermek.getNev());
        akciosTermek5.setAr(otodikAkciosTermek.getAr());
        akciosTermek5.setAkcio(otodikAkciosTermek.getAkcio());

        model.addAttribute("user", user);
        model.addAttribute("termek", termek);
        model.addAttribute("termek2", termek2);
        model.addAttribute("termek3", termek3);
        model.addAttribute("termek4", termek4);
        model.addAttribute("termek5", termek5);

        model.addAttribute("akciosTermek", akciosTermek);
        model.addAttribute("akciosTermek2", akciosTermek2);
        model.addAttribute("akciosTermek3", akciosTermek3);
        model.addAttribute("akciosTermek4", akciosTermek4);
        model.addAttribute("akciosTermek5", akciosTermek5);


        return "index";
    }

	/*@GetMapping(value = "/")
	public String listUser(Model model) {
		model.addAttribute("user", userDAO.listUsers());

		return "index";
	}*/

    @PostMapping(value = "/add")
    public String addUser(@RequestParam("name") String name, @RequestParam("email") String email, @RequestParam("password") String password, @RequestParam("telefonszam") String telefonszam, @RequestParam("iranyitoszam") String iranyitoszam, @RequestParam("telepules") String telepules, @RequestParam("utca") String utca, @RequestParam("hazszam_ajto") String hazszam_ajto) {
        User user = new User(name, email, password, 1, 0, telefonszam, iranyitoszam, telepules, utca, hazszam_ajto);
        System.out.println("in theory we got here");
        userDAO.insertUser(user);

        return "redirect:/";
    }

    @GetMapping(value = "/delete/{id}")
    public String deleteUser(@PathVariable("id") int id) {
        userDAO.deleteUser(id);

        return "redirect:/";
    }

    @PostMapping(value = "/edit/{id}")
    public String editUser(@PathVariable("id") int id, Model model) {
        User user = userDAO.getUserById(id);
        model.addAttribute("user", user);

        return "index";
    }

    @PostMapping(value = "/update/{id}")
    public String updateUser(@PathVariable("id") int id, @RequestParam("name") String name, @RequestParam("email") String email, @RequestParam("password") String password, @RequestParam("telefonszam") String telefonszam/*, @RequestParam("iranyitoszam") String iranyitoszam, @RequestParam("telepules") String telepules, @RequestParam("utca") String utca, @RequestParam("hazszam_ajto") String hazszam_ajto*/) {
        userDAO.updateUser(id, name, email, password, /*isActive, hirlevelE, */telefonszam/*, iranyitoszam, telepules, utca, hazszam_ajto*/);

        return "index";
    }

    @PostMapping(value = "/login")
    public String loggedInUser(@RequestParam("email") String email, @RequestParam("password") String password) {
        userDAO.loginBrains(email, password);

        return "redirect:/";
    }

    @GetMapping(value = "/webshop")
    public String toWebShop(Model model) {
        User user = new User();
        model.addAttribute("user", user);
        return "webshop";
    }

    @GetMapping(value = "/cart")
    public String toCart(Model model) {
        User user = new User();
        model.addAttribute("user", user);
        return "cart";
    }

    @GetMapping(value = "/item")
    public String toItem(Model model) {
        User user = new User();
        model.addAttribute("user", user);
        return "item";
    }

    @GetMapping(value = "/payment")
    public String toPayment(Model model) {
        return "payment";
    }

}