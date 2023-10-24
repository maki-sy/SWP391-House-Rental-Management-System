/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import DAO.PostDAO;
import DAO.ReviewDAO;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.List;
import model.Review;

/**
 *
 * @author Administrator
 */
public class ReviewService {

    private static final PostDAO POST_DAO = new PostDAO();
    private static final ReviewDAO REVIEW_DAO = new ReviewDAO();

    public String filter(String text) {
        System.out.println("Filter function called");
        String out = "";
        List<String> list = readFromFile();
        for (String word : text.split(" ")) {
            boolean isBadWord = false;
            for (String badWord : list) {
                if (word.equals(badWord)) {
                    isBadWord = true;
                    break;
                }
            }
            if (!isBadWord) {
                out += word;
                out += " ";

            } else {
                for (int i = 0; i < word.length(); i++) {
                    out += "*";
                }
                out += " ";
            }
        }
        return out;
    }

    public List<String> readFromFile() {
        System.out.println("read file dc goi");
        List<String> list = new ArrayList<>();
        String localDir = System.getProperty("user.dir");
        String filePath = localDir + "\\web\\assets\\badWord.txt";
        //để hoạt động cần sửa add link trên vào file bin của tomcat
        try {
            FileReader fr = new FileReader(filePath);
            BufferedReader br = new BufferedReader(fr);
            String line = "";
            while (true) {
                line = br.readLine();
                if (line == null) {
                    break;
                }
                list.add(line);

            }
            return list;
        } catch (Exception ex) {
            System.out.println(ex.toString());
        }
        return null;
    }

    public void addReview(Review review) {
        REVIEW_DAO.addReview(review);
    }

    public static void main(String[] args) {
        ReviewService r = new ReviewService();
        String text = "This is a c hell test show khanh . ";
        String out = r.filter(text);
        System.out.println(out);
    }
}
