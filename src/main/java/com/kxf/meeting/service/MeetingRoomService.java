package com.kxf.meeting.service;

import com.kxf.meeting.mapper.MeetingRoomMapper;
import com.kxf.meeting.model.MeetingRoom;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MeetingRoomService {

    @Autowired
    private MeetingRoomMapper meetingRoomMapper;

    /**
     * 得到所有的会议室
     *
     * @return MeetingRoom
     */
    public List<MeetingRoom> getAllMr() {
        return meetingRoomMapper.getAllMr();
    }

    /**
     * 根据roomid获取对应的会议室
     *
     * @param roomid roomid
     * @return MeetingRoom
     */
    public MeetingRoom getMrById(Integer roomid) {
        return meetingRoomMapper.getMrById(roomid);
    }

    /**
     * 更新会议房间信息
     *
     * @param meetingRoom MeetingRoom
     * @return Integer
     */
    public Integer updateroom(MeetingRoom meetingRoom) {
        return meetingRoomMapper.updateroom(meetingRoom);
    }

    /**
     * 添加会议室操作
     *
     * @param meetingRoom MeetingRoom
     * @return Integer
     */
    public Integer addMr(MeetingRoom meetingRoom) {
        return meetingRoomMapper.addMr(meetingRoom);
    }
}
