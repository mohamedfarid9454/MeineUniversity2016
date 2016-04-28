/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import Database.MyDatabase;
import java.sql.*;
import java.sql.SQLException;

/**
 *
 * @author mohamed
 */
public class MyPerson {

    protected String FName, LName, MName, UserEmail, Pass, Address, gender, date, BirthDate;
    private String msg = "";
    protected int Code, UserType, levelID, SSN, faculityID, universityID;

    public String getFName() {
        return FName;
    }

    public void setFName(String FName) {
        this.FName = FName;
    }

    public String getLName() {
        return LName;
    }

    public void setLName(String LName) {
        this.LName = LName;
    }

    public String getMName() {
        return MName;
    }

    public void setMName(String MName) {
        this.MName = MName;
    }

    public String getUserEmail() {
        return UserEmail;
    }

    public void setUserEmail(String UserEmail) {
        this.UserEmail = UserEmail;
    }

    public String getPass() {
        return Pass;
    }

    public void setPass(String Pass) {
        this.Pass = Pass;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getBirthDate() {
        return BirthDate;
    }

    public void setBirthDate(String BirthDate) {
        this.BirthDate = BirthDate;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public int getCode() {
        return Code;
    }

    public void setCode(int Code) {
        this.Code = Code;
    }

    public int getUserType() {
        return UserType;
    }

    public void setUserType(int UserType) {
        this.UserType = UserType;
    }

    public int getLevelID() {
        return levelID;
    }

    public void setLevelID(int levelID) {
        this.levelID = levelID;
    }

    public int getSSN() {
        return SSN;
    }

    public void setSSN(int SSN) {
        this.SSN = SSN;
    }

    public int getFaculityID() {
        return faculityID;
    }

    public void setFaculityID(int faculityID) {
        this.faculityID = faculityID;
    }

    public int getUniversityID() {
        return universityID;
    }

    public void setUniversityID(int universityID) {
        this.universityID = universityID;
    }

    public MyPerson MyLoginFunction(String mail, String Pass) {
        MyPerson p = null;
        ResultSet result = null;
        PreparedStatement prepared_statement = null;
        Connection connection = null;
        try {
            p = new MyPerson();
            MyDatabase LoginDatabaseObject = MyDatabase.getInstance();
            connection = LoginDatabaseObject.connect_to_DB();
            String sql = "select * from user where Mail=? and Password=? ";
            prepared_statement = connection.prepareStatement(sql);
            prepared_statement.setString(1, mail);
            prepared_statement.setString(2, Pass);
            result = prepared_statement.executeQuery();

            while (result.next()) {
                p.setUserEmail(result.getString("Mail"));
                p.setFName(result.getString("FName"));
                p.setLName(result.getString("LName"));
                p.setMName(result.getString("MName"));
                p.setPass(result.getString("Password"));
                p.setAddress(result.getString("Address"));
                p.setBirthDate(result.getString("BirhtDate"));
                p.setGender(result.getString("Gender"));
                p.setDate(result.getString("date"));
                p.setCode(result.getInt("Code"));
                p.setFaculityID(result.getInt("FacultyID"));
                p.setUniversityID(result.getInt("UniversityID"));
                p.setUserType(result.getInt("UserTypeID"));
                p.setLevelID(result.getInt("LevelID"));
                p.setSSN(result.getInt("SSn"));

            }
            System.out.println("# of users " + MyDatabase.count);

        } catch (SQLException ex) {
            // System.out.println(ex.getMessage());
            // System.out.println("SQLException:Can't Login");
            System.err.println(ex.getMessage() + "LoginError");

        } finally {
            try {
                connection.close();
                result.close();
                prepared_statement.close();
            } catch (SQLException ex) {
                System.err.println(ex.getMessage() + "Can't Close ResultSet");
            }
        }
        return p;
    }
    //End of Login

    //Add Posts
    public int AddPostMethod(int UserID, String Post, int SubjectPostID) throws SQLException {
        ResultSet result = null;
        PreparedStatement prepared_statement = null;
        Connection connection = null;
        int rowAffected = -1;
        try {
            MyDatabase AddPostMethodDatabaseObject = MyDatabase.getInstance();
            connection = AddPostMethodDatabaseObject.connect_to_DB();

            String sql = "insert into post (UserID,Post,SubjectPostID) values(?,?,?)";

            prepared_statement = connection.prepareStatement(sql);
            prepared_statement.setInt(1, UserID);
            prepared_statement.setString(2, Post);
            prepared_statement.setInt(3, SubjectPostID);
            rowAffected = prepared_statement.executeUpdate();
            System.out.println("# of users " + MyDatabase.count);
            System.out.println("# of users " + MyDatabase.count);

        } catch (SQLException ex) {
            System.err.println(ex.getMessage() + "Can't Close ResultSet");
        } finally {
            /*try {
             //  connection.close();
             //result.close();
             //prepared_statement.close();
             } catch (SQLException ex) {
             System.err.println(ex.getMessage() + "Can't Close ResultSet");
             }*/
        }
        return rowAffected;
    }
    //End of Add Post Method

    //Add CommentMethod
    public int AddCommentMethod(int UserID, String commentContent, int PostID) {
        ResultSet result = null;
        PreparedStatement prepared_statement = null;
        Connection connection = null;
        int rowAffected = -1;
        try {
            MyDatabase AddPostMethodDatabaseObject = MyDatabase.getInstance();
            connection = AddPostMethodDatabaseObject.connect_to_DB();

            String sql = "INSERT INTO `comment`(`PostID`, `UserID`, `commentContent`) VALUES (?,?,?)";
            prepared_statement = connection.prepareStatement(sql);
            prepared_statement.setInt(1, PostID);
            prepared_statement.setInt(2, UserID);
            prepared_statement.setString(3, commentContent);
            rowAffected = prepared_statement.executeUpdate();
            System.out.println("# of users " + MyDatabase.count);
            System.out.println("# of users " + MyDatabase.count);

        } catch (SQLException ex) {
            System.err.println(ex.getMessage() + "Can't Close ResultSet");
        } finally {
            /*try {
             //  connection.close();
             //result.close();
             //prepared_statement.close();
             } catch (SQLException ex) {
             System.err.println(ex.getMessage() + "Can't Close ResultSet");
             }*/
        }
        return rowAffected;
    }
    //End of Add Comment Method

    //View Course Posts
    public ResultSet ViewCoursePosts(int Subject_ID) {

        ResultSet result = null;
        PreparedStatement prepared_statement = null;
        Connection connection = null;
        String sql = "select user.FName,user.LName,user.Mail,user.Code,subject.Code,subject.ID,post.date,post.PostID,post.Post from post,user,subject where post.UserID=user.Code and subject.ID=post.SubjectPostID and subject.ID=? ORDER BY PostID DESC ";
        try {
            MyDatabase ViewCoursePostsDatabaseObject = MyDatabase.getInstance();
            connection = ViewCoursePostsDatabaseObject.connect_to_DB();

            prepared_statement = connection.prepareStatement(sql);
            prepared_statement.setInt(1, Subject_ID);
            result = prepared_statement.executeQuery();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return result;

    }
   //End of ViewCoursePosts

    //ViewCoursePostContent
    public ResultSet ViewCoursePostContent(int Subject_ID, int POSTID) {

        ResultSet result = null;
        PreparedStatement prepared_statement = null;
        Connection connection = null;
        String sql = "select user.FName,user.LName,user.Mail,user.Code,subject.Code,subject.ID,post.date,post.PostID,post.Post from post,user,subject where post.UserID=user.Code and subject.ID=post.SubjectPostID and  subject.ID=? and post.PostID=?";
        try {
            MyDatabase ViewCoursePostsDatabaseObject = MyDatabase.getInstance();
            connection = ViewCoursePostsDatabaseObject.connect_to_DB();

            prepared_statement = connection.prepareStatement(sql);
            prepared_statement.setInt(1, Subject_ID);
            prepared_statement.setInt(2, POSTID);

            result = prepared_statement.executeQuery();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return result;

    }
    //End of ViewCoursePostContent

//View Comments
    public ResultSet ViewCoursePostComments(int PostID) throws SQLException {

        ResultSet result = null;
        PreparedStatement prepared_statement = null;
        Connection connection = null;
        String sql = "select `user`.`UserTypeID`,`comment`.`commentContent`,`comment`.`UserID`,`comment`.`date`,`user`.`Code`,`user`.`FName`,`user`.`LName`,`user`.`Mail`,`user`.`Code`,`post`.`PostID` from `post`,`user`,`comment` where `comment`.`UserID`=`user`.`Code` and `comment`.`PostID`=`post`.`PostID` and `post`.`PostID`=?";
        try {
            MyDatabase ViewCoursePostsDatabaseObject = MyDatabase.getInstance();
            connection = ViewCoursePostsDatabaseObject.connect_to_DB();

            prepared_statement = connection.prepareStatement(sql);
            prepared_statement.setInt(1, PostID);
            result = prepared_statement.executeQuery();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return result;

    }

//End of View Comments
}
