/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Sy
 */
public class Report {
    private int report_id;
    private int reporter_id;
    private Integer property_id;
    private Integer reported_id;
    private String report_date;
    private String categories;
    private String description;
    private String status;

    public Report() {
    }

    public Report(int report_id, int reporter_id, Integer property_id, Integer reported_id, String report_date, String categories, String description, String status) {
        this.report_id = report_id;
        this.reporter_id = reporter_id;
        this.property_id = property_id;
        this.reported_id = reported_id;
        this.report_date = report_date;
        this.categories = categories;
        this.description = description;
        this.status = status;
    }

    public int getReport_id() {
        return report_id;
    }

    public void setReport_id(int report_id) {
        this.report_id = report_id;
    }

    public int getReporter_id() {
        return reporter_id;
    }

    public void setReporter_id(int reporter_id) {
        this.reporter_id = reporter_id;
    }

    public Integer getProperty_id() {
        return property_id;
    }

    public void setProperty_id(Integer property_id) {
        this.property_id = property_id;
    }

    public Integer getReported_id() {
        return reported_id;
    }

    public void setReported_id(Integer reported_id) {
        this.reported_id = reported_id;
    }

    public String getReport_date() {
        return report_date;
    }

    public void setReport_date(String report_date) {
        this.report_date = report_date;
    }

    public String getCategories() {
        return categories;
    }

    public void setCategories(String categories) {
        this.categories = categories;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
}
