package com.xunmaw.hotel.controller.worker;

import com.xunmaw.hotel.entity.Worker;
import com.xunmaw.hotel.service.WorkerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/chat")
public class ChatController {

    @Autowired
    private WorkerService workerService;

    @GetMapping("/worker")
    public List<Worker> getWorker(
            @RequestParam(defaultValue = "") String search) {
        return (List<Worker>) workerService.findAll(search);
    }


}
