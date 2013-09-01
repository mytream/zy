package com.gogowise.dao;

import com.gogowise.domain.InterviewAppointer;

import java.util.List;


/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 12-4-1
 * Time: 下午4:46
 * To change this template use File | Settings | File Templates.
 */
public interface InterviewAppointerDao extends ModelDao<InterviewAppointer> {

    public List<InterviewAppointer> findByInterview(Integer interviewId);

    public InterviewAppointer findByInterviewAndUser(Integer interviewId,String userEmail);
}