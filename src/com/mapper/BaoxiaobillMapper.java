package com.mapper;

import com.pojo.Baoxiaobill;
import com.pojo.BaoxiaobillExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface BaoxiaobillMapper {
    long countByExample(BaoxiaobillExample example);

    int deleteByExample(BaoxiaobillExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Baoxiaobill record);

    int insertSelective(Baoxiaobill record);

    List<Baoxiaobill> selectByExample(BaoxiaobillExample example);

    Baoxiaobill selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Baoxiaobill record, @Param("example") BaoxiaobillExample example);

    int updateByExample(@Param("record") Baoxiaobill record, @Param("example") BaoxiaobillExample example);

    int updateByPrimaryKeySelective(Baoxiaobill record);

    int updateByPrimaryKey(Baoxiaobill record);
}