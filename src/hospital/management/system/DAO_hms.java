package hospital.management.system;
import java.sql.*;
public interface DAO_hms {
    void insertStaticQueryIntoPatient() throws SQLException;
    void insertDynamicQueryIntoPatient(Patient obj) throws SQLException;
    void insertStoreProcedureIntoPatient(Patient obj) throws SQLException;
    void countPatientByAgeProcedure(int newAge)throws SQLException;
    void deletePatientById(int p_Id) throws SQLException;
    void updatePatientById(int p_id,Patient obj) throws SQLException;
    //DAO means data access Object
    //DTO means data transfer object
    
}
