/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utils;

import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
import java.util.Timer;
import java.util.TimerTask;
import java.util.logging.Level;
import java.util.logging.Logger;
import service.LandlordService;
import service.UserService;

/**
 * TimerListener class: This servlet run everyday to check for ban_end_date, so
 * that it can unban users. Moreover, it scans all post_end_date, so that all
 * post expired will be set status to DRAFT
 *
 * @author DTS
 */
@WebListener
public class TimerListener implements ServletContextListener {

    private Timer timer;

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        // Do some action here when the servlet context is initialized
        System.out.println("Servlet context initialized");
        timer = new Timer("autoThread");
        TimerTask unbanTask = new TimerTask() {
            @Override
            public void run() {
                try {
                    UserService uService = new UserService();
                    LandlordService llService = new LandlordService();
                    
                    llService.timerMovePostToDraft();
                    uService.timerUnban();
                    System.out.println("Running");
                } catch (Exception ex) {
                    Logger.getLogger(TimerListener.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        };

        long period = 1000L * 60L * 60L * 24L;
        timer.scheduleAtFixedRate(unbanTask, 0, period);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        // Do some action here when the servlet context is destroyed
        System.out.println("Servlet context destroyed");
        timer.cancel();
    }

}
