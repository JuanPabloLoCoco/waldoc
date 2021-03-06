package ar.edu.itba.paw.webapp.dto.appointment;

import ar.edu.itba.paw.models.Appointment;
import ar.edu.itba.paw.webapp.dto.doctor.BasicDoctorDTO;
import ar.edu.itba.paw.webapp.dto.doctor.DoctorDTO;
import ar.edu.itba.paw.webapp.dto.reviews.BasicReviewDTO;

public class PatientAppointmentDTO {
    private String appointmentDay;
    private String appointmentTime;
    private BasicDoctorDTO doctor;
    private BasicReviewDTO review;
    private Integer id;

    public PatientAppointmentDTO (){}

    public PatientAppointmentDTO (Appointment appointment){
        this.appointmentDay = appointment.getAppointmentDay();
        this.appointmentTime = appointment.getAppointmentTime();
        this.doctor = new BasicDoctorDTO(appointment.getDoctor());
        this.review = null;
        this.id = appointment.getId();
        if (appointment.getReview() != null){
            this.review = new BasicReviewDTO(appointment.getReview());
        }
    }

    public String getAppointmentDay() {
        return appointmentDay;
    }

    public void setAppointmentDay(String appointmentDay) {
        this.appointmentDay = appointmentDay;
    }

    public String getAppointmentTime() {
        return appointmentTime;
    }

    public void setAppointmentTime(String appointmentTime) {
        this.appointmentTime = appointmentTime;
    }

    public BasicDoctorDTO getDoctor() {
        return doctor;
    }

    public void setDoctor(BasicDoctorDTO doctor) {
        this.doctor = doctor;
    }

    public BasicReviewDTO getReview() {
        return review;
    }

    public void setReview(BasicReviewDTO review) {
        this.review = review;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
}
