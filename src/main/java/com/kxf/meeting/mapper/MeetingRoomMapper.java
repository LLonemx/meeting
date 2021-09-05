package com.kxf.meeting.mapper;

import com.kxf.meeting.model.MeetingRoom;
import com.kxf.meeting.model.RoomDTO;

import java.util.List;

public interface MeetingRoomMapper {

    /**
     * 获取所有的会议室
     *
     * @return MeetingRoom
     */
    List<MeetingRoom> getAllMr();

    /**
     * 根据roomid获取对应的会议室
     *
     * @param roomid roomid
     * @return MeetingRoom
     */
    MeetingRoom getMrById(Integer roomid);

    /**
     * 更新会议房间信息
     *
     * @param meetingRoom MeetingRoom
     * @return Integer
     */
    Integer updateroom(MeetingRoom meetingRoom);

    /**
     * 添加会议室操作
     *
     * @param meetingRoom MeetingRoom
     * @return Integer
     */
    Integer addMr(MeetingRoom meetingRoom);

    /**
     * 得到所有RoomDTO
     *
     * @return List<RoomDTO>
     */
    List<RoomDTO> getAll();

}
