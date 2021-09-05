package com.kxf.meeting.mapper;

import com.kxf.meeting.model.Meeting;
import com.kxf.meeting.model.MeetingDTO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MeetingMapper {

    /**
     * 添加会议
     *
     * @param meeting Meeting
     * @return Integer
     */
    Integer addMeeting(Meeting meeting);

    /**
     * 添加参与者
     *
     * @param meetingid 会议Id
     * @param mps       参加会议的员工的员工ID
     */
    void addParticipants(@Param("meetingid") Integer meetingid, @Param("mps") Integer[] mps);

    /**
     * 分页查询获得所有meeting
     *
     * @param meetingDTO MeetingDTO
     * @param page       页数
     * @param pagesize   查几条数据
     * @return
     */
    List<MeetingDTO> listMeetingDTOs(@Param("mdto") MeetingDTO meetingDTO, @Param("page") Integer page,
                                     @Param("pagesize") Integer pagesize);

    /**
     * 获取员工数量
     *
     * @param meetingDTO MeetingDTO
     * @return Long
     */
    Long getTotal(@Param("mdto") MeetingDTO meetingDTO);

    /**
     * 根据meetingid获取会议信息
     *
     * @param meetingid Integer
     * @return MeetingDTO
     */
    Meeting getMeetingByid(Integer meetingid);

    /**
     * 根据employeeid获取会议信息
     *
     * @param employeeid Integer
     * @return List<Meeting>
     */
    List<Meeting> getMeetingById(Integer employeeid);
    Meeting getMeetingByname(String meetingname);
    /**
     * 获得取消会议
     *
     * @return List<Meeting>
     */
    List<Meeting> getCancelMeeting();

    /**
     * 获取当前用户预订的会议
     *
     * @param employeeid Integer
     * @return List<MeetingDTO>
     */
    List<MeetingDTO> getmeetingofmybook(Integer employeeid);

    /**
     * 撤销会议的操作
     *
     * @param meetingid      会议id
     * @param canceledreason 撤销原因
     */
    void cancelmeeting(@Param("meetingid") Integer meetingid, @Param("canceledreason") String canceledreason);
}
