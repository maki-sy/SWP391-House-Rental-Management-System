/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import DAO.ReportDAO;
import model.Report;

/**
 *
 * @author Sy
 */
public class ReportService {
    public void addReport(Report report){
        ReportDAO daoReport = new ReportDAO();
        daoReport.addReport(report);
    }
}
