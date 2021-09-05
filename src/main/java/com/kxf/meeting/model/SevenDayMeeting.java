package com.kxf.meeting.model;

import java.util.Date;

public class SevenDayMeeting {

    private String meetingname;
    private String roomname;
    private Date starttime;
    private Date endtime;
    private Integer roomid;
    private Integer meetingid;

    public String getMeetingname() {
        return meetingname;
    }

    public void setMeetingname(String meetingname) {
        this.meetingname = meetingname;
    }

    public String getRoomname() {
        return roomname;
    }

    public void setRoomname(String roomname) {
        this.roomname = roomname;
    }

    public Date getStarttime() {
        return starttime;
    }

    public void setStarttime(Date starttime) {
        this.starttime = starttime;
    }

    public Date getEndtime() {
        return endtime;
    }

    public void setEndtime(Date endtime) {
        this.endtime = endtime;
    }

    public Integer getRoomid() {
        return roomid;
    }

    public void setRoomid(Integer roomid) {
        this.roomid = roomid;
    }

    public Integer getMeetingid() {
        return meetingid;
    }

    public void setMeetingid(Integer meetingid) {
        this.meetingid = meetingid;
    }

    @Override
    public String toString() {
        return "SevenDayMeeting{" +
                "meetingname='" + meetingname + '\'' +
                ", roomname='" + roomname + '\'' +
                ", starttime=" + starttime +
                ", endtime=" + endtime +
                ", roomid=" + roomid +
                ", meetingid=" + meetingid +
                '}';
    }
}
