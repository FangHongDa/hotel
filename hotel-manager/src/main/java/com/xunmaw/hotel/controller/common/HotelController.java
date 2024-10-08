package com.xunmaw.hotel.controller.common;

import com.xunmaw.hotel.response.AjaxResult;
import com.xunmaw.hotel.response.ResponseTool;
import com.xunmaw.hotel.service.HotelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/hotel")
public class HotelController {
    @Autowired
    private HotelService hotelService;

    @GetMapping
    public AjaxResult getAllHotel(){

        return ResponseTool.success(hotelService.selectAll());
    }
}
