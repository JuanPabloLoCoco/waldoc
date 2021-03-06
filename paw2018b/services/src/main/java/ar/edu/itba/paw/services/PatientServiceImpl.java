package ar.edu.itba.paw.services;

import ar.edu.itba.paw.interfaces.persistance.DoctorDao;
import ar.edu.itba.paw.interfaces.persistance.PatientDao;
import ar.edu.itba.paw.interfaces.services.PatientService;
import ar.edu.itba.paw.models.*;
import ar.edu.itba.paw.models.exceptions.*;
import org.hibernate.exception.ConstraintViolationException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service("PatientServiceImpl")
public class PatientServiceImpl implements PatientService {

    @Autowired
    private PatientDao patientDao;

    @Autowired
    private DoctorDao doctorDao;

    @Autowired
    private PasswordEncoder passwordEncoder;
    

    private static final Logger LOGGER = LoggerFactory.getLogger(PatientServiceImpl.class);

    @Override
    @Transactional
    public Patient createPatient(String firstName, String lastName, String phoneNumber, String email, String password) throws RepeatedEmailException, NotValidFirstNameException, NotValidLastNameException, NotValidPhoneNumberException, NotValidEmailException, NotValidPasswordException, NotCreatePatientException {
        LOGGER.debug("PatientServiceImpl: createPatient");
        if (firstName == null){
            LOGGER.debug("First Name is null");
            throw new NotValidFirstNameException("firstName can't be null");
        }

        if (firstName.length() == 0){
            LOGGER.debug("First Name of a Patient has 0 characters");
            throw new NotValidFirstNameException("Username firstname can't be empty");
        }

        if (firstName.length() > 45){
            LOGGER.debug("First Name of a Patient is longer than 45 characters. Name given: {}", firstName);
            throw new NotValidFirstNameException("Username firstname maxlength is 50");
        }

        if (lastName == null) {
            LOGGER.debug("Last Name of a Patient is null");
            throw new NotValidLastNameException("last name can't be null");
        }
        if (lastName.length() == 0){
            LOGGER.debug("Last Name of a Patient has 0 characters");
            throw new NotValidLastNameException("Username Lastname can't be empty");
        }

        if (lastName.length() > 45){
            LOGGER.debug("Last Name longer than 45 characters. Last Name: {}", lastName);
            throw new NotValidLastNameException("Username Lastname maxlength is 45");
        }

        if (phoneNumber == null) {
            LOGGER.debug("UserName is null");
            throw new NotValidPhoneNumberException("Username phonenumber can't be null");
        }
        if (phoneNumber.length() == 0){
            LOGGER.debug("PhoneNumber has 0 characters");
            throw new NotValidPhoneNumberException("Username Phonenumber can't be empty");
        }

        if (phoneNumber.length() > 20){
            LOGGER.debug("Phone Number has more than 20 characters. Phone Numbe given is: {}", phoneNumber);
            throw new NotValidPhoneNumberException("phonenumber can't have more than 20 characters");
        }

        if (email == null) {
            LOGGER.debug("Email is null");
            throw new NotValidEmailException("email can't be null");
        }
        if (email.length() > 90){
            LOGGER.debug("Email has more than 90 characters. Email given: {}", email);
            throw new NotValidEmailException("Email can't have more than 90 characters");
        }

        if (password == null){
            LOGGER.debug("Password is empty");
            throw new NotValidPasswordException("password can't be null");
        }

        if (password.length() == 0){
            LOGGER.debug("Password is empty");
            throw new NotValidPasswordException("password can't be empty");
        }
        if (password.length() > 55){
            LOGGER.debug("Password has more than 72 characters. Password given: {}", password);
            throw new NotValidPasswordException("password can't have more than 72 characters");
        }

        if (patientDao.findPatientByEmail(email) != null){
            LOGGER.debug("Repetead Mail");
            throw new RepeatedEmailException();
        }

        String finalpassword = passwordEncoder.encode(password);
        LOGGER.debug("patientDao.createPatient(firstName, lastName, phoneNumber, email, password)");
        LOGGER.debug("First Name: {}", firstName);
        LOGGER.debug("Last Name: {}", lastName);
        LOGGER.debug("Phone Number: {}", phoneNumber);
        LOGGER.debug("Email: {}", email);
        LOGGER.debug("Password: {}", finalpassword);
        Patient patient;
        try{
            patient= patientDao.createPatient(firstName, lastName, phoneNumber, email, finalpassword);
        }catch (RepeatedEmailException | DataIntegrityViolationException | ConstraintViolationException exc1){
            throw new RepeatedEmailException();
        }

        if (patient == null) {
            LOGGER.debug("Error creating Patient");
            throw new NotCreatePatientException("Error on create patient");
        }
        LOGGER.debug("Success. Created patient");
        return patient;
    }

    @Transactional
    @Override
    public Boolean setDoctorId(Patient patient, Doctor doctor) throws NotFoundDoctorException, NotValidPatientIdException, NotValidDoctorIdException, NotCreatePatientException {
        LOGGER.debug("PatientServiceImpl: setDoctorId");
        if (patient == null){
            LOGGER.debug("Patient ID: {} not found", patient);
            throw new NotValidPatientIdException("patientId can't be null");
        }
        if (patient.getPatientId() <= 0){
            LOGGER.debug("Patient ID: {} is negative", patient);
            throw new NotValidPatientIdException("PatientId can't be negative or zero");
        }

        if (doctor == null){
            LOGGER.debug("Doctor ID is null");
            throw new NotValidDoctorIdException("DoctorId can't be null");
        }
        if (doctor.getId() <= 0){
            LOGGER.debug("Doctor ID is negative. ID given: {}", doctor);
            throw new NotValidDoctorIdException("DoctorId can't be negative or zero");
        }
        LOGGER.debug("Calling: doctorDao.findDoctorById(patientId).isPresent()");
        LOGGER.debug("patientID: {}", patient);

        LOGGER.debug("Calling patientDao.setDoctorId(patientId, doctorId)");
        LOGGER.debug("patientID: {}", patient);
        LOGGER.debug("doctorId {}", doctor);
        Boolean ans;
        try {
            ans = patientDao.setDoctorId(patient,doctor);
        } catch (NotCreatePatientException e) {
            LOGGER.trace("Error on set Doctor Id");
            throw new NotCreatePatientException();
        }
        return ans;
    }

    @Override
    public Patient findPatientById(Integer id) throws NotValidPatientIdException, NotCreatePatientException, NotFoundPacientException {
        LOGGER.debug("PatientServiceImpl: findPatientById");
        if (id == null){
            LOGGER.debug("Patient ID null");
            throw new NotValidPatientIdException("patientId can't be null");
        }
        if (id <= 0){
            LOGGER.debug("Patient ID is negative. Patient ID given: {}", id);
            throw new NotValidPatientIdException("PatientId can't be negative or zero");
        }
        LOGGER.debug("find patient by id. ID {}", id);
        Optional<Patient> patientOptional = patientDao.findPatientById(id);

        if (!patientOptional.isPresent()){
            LOGGER.debug("Patient not found");
            throw new NotFoundPacientException("Patient was not found");
        }

        Patient patient = patientOptional.get();

        if (patient == null){
            LOGGER.debug("Patient not found");
            throw new NotFoundPacientException("Patient was not found");
        }
        LOGGER.debug("Patient {}", patient);

        return patient;
    }

    @Override
    @Transactional
    public Patient findPatientByEmail(String email) throws NotValidPatientIdException, NotCreatePatientException, NotFoundPacientException, NotValidEmailException {
        LOGGER.debug("PatientServiceImpl: findPatientByEmail(String email)");
        if (email == null){
            LOGGER.debug("Email is null");
            throw new NotValidEmailException("patient email can't be null");
        }
        if (email.length() == 0){
            LOGGER.debug("Email length is 0");
            throw new NotValidEmailException("Patient email can't be negative or zero");
        }
        if (email.length() > 90){
            LOGGER.debug("Email has more than 90 characters. Email: {}", email);
            throw new NotValidEmailException("PatientMail can't have more than 90 characters");
        }
        LOGGER.debug("Calling patientDao.findPatientByEmail(email)");
        Patient foundPatient = patientDao.findPatientByEmail(email);
        if (foundPatient == null){
            LOGGER.debug("No patient found");
            throw new NotFoundPacientException("Patient was not found");
        }

        foundPatient.getFavorites().size();

        if (foundPatient.getDoctor() != null) {
            LOGGER.debug("Patient is a doctor with id {}", foundPatient.getDoctor().getId());
            foundPatient.getDoctor().getReviews().size();
            // foundPatient.getDoctor().getReviews().size();
        }

        return foundPatient;
    }

    @Override
    @Transactional
    public Verification createToken(final Patient patient) {
        return patientDao.createToken(patient);
    }

    @Override
    @Transactional
    public Optional<Verification> findToken(final String token) {
        Optional<Verification> vt = patientDao.findToken(token);
        if (vt.isPresent()) {
            patientDao.deleteToken(vt.get());
        }
        return vt;
    }

    @Override
    @Transactional
    public Patient confirmUser(String token) throws VerificationNotFoundException {
        Verification verification = null;
        LOGGER.debug("Patient Service: Confirm user Service");
        LOGGER.debug("Finding token");
        Optional<Verification> vt = patientDao.findToken(token);

        if (vt.isPresent()) {
            LOGGER.debug("Token Found");
            verification = vt.get();
            patientDao.deleteToken(verification);
        } else {
            throw new VerificationNotFoundException();
        }

        Patient patient = verification.getPatient();
        // Optional<Patient> ans = patientDao.findPatientById(patient.getId());
        // Patient newPatient = ans.get();

        LOGGER.debug("Found patient with id {}", patient.getId());
        LOGGER.debug("Getting Favorites");
        patient.getFavorites().size();
        LOGGER.debug("Patient favorite size: {}", patient.getFavorites().size());
        LOGGER.debug("Enabling patient");
        patientDao.enableUser(patient);

        return patient;
    }

    @Override
    @Transactional
    public void enableUser(final Patient patient) {
        patientDao.enableUser(patient);
    }



    @Override
    @Transactional
    public void deleteUser(final Patient patient) {
        patientDao.deleteUser(patient);
    }

    @Override
    public List<Appointment> getHistoricalAppointments(Patient patient) {
        List<Appointment> appointmentList = patientDao.getHistoricalAppointments(patient);
        for (Appointment ap: appointmentList){
            ap.getReview();
        }
        return appointmentList;
    }

    @Override
    public List<Appointment> getFutureAppointments(Patient patient) {
        return patientDao.getFutureAppointments(patient);
    }

    @Override
    public List<Favorite> getFavoriteDoctors(Patient patient) {
        return patientDao.getFavoriteDoctors(patient);
    }

    @Override
    public boolean emailTaken(String email) {
        return patientDao.emailTaken(email);
    }

}
