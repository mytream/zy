package com.gogowise.rep.android;

import com.gogowise.rep.ModelDao;
import com.gogowise.rep.android.enity.ValidUser;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: AN
 * Date: 12-11-16
 * Time: 下午9:41
 * To change this template use File | Settings | File Templates.
 */
public interface ValidUserDao  extends ModelDao<ValidUser> {
       public List<ValidUser>  findAll();

}
