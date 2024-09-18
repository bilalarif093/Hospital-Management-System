package hospital.management.system;
import java.sql.*;
public class DTO_hms implements DAO_more_methods{    
    
    public void insertStaticQueryIntoPatient(){
        try{
            Connection con = Database.getConnection();
            Statement stm = con.createStatement();
            int rows = stm.executeUpdate("insert into patient(name,medical_problem,age,ph_no) values('Tariq','fever',30,'0343-7894566');");
            if (rows > 0) {
                System.out.println("data inserted");
            }
            else{
                System.out.println("Something went wrong! data not insert");
            }   
        }
        catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
        catch(NullPointerException ex){
            System.out.println(ex.getMessage());
        }
        catch(Exception ex){
            System.out.println(ex.getMessage());
        }
    }

    @Override
    public void insertDynamicQueryIntoPatient(Patient obj){
        try{
            Connection con = Database.getConnection();
            PreparedStatement ps = con.prepareStatement("insert into patient(name,medical_problem,age,ph_no) values (?,?,?,?)");
            //ps.set(position, value);
            ps.setString(1, obj.getName());
            ps.setString(2, obj.getMedical_problem());
            ps.setInt(3, obj.getAge());
            ps.setString(4, obj.getPh_no());
            int rows = ps.executeUpdate();
            if(rows > 0){
                System.out.println("row inserted");
            }
            else{
                System.out.println("not inserted");
            }
            
        }catch(NullPointerException ex){
            System.out.println(ex.getMessage());
        }
        catch(SQLException ex){
            System.out.println(ex.getMessage());        
        }
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    }

    @Override
    public void insertStoreProcedureIntoPatient(Patient obj){
        try{
            Connection con = Database.getConnection();
            CallableStatement cs = con.prepareCall("call patientInsertByDynamicValues(?,?,?,?);");
            //in variable
            cs.setString(1, obj.getName());
            cs.setString(2, obj.getMedical_problem());
            cs.setInt(3, obj.getAge());
            cs.setString(4, obj.getPh_no());                        
            int rows = cs.executeUpdate();            
            if (rows>0) {
                System.out.println("inserted");
            }
            else{
                System.out.println("not insert");
            }           
        }
        catch(NullPointerException ex){
            System.out.println(ex.getMessage());        
        }
        catch(SQLException ex){
            System.out.println(ex.getMessage());
        }







        
    }
    
    @Override
    public void updatePatientProcedure(Patient obj, int p_id) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void countPatientByAgeProcedure(int newAge) {
        try{
            Connection con = Database.getConnection();
            CallableStatement cs =  con.prepareCall("call countPatientByAge(?,?);");
            //in
            cs.setInt(1, newAge);
            //out
            
            cs.registerOutParameter(2, Types.INTEGER);            
            int rows = cs.executeUpdate();
            if (rows>0) {
                int count = cs.getInt(2);
                System.out.println("Patient Age "+newAge+" Count = "+count);
            }
            else{
                System.out.println("something!went wrong...");
            }                        
        }
        catch(NullPointerException ex){
            System.out.println(ex.getMessage());
        }
        catch(SQLException ex){
            System.out.println(ex.getMessage());
        }        
    }

    @Override
    public void deletePatientById(int p_Id){
        try{
            Connection con = Database.getConnection();
            CallableStatement cs = con.prepareCall("call deletePatient(?);");
            //handle in type variable
            cs.setInt(1, p_Id);
            int rows = cs.executeUpdate();
            if (rows > 0) {
                System.out.println("data deleted");
            }
            else {
                System.out.println("something!went wrong");
            }
        }
        catch(NullPointerException ex){
            System.out.println(ex.getMessage());
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        
        }
    }
    @Override
    public void updatePatientById(int p_id, Patient obj) throws SQLException {
        try{
            Connection con = Database.getConnection();
            CallableStatement cs = con.prepareCall("call updatePatient(?,?,?,?,?);");
            //handle in type variable
            cs.setInt(1, p_id);
            cs.setString(2, obj.getName());
            cs.setString(3, obj.getMedical_problem());
            cs.setInt(4, obj.getAge());
            cs.setString(5, obj.getPh_no());
            int rows = cs.executeUpdate();
            if (rows > 0) {
                System.out.println("data updated");
            }
            else {
                System.out.println("something!went wrong");
            }
        }
        catch(NullPointerException ex){
            System.out.println(ex.getMessage());
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        
        }
    }
    
}
