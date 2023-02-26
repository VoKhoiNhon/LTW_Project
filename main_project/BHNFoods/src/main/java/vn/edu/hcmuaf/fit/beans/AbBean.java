package vn.edu.hcmuaf.fit.beans;

import org.jdbi.v3.core.Jdbi;

public abstract class AbBean {

    public abstract boolean insert(Jdbi db);
}
