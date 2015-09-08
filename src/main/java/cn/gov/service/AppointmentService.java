package cn.gov.service;

import cn.gov.model.Appointment;

import java.util.Date;
import java.util.List;

/**
 * Created by 王勇 on 2015/9/8.
 */
public interface AppointmentService {
    public void insert(Appointment appointment);

    public int update(Appointment appointment);

    public int delete(Integer id);

    public List<Appointment> queryAppointmentByDate(Date begDate, Date endDate);
}
