package com.xunmaw.hotel.mapper;

import com.xunmaw.hotel.entity.OrderType;
import org.springframework.stereotype.Component;

import java.util.List;


@Component
public interface OrderTypeMapper {
    Integer getCount();
    int deleteByPrimaryKey(Integer typeId);

    int insert(OrderType record);

    int insertSelective(OrderType record);

    OrderType selectByPrimaryKey(Integer typeId);

    int updateByPrimaryKeySelective(OrderType record);

    int updateByPrimaryKey(OrderType record);

    List<OrderType> selectAll(String search);


    int deleteBatch(List<Integer> ids);
}