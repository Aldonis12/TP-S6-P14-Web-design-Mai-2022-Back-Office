package miniprojet.miniprojetbo.Model;

import miniprojet.miniprojetbo.DAO.HibernateDAO;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;


public class Main {
    public static void main(String[] args) throws Exception {
        ApplicationContext context = new ClassPathXmlApplicationContext("Conf.xml");
        HibernateDAO db = context.getBean(HibernateDAO.class);
    }
}
