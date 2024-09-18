package hospital.management.system;
public class HospitalManagementSystem {
    public static void main(String[] args) {
        DTO_hms dto = new DTO_hms();
//        Patient obj = new Patient(0, "Zubair","Fever", 44, "0312-3343531");
//        dto.insertStoreProcedureIntoPatient(obj);
          dto.deletePatientById(5);
    }
}
