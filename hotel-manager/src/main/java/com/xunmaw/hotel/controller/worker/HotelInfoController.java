package com.xunmaw.hotel.controller.worker;

import com.xunmaw.hotel.entity.Hotel;
import com.xunmaw.hotel.response.AjaxResult;
import com.xunmaw.hotel.response.ResponseTool;
import com.xunmaw.hotel.service.HotelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/op/hotel")
public class HotelInfoController {

    @Autowired
    private HotelService hotelService;

    @RequestMapping(value = "/update")
    public AjaxResult updateHotel(int hotelId, String hotelName, String phone, String telephone, String email, String address, String website){
        Hotel hotel = new Hotel(hotelName,phone,telephone,email,address,website);
        hotel.setHotelId(hotelId);
        hotelService.update(hotel);
        return ResponseTool.success("修改成功");
    }

}
