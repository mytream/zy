package com.gogowise.rep.system;

import com.gogowise.rep.ModelDaoImpl;
import com.gogowise.rep.system.system.FeedBackInfo;
import org.springframework.stereotype.Repository;

@Repository("feedbackInfoDao")
public class FeedbackInfoDaoImpl extends ModelDaoImpl<FeedBackInfo> implements FeedbackInfoDao{
}
