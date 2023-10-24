/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import DAO.PostDAO;
import DAO.ReviewDAO;
import model.Review;

/**
 *
 * @author Administrator
 */
public class ReviewService {

    static String words = "admin,administrator,babo,sir,melon,mẹ";
    private static final PostDAO POST_DAO = new PostDAO();
    private static final ReviewDAO REVIEW_DAO = new ReviewDAO();

    public static boolean checkWord(String input) {
        String wordArray[] = words.split(",");
        for (String wordArray1 : wordArray) {
            if (input.contains(wordArray1)) {
                return true;
            }
        }
        return false;
    }

    public void addReview(Review review) {
        REVIEW_DAO.addReview(review);
    }
}
