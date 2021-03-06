package com.gogowise.rep.competition.enity;


import com.gogowise.rep.AbstractPersistence;
import com.gogowise.rep.user.enity.BaseUser;

import javax.persistence.Entity;
import javax.persistence.OneToOne;


@Entity
public class Subject extends AbstractPersistence {
    private String name;
    @OneToOne
    private BaseUser owner;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public BaseUser getOwner() {
        return owner;
    }

    public void setOwner(BaseUser owner) {
        this.owner = owner;
    }
}
