package cn.gov.service.impl;

import cn.gov.dao.AppointmentMapper;
import cn.gov.model.Appointment;
import cn.gov.model.AppointmentExample;
import cn.gov.service.AppointmentService;

import java.util.Date;
import java.util.List;

/**
 * Created by 王勇 on 2015/9/8.
 */
public class AppointmentServiceImpl implements AppointmentService {

    private AppointmentMapper appointmentMapper;

    @Override
    public void insert(Appointment appointment) {
        appointmentMapper.insert(appointment);
    }

    @Override
    public int update(Appointment appointment) {
        return appointmentMapper.updateByPrimaryKeySelective(appointment);
    }

    @Override
    public int delete(Integer id) {
        return appointmentMapper.deleteByPrimaryKey(id);
    }

    @Override
    public List<Appointment> queryAppointmentByDate(Date begDate, Date endDate) {
        AppointmentExample appointmentExample = new AppointmentExample();
        AppointmentExample.Criteria criteria = appointmentExample.createCriteria();
        if (begDate != null) {
            criteria.andDateGreaterThanOrEqualTo(begDate);
        }
        if (endDate != null) {
            criteria.andDateLessThanOrEqualTo(endDate);
        }
        return appointmentMapper.selectByExample(appointmentExample);
    }

    public AppointmentMapper getAppointmentMapper() {
        return appointmentMapper;
    }

    public void setAppointmentMapper(AppointmentMapper appointmentMapper) {
        this.appointmentMapper = appointmentMapper;
    }
}
