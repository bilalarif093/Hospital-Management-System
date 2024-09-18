package hospital.management.system;
import java.sql.*;
public interface DAO_more_methods extends DAO_hms{
    
    void updatePatientProcedure(Patient obj, int p_id) throws SQLException;
    
}
