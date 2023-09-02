package lk.ijse.hibernet.util;

import lk.ijse.hibernet.entity.Customer;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

/**
 * @author : Jayani_Arunika  9/2/2023 - 1:59 AM
 * @since : v0.01.0
 **/

public class SessionFactoryConfiguration {
    private static SessionFactoryConfiguration sessionFactoryConfiguration;
    private SessionFactory sessionFactory;


    private SessionFactoryConfiguration(){
        Configuration configuration = new Configuration().configure().addAnnotatedClass(Customer.class);
         sessionFactory = configuration.buildSessionFactory();
    }

    public static SessionFactoryConfiguration getInstance(){
        return (sessionFactoryConfiguration==null)
                ?sessionFactoryConfiguration = new SessionFactoryConfiguration()
                :sessionFactoryConfiguration;
    }
    public Session getSession(){return sessionFactory.openSession();}

}
