package com.gogowise.rep.android;

import com.gogowise.rep.ModelDaoImpl;
import com.gogowise.rep.android.enity.SerialNO;
import org.springframework.stereotype.Repository;

/**
 * Created by IntelliJ IDEA.
 * User: AN
 * Date: 12-12-6
 * Time: 下午5:26
 * To change this template use File | Settings | File Templates.
 */
@Repository("serialNoDao")
public class SerialNoDaoImpl extends ModelDaoImpl<SerialNO> implements SerialNoDao{
    public SerialNO findBySerialNum(String serialNum){
        return findFist("From SerialNO s where s.serialNum=?",serialNum);
    }
}
