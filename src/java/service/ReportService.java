/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import DAO.ReportDAO;
import DAO.UserDAO;
import java.util.List;
import model.Report;
import model.Users;

/**
 *
 * @author Sy
 */
public class ReportService {
    public void addReport(Report report){
        ReportDAO daoReport = new ReportDAO();
        daoReport.addReport(report);
    }
    public List<Report> getReportByUserID(int UserID){
        ReportDAO daoReport = new ReportDAO();
        List<Report> reports = daoReport.getReportbyUserID(UserID);
        return reports;
    }
    public void deleteReport(int id){
        ReportDAO daoReport = new ReportDAO();
        daoReport.deleteReport(id);
    }
    public String getEmailbyUserID(int id){
        UserDAO dao= new UserDAO();
        Users landlord = dao.getUserByID(id);
        String email=landlord.getEmail();
        return email;
    }
}
