/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.PreparedStatement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Report;

/**
 *
 * @author Sy
 */
public class ReportDAO extends DBContext {

    public List<Report> getAllReports() {
        List<Report> report = new ArrayList<>();
        String sqlCommand = "SELECT * FROM Report;";
        ResultSet rs = getData(sqlCommand);
        try {
            while (rs.next()) {
                int report_id = rs.getInt(1);
                int reporter_id = rs.getInt(2);
                int property_id = rs.getInt(3);
                int reported_id = rs.getInt(4);
                String report_date = rs.getString(5);
                String categories = rs.getString(6);
                String description = rs.getString(7);
                String status = rs.getString(8);
                Report rp = new Report(report_id, reporter_id, property_id, reported_id, report_date, categories, description, status);
                report.add(rp);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ReportDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return report;
    }

    public void addReport(Report report) {
        int checkReturn = 0;
        try {
            String sql = "INSERT INTO [dbo].[Report]\n"
                    + "           ([reporter_id]\n"
                    + "           ,[property_id]\n"
                    + "           ,[reported_id]\n"
                    + "           ,[report_date]\n"
                    + "           ,[categories]\n"
                    + "           ,[description]\n"
                    + "           ,[status])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";
            PreparedStatement stm = connect.prepareStatement(sql);
            stm.setInt(1, report.getReporter_id());
            if (report.getProperty_id() == null) {
                stm.setObject(2, null);
            } else {
                stm.setInt(2, report.getProperty_id());
            }
            if (report.getReported_id() == null) {
                stm.setObject(3, null);
            } else {
                stm.setInt(3, report.getReported_id());
            }
            stm.setString(4, report.getReport_date());
            stm.setString(5, report.getCategories());
            stm.setString(6, report.getDescription());
            stm.setString(7, report.getStatus());
            checkReturn = stm.executeUpdate();
        } catch (SQLException ex) {
            System.err.println("addReport() reports: " + ex.getMessage());
            Logger.getLogger(ReportDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

 //   public static void main(String[] args) {
//        ReportDAO dao = new ReportDAO();
//        List<Report> report = new ArrayList<>();
//         report=dao.getAllReports();
//         for(int i=0;i<report.size();i++)
//         System.out.println(report.get(i).getDescription());
//        LocalDateTime now = LocalDateTime.now();
//        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
//        String formatDateTime = now.format(formatter);
//        Report rp = new Report(0, 2, 3, 4, formatDateTime, "User Complaint", "This dude scams.", "Processing");
//        dao.addReport(rp);
//        Integer post_id = null;
//        String post_link = "http://localhost:8080/SWP391-House-Rental-Management/housedetail?id=1";
//        post_id = Integer.parseInt(post_link.replaceAll(".*id=", ""));
//        System.out.println(post_id);
 //   }
}
