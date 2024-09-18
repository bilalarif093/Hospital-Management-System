package hospital.management.system;
public class Patient {
    private int p_id;
    private String name;
    private String medical_problem;
    private int age;
    private String ph_no;

    public Patient() {
    }

    public Patient(int p_id, String name, String medical_problem, int age, String ph_no) {
        this.p_id = p_id;
        this.name = name;
        this.medical_problem = medical_problem;
        this.age = age;
        this.ph_no = ph_no;
    }

    public int getP_id() {
        return p_id;
    }

    public void setP_id(int p_id) {
        this.p_id = p_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMedical_problem() {
        return medical_problem;
    }

    public void setMedical_problem(String medical_problem) {
        this.medical_problem = medical_problem;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getPh_no() {
        return ph_no;
    }

    public void setPh_no(String ph_no) {
        this.ph_no = ph_no;
    }
    
    public String toString() {
        return "Patient{" + "p_id=" + p_id + ", name=" + name + ", medical_problem=" + medical_problem + ", age=" + age + ", ph_no=" + ph_no + '}';
    }
    
    
    
    
    
    
}
