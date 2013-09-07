package com.gogowise.repository.user;

import com.gogowise.repository.ModelDao;
import com.gogowise.domain.Pagination;
import com.gogowise.domain.live.UserFans;

import java.util.List;

public interface UserFansDao extends ModelDao<UserFans> {

    public UserFans findByUserAndFans(Integer userID, Integer fanID);

    public List<UserFans> findAllFansForUser(Integer userID,Pagination pagination);

    public List<UserFans> findUsersAsFans(Integer fansID,Pagination pagination);

}