package cn.gov.action;

import cn.gov.model.Appointment;
import cn.gov.service.AppointmentService;
import cn.gov.util.AlertUtil;

import java.util.Date;
import java.util.List;

/**
 * Created by 王勇 on 2015/9/8.
 */
public class AppointmentAction extends BasicAction {

    private AppointmentService appointmentService;
    private List<Appointment> list;
    private Appointment appointment;
    private Integer id;

    private Date begDate;
    private Date endDate;

    public String query() {
        list = appointmentService.queryAppointmentByDate(begDate, endDate);
        return "query";
    }

    public String insert() {
        String msg;
        try {
            appointmentService.insert(appointment);
            msg = "登记成功，我们会及时与您联系！";
        }catch (Exception e) {
            msg = "登记失败，请联系管理员！";
        }
        AlertUtil.alertThenGo(response, msg, request.getContextPath()+"/index.html");
        return null;
    }

    public AppointmentService getAppointmentService() {
        return appointmentService;
    }

    public void setAppointmentService(AppointmentService appointmentService) {
        this.appointmentService = appointmentService;
    }

    public List<Appointment> getList() {
        return list;
    }

    public void setList(List<Appointment> list) {
        this.list = list;
    }

    public Appointment getAppointment() {
        return appointment;
    }

    public void setAppointment(Appointment appointment) {
        this.appointment = appointment;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getBegDate() {
        return begDate;
    }

    public void setBegDate(Date begDate) {
        this.begDate = begDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }
}
