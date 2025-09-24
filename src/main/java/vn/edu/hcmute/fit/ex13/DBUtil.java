package vn.edu.hcmute.fit.ex13;

import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class DBUtil {
    private static final EntityManagerFactory emf =
            Persistence.createEntityManagerFactory("EmailPU");

    public static EntityManagerFactory getEmFactory() {
        return emf;
    }
}
