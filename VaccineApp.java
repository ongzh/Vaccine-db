import java.sql.*;
import java.util.Calendar;
import java.util.Scanner;

public class VaccineApp {
    public static void main ( String [ ] args ) throws SQLException
    {
        // Register the driver.  You must register the driver before you can use it.
        try { DriverManager.registerDriver ( new com.ibm.db2.jcc.DB2Driver() ) ; }
        catch (Exception cnfe){ System.out.println("Class not found"); }

        int sqlCode=0;      // Variable to hold SQLCODE
        String sqlState="00000";  // Variable to hold SQLSTATE

        // This is the url you must use for DB2.
        //Note: This url may not valid now !
        String url = "jdbc:db2://winter2021-comp421.cs.mcgill.ca:50000/cs421";
        String your_userid = null;
        String your_password = null;

        if(your_userid == null && (your_userid = System.getenv("SOCSUSER")) == null)
        {
            System.err.println("Error!! do not have a password to connect to the database!");
            System.exit(1);
        }
        if(your_password == null && (your_password = System.getenv("SOCSPASSWD")) == null)
        {
            System.err.println("Error!! do not have a password to connect to the database!");
            System.exit(1);
        }
        Connection con = DriverManager.getConnection (url,your_userid,your_password) ;
        Statement statement = con.createStatement ( ) ;

        String menu = "Vaccine APP Main Menu\n \t1.Add a Person\n \t2.Assign a Slot to a Person\n \t3.Enter Vaccination Information\n \t4.Exit Application\nPlease Enter Your Option:";

        Scanner sc = new Scanner(System.in);
        String input = "";
        while (input.equals("")){
            System.out.println(menu);
            int option = sc.nextInt();
            switch(option){
                case 1:
                    try {
                        String update = "n";
                        System.out.println("Enter the Person's health insurance number: ");
                        String healthnum = sc.next();
                        sc.nextLine();
                        String querySQL = "Select * from Person Where healthnum=?";
                        PreparedStatement prepquery = con.prepareStatement(querySQL);
                        prepquery.setString(1,healthnum);
                        ResultSet rs = prepquery.executeQuery();
                        if (rs.next()!=false){
                            System.out.println("Health Insurance number already exists do you wish to update the existing information associated with the Insurance Number? (y/n)");
                            update = sc.next();
                            if (update.equals("n")){
                                break;
                            }
                        }

                        System.out.println("Enter the Person's name: ");
                        String name = sc.nextLine();
                        System.out.println("Enter the Person's gender: ");
                        String gender = sc.nextLine();
                        System.out.println("Enter the Person's date of birth: ");
                        String dob = sc.nextLine();
                        System.out.println("Enter the Person's phone: ");
                        String phone = sc.nextLine();
                        System.out.println("Enter the Person's registration date: ");
                        String regdate = sc.nextLine();
                        System.out.println("Enter the Person's postal code: ");
                        String postal = sc.nextLine();
                        System.out.println("Enter the Person's street: ");
                        String street = sc.nextLine();
                        System.out.println("Enter the Person's city: ");
                        String city = sc.nextLine();
                        System.out.println("Enter the Person's category: ");
                        String cat = sc.nextLine();

                        String updateSQL = "UPDATE PERSON SET name=?, gender=?, dob=?, phone=?, regdate=?, postalcode=?, street=?, city=?, category=? WHERE healthnum="+"\'"+healthnum+"\'";
                        String insertSQL = "INSERT INTO PERSON(healthnum,name,gender,dob,phone,regdate,postalcode,street,city,category) VALUES("+"\'"+healthnum+"\'"+",?,?,?,?,?,?,?,?,?)";
                        PreparedStatement prepinsert = con.prepareStatement(insertSQL);

                        if (update.equals("y")){
                            prepinsert = con.prepareStatement(updateSQL);
                        }

                        prepinsert.setString(1, name);
                        prepinsert.setString(2, gender);
                        prepinsert.setDate(3, Date.valueOf(dob));
                        prepinsert.setString(4, phone);
                        prepinsert.setDate(5, Date.valueOf(regdate));
                        prepinsert.setString(6, postal);
                        prepinsert.setString(7, street);
                        prepinsert.setString(8, city);
                        prepinsert.setString(9, cat);

                        prepinsert.executeUpdate();
                        System.out.println ( "DONE" ) ;
                        prepinsert.close();
                        input="";
                        break;
                    }
                    catch (SQLException e)
                    {
                        sqlCode = e.getErrorCode(); // Get SQLCODE
                        sqlState = e.getSQLState(); // Get SQLSTATE

                        // Your code to handle errors comes here;
                        // something more meaningful than a print would be good
                        System.out.println("Code: " + sqlCode + "  sqlState: " + sqlState);
                        System.out.println(e);
                        break;
                    }
                case 2:
                    try {
                        System.out.println("Enter the Person's health insurance number: ");
                        String healthnum = sc.next();
                        sc.nextLine();
                        System.out.println("Enter the Location name: ");
                        String locname = sc.nextLine();
                        System.out.println("Enter Slot date: ");
                        String sdate = sc.nextLine();

                        Date curdate=new Date(System.currentTimeMillis());
                        if (Date.valueOf(sdate).compareTo(curdate)<0) {
                            System.out.println("Unable to add Slot from the past");
                            input="";
                            break;
                        }

                        System.out.println("Enter SLOTID: ");
                        String slotid = sc.nextLine();

                        String querySlot = "select * from SlotAllocation where slotid=? and sdate=? and name=?";
                        PreparedStatement prepSlotQuery = con.prepareStatement(querySlot);
                        prepSlotQuery.setInt(1,Integer.parseInt(slotid));
                        prepSlotQuery.setString(3,locname);
                        prepSlotQuery.setDate(2, Date.valueOf(sdate));
                        ResultSet rslot = prepSlotQuery.executeQuery();
			
                        if (rslot.next()!=false){
                            System.out.println("Invalid. This Slot has already been assigned.");
                            input = "";
                            rslot.close();
                            break;
                        }

                        String queryDose = "select vac.reqdose from Vaccine vac where " +
                                "vac.vname in " +
                                "(Select v.vname from Vial v where " +
                                "healthnum=?)";


                        PreparedStatement prepDoseQuery = con.prepareStatement(queryDose);
                       

			prepDoseQuery.setString(1,healthnum);
                        ResultSet rs = prepDoseQuery.executeQuery();


                        int reqdose = 0;
                        if (rs.next()){
                            reqdose = rs.getInt("reqdose");


                            String queryCount = "select Count(*) " +
                                    "from SlotAllocation " +
                                    "where healthnum=?";
                            PreparedStatement prepCurDose = con.prepareStatement(queryCount);
			    prepCurDose.setString(1,healthnum);
                            ResultSet rs2 = prepCurDose.executeQuery();
				
			    int curdose=0;
			    if (rs2.next()){
				curdose= rs2.getInt(1);}
                           
			    if (reqdose <= curdose){
                                System.out.println("Required Dose Already Given. Unable to assign Slot");
                                input="";
                                rs.close();
                                rs2.close();
                                break;}
                        }

                        String insertSQL = "INSERT into SlotAllocation(healthnum,name,sdate,slotid,adate) VALUES(?,?,?,?,?)";
                        PreparedStatement prepinsert = con.prepareStatement(insertSQL);
                        prepinsert.setString(1,healthnum);
                        prepinsert.setString(2,locname);
                        prepinsert.setDate(3, Date.valueOf(sdate));
                        prepinsert.setInt(4, Integer.parseInt(slotid));
                        prepinsert.setDate(5,curdate);

                        prepinsert.executeUpdate();
                        System.out.println ( "DONE" ) ;
                        input="";


                        prepDoseQuery.close();
                        prepinsert.close();
                        prepSlotQuery.close();
                        break;

                    } catch (SQLException e){
                        sqlCode = e.getErrorCode(); // Get SQLCODE
                        sqlState = e.getSQLState(); // Get SQLSTATE

                        // Your code to handle errors comes here;
                        // something more meaningful than a print would be good
                        System.out.println("Code: " + sqlCode + "  sqlState: " + sqlState);
                        System.out.println(e);
                        break;

                    }


                case 3:
                    try{
                    System.out.println("Enter the Person's health insurance number: ");
                    String healthnum = sc.next();
                    sc.nextLine();
                    System.out.println("Enter the Vaccine Brand: ");
                    String vacbrand = sc.nextLine();

                    String vaccineQuery = "Select DISTINCT vname from Vial where healthnum=?";
                    PreparedStatement prepVacQuery = con.prepareStatement(vaccineQuery);
                    prepVacQuery.setString(1,healthnum);
                    ResultSet rs = prepVacQuery.executeQuery();
		    String vacused=null;
		    if (rs.next()){

                    	vacused = rs.getString(1);}

                    if (!vacbrand.equals(vacused) && vacused!=null){
                        System.out.println("Vaccine brand does not match Vaccine previously used");
                        input = "";
                        break;
                    }

                    System.out.println("Enter batch number");
                    int bnum = sc.nextInt();
                    sc.nextLine();
                    System.out.println("Enter vial number");
                    String vialnum = sc.nextLine();
                    System.out.println("Enter Nurse's License number");
                    String license = sc.nextLine();
                    System.out.println("Enter the Location name: ");
                    String locname = sc.nextLine();
                    System.out.println("Enter Slot date: ");
                    String sdate = sc.nextLine();
                    System.out.println("Enter SLOTID: ");
                    int slotid = sc.nextInt();
                    sc.nextLine();

                    String insertSQL = "INSERT INTO Vial(vname,bnum,vialnum,license,healthnum,name,sdate,slotid) VALUES(?,?,?,?,?,?,?,?)";

                    PreparedStatement prepinsert = con.prepareStatement(insertSQL);
                    prepinsert.setString(1,vacbrand);
                    prepinsert.setInt(2,bnum);
                    prepinsert.setInt(3, Integer.parseInt(vialnum));
                    prepinsert.setString(4,license);
                    prepinsert.setString(5,healthnum);
                    prepinsert.setString(6,locname);
                    prepinsert.setDate(7, Date.valueOf(sdate));
                    prepinsert.setInt(8,slotid);

                    prepinsert.executeUpdate();
                    System.out.println ( "DONE" ) ;
                    input="";
                    prepinsert.close();
                    prepVacQuery.close();
                    break;
                    }catch (SQLException e){
                    sqlCode = e.getErrorCode(); // Get SQLCODE
                    sqlState = e.getSQLState(); // Get SQLSTATE

                    // Your code to handle errors comes here;
                    // something more meaningful than a print would be good
                    System.out.println("Code: " + sqlCode + "  sqlState: " + sqlState);
                    System.out.println(e);
                    break;

                    }
                case 4:
                    con.close();
                    input="a";
                    break;

                default:
                    throw new IllegalStateException("Unexpected value: " + option);
            }



        }

    }
}
