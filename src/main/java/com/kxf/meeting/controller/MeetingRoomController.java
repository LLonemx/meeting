package com.kxf.meeting.controller;

import com.kxf.meeting.model.MeetingRoom;
import com.kxf.meeting.service.MeetingRoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MeetingRoomController {

    @Autowired
    private MeetingRoomService meetingRoomService;

    /**
     * 会议室
     *
     * @param model
     * @return meetingrooms页面
     */
    @RequestMapping("/meetingrooms")
    public String meetingrooms(Model model) {
        model.addAttribute("mrs", meetingRoomService.getAllMr());

        return "meetingrooms";
    }

    /**
     * 会议室详情页面
     *
     * @param roomid roomid
     * @param model
     * @return roomdetails
     */
    @RequestMapping("/roomdetails")
    public String roomdetails(Integer roomid, Model model) {
        model.addAttribute("mr", meetingRoomService.getMrById(roomid));
        return "roomdetails";
    }

    /**
     * 更新会议房间信息
     *
     * @param meetingRoom MeetingRoom
     * @return 更新成功返回meetingrooms   失败则继续在修改页面
     */
    @RequestMapping("/updateroom")
    public String updateroom(MeetingRoom meetingRoom) {
        Integer result = meetingRoomService.updateroom(meetingRoom);
        if (result == 1) {
            return "redirect:/meetingrooms";
        } else {
            return "forward:/roomdetails";
        }
    }

    /**
     * 添加会议室页面
     *
     * @return addmeetingroom页面
     */
    @RequestMapping("/admin/addmeetingroom")
    public String addmeetingroom() {
        return "addmeetingroom";
    }

    /**
     * 添加会议室操作
     *
     * @param meetingRoom MeetingRoom
     * @return 成功返回到meetingrooms页面 失败留在当前页面
     */
    @RequestMapping("/admin/doAddMr")
    public String doAddMr(MeetingRoom meetingRoom) {
        Integer result = meetingRoomService.addMr(meetingRoom);
        return "redirect:/meetingrooms";
    }
}
