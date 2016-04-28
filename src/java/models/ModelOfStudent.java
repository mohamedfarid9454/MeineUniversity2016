/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import Database.MyDatabase;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author mohamed
 */
public class ModelOfStudent extends MyPerson {

    public ResultSet ViewMyCourses(int student_code) {
//subject=`SubjectName`, `Code`, `WritenGrade`, `MidtermGrade`, `RemaingGrade`
//subjectstudent=`SubjectID`, `StudentID`, `WritenGrade`, `MidtermGrade`, `RemaingGrade`
//user=`Code`, `Mail`,
        ResultSet result = null;
        PreparedStatement prepared_statement = null;
        Connection connection = null;
        try {
            MyDatabase ViewCourseDatabaseObject = MyDatabase.getInstance();
            connection = ViewCourseDatabaseObject.connect_to_DB();
            String sql = "select subjectstudent.SubjectRegisterDate,subject.SubjectName,subject.Code,subject.ID,user.Code,user.Mail,subjectstudent.StudentID,subjectstudent.SubjectID,subjectstudent.WritenGrade,subjectstudent.MidtermGrade,subjectstudent.RemaingGrade from subject,subjectstudent,user where subject.ID=subjectstudent.SubjectID and user.Code=subjectstudent.StudentID and user.Code=? ";
            prepared_statement = connection.prepareStatement(sql);
            prepared_statement.setInt(1, student_code);
            result = prepared_statement.executeQuery();

        } catch (SQLException ex) {
        // System.out.println(ex.getMessage());
            // System.out.println("SQLException:Can't Login");
            System.err.println(ex.getMessage() + "View Courses");

        } finally {
            /*try {
                connection.close();
                // result.close();
                prepared_statement.close();
            } catch (SQLException ex) {
                System.err.println(ex.getMessage() + "Can't Close ResultSet(ViewMyCourses)");
            }*/
        }

        return result;
    }

}
