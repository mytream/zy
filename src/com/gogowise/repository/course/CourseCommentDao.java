package com.gogowise.repository.course;

import com.gogowise.repository.ModelDao;
import com.gogowise.domain.course.CourseComment;
import com.gogowise.domain.Pagination;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 11-11-22
 * Time: 下午2:34
 * To change this template use File | Settings | File Templates.
 */
public interface CourseCommentDao extends ModelDao<CourseComment> {

    public List<CourseComment> findByCourseId(Pagination pagination,Integer cid);

}