package com.kxf.meeting.mapper;

import java.util.List;

public interface MeetingParticipantsMapper {

    /**
     * 通过meetingid获取参加会议的人的employeeid
     *
     * @param meetingid Integer
     * @return List<Integer>
     */
    List<Integer> getAllBymeetingid(Integer meetingid);
}
