package com.kxf.meeting.model;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class MeetingDTO {
    //会议ID
    private Integer meetingid;
    //会议名称
    private String meetingname;
    //开始时间
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date starttime;
    //结束时间
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date endtime;
    //预约时间
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date reservationtime;
    //房间号
    private Integer roomid;
    //预订房间的人的ID
    private Integer reservationistid;
    //预订房间的人的姓名
    private String reservationistname;
    //房间名
    private String roomname;

    public Integer getMeetingid() {
        return meetingid;
    }

    public void setMeetingid(Integer meetingid) {
        this.meetingid = meetingid;
    }

    public String getMeetingname() {
        return meetingname;
    }

    public void setMeetingname(String meetingname) {
        this.meetingname = meetingname;
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

    public Date getReservationtime() {
        return reservationtime;
    }

    public void setReservationtime(Date reservationtime) {
        this.reservationtime = reservationtime;
    }

    public Integer getRoomid() {
        return roomid;
    }

    public void setRoomid(Integer roomid) {
        this.roomid = roomid;
    }

    public Integer getReservationistid() {
        return reservationistid;
    }

    public void setReservationistid(Integer reservationistid) {
        this.reservationistid = reservationistid;
    }

    public String getReservationistname() {
        return reservationistname;
    }

    public void setReservationistname(String reservationistname) {
        this.reservationistname = reservationistname;
    }

    public String getRoomname() {
        return roomname;
    }

    public void setRoomname(String roomname) {
        this.roomname = roomname;
    }

    @Override
    public String toString() {
        return "MeetingDTO{" +
                "meetingid=" + meetingid +
                ", meetingname='" + meetingname + '\'' +
                ", starttime=" + starttime +
                ", endtime=" + endtime +
                ", reservationtime=" + reservationtime +
                ", roomid=" + roomid +
                ", reservationistid=" + reservationistid +
                ", reservationistname='" + reservationistname + '\'' +
                ", roomname='" + roomname + '\'' +
                '}';
    }
}
