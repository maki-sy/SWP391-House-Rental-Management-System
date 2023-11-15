package controller;

import jakarta.servlet.ServletContext;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import model.Orders;
import model.PostRental;
import model.Users;
import service.LandlordService;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import model.Tenant;

@WebServlet(name = "landlordServicesPage", urlPatterns = {"/landlordServicesPage"})
@MultipartConfig
public class LandlordServicesPage extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //-- Lay duong dan thu muc goc --//
        ServletContext context = getServletContext();
        String appPath = context.getRealPath("");
        Path projectPath = Paths.get(appPath);
        Path parentDirectory = projectPath.getParent().getParent();
        appPath = parentDirectory.toString();

        //-- Lay xong duong dan thu muc goc --//
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            LandlordService handleService = new LandlordService();
            HttpSession session = request.getSession();
            Users user = (Users) session.getAttribute("user");
            session.setAttribute("accountBalance", handleService.getAccountPointsByUserId(user.getId()));
            if (user == null || user.getRoleID() != 2) {
                response.sendRedirect("trang-chu");
                return;
            }
            String service = request.getParameter("service");

            // xem order chua xu ly
            if (service == null) {
                request.getRequestDispatcher("/landlordServicesPage?service=pending-requests").forward(request, response);
            } else if (service.equals("pending-requests")) {
                ArrayList<Orders> ordersList = handleService.getOrdersProcessing(user.getId());
                ArrayList<String> tenantsName = handleService.getTenantNameByOrderList(ordersList);
                request.setAttribute("tenantsName", tenantsName);
                request.setAttribute("ordersList", ordersList);
                request.getRequestDispatcher("landlord-services.jsp").forward(request, response);
            } // xem order da xu ly
            else if (service.equals("requests-processed")) {
                ArrayList<Orders> ordersList = handleService.getOrdersNotProcessing(user.getId());
                ArrayList<String> tenantsName = handleService.getTenantNameByOrderList(ordersList);
                request.setAttribute("tenantsName", tenantsName);
                request.setAttribute("ordersList", ordersList);
                request.getRequestDispatcher("L-requests-processed.jsp").forward(request, response);
            } // xem post da chon
            else if (service.equals("view-request-post")) {
                int postId = Integer.parseInt(request.getParameter("post-id"));
                request.getRequestDispatcher("/housedetail?id=" + postId).forward(request, response);
                // do something
            } // xem trang ca nhan tennant
            else if (service.equals("contact")) {
                int tenantId = Integer.parseInt(request.getParameter("tenant-id"));
                Tenant tenant = handleService.getTenantByUserID(tenantId);
                String tenantEmail = handleService.getUserByID(tenantId).getEmail();
                String tenantAvatarURL = handleService.getAvatarURLByUserID(tenantId);
                request.setAttribute("tenant", tenant);
                request.setAttribute("tenantEmail", tenantEmail);
                request.setAttribute("tenantAvatarURL", tenantAvatarURL);
                request.getRequestDispatcher("/L-view-tenant-profile.jsp").forward(request, response);
            } else if (service.equals("approve-request")) {
                int orderId = Integer.parseInt(request.getParameter("order-id"));
                handleService.isApproveStatusUpdated(orderId);
                ArrayList<Orders> ordersList = handleService.getOrdersProcessing(user.getId());
                ArrayList<String> tenantsName = handleService.getTenantNameByOrderList(ordersList);
                request.setAttribute("tenantsName", tenantsName);
                request.setAttribute("ordersList", ordersList);
                request.setAttribute("mess", "Approve successfully! Now customers can contact you :)");
                request.getRequestDispatcher("landlord-services.jsp").forward(request, response);

            } else if (service.equals("reject-request")) {
                int orderId = Integer.parseInt(request.getParameter("order-id"));
                handleService.isRejectStatusUpdated(orderId);
                ArrayList<Orders> ordersList = handleService.getOrdersProcessing(user.getId());
                ArrayList<String> tenantsName = handleService.getTenantNameByOrderList(ordersList);
                request.setAttribute("tenantsName", tenantsName);
                request.setAttribute("ordersList", ordersList);
                request.setAttribute("mess", "Reject successfully! Now customers cant bother you :)");
                request.getRequestDispatcher("landlord-services.jsp").forward(request, response);

            } else if (service.equals("published-posts")) {
                ArrayList<PostRental> postList = handleService.getPublishedPostsByUserId(user.getId());
                request.setAttribute("postList", postList);
                request.getRequestDispatcher("L-published-posts.jsp").forward(request, response);
            } else if (service.equals("move-post-to-draft")) {
                int postId = Integer.parseInt(request.getParameter("post-id"));
                handleService.isMovePostToDraftSuccessByPostId(postId);
                ArrayList<PostRental> postList = handleService.getPublishedPostsByUserId(user.getId());
                request.setAttribute("postList", postList);
                request.setAttribute("mess", "Successfully converted the post to a draft :)");
                request.getRequestDispatcher("L-published-posts.jsp").forward(request, response);
            } else if (service.equals("edit-posts")) {
                ArrayList<PostRental> postList = handleService.getEditablePostsByUserId(user.getId());
                request.setAttribute("postList", postList);
                request.getRequestDispatcher("L-edit-posts.jsp").forward(request, response);
            } else if (service.equals("delete-post")) {
                int postId = Integer.parseInt(request.getParameter("post-id"));
                handleService.isDeletedPostSuccessByPostId(postId, appPath);
                request.setAttribute("mess", "Post deleted successfully :)");
                ArrayList<PostRental> postList = handleService.getEditablePostsByUserId(user.getId());
                request.setAttribute("postList", postList);
                request.getRequestDispatcher("L-edit-posts.jsp").forward(request, response);
            } else if (service.equals("edit-detail-post")) {
                int postId = Integer.parseInt(request.getParameter("post-id"));
                PostRental post = handleService.getPostByPostId(postId);
                if (post.getStatus().equals("basic")) {
                    request.setAttribute("mess", "Post with the basic package cannot be edited :(");
                    ArrayList<PostRental> postList = handleService.getEditablePostsByUserId(user.getId());
                    request.setAttribute("postList", postList);
                    request.getRequestDispatcher("L-edit-posts.jsp").forward(request, response);
                } else {
                    ArrayList<String> urlList = handleService.getPostImageURLByPostId(postId);
                    request.setAttribute("post", post);
                    request.setAttribute("urlList", urlList);
                    request.getRequestDispatcher("L-edit-detail-post.jsp").forward(request, response);
                }

            } else if (service.equals("submit-edit-detail-post")) {
                int postId = Integer.parseInt(request.getParameter("post-id"));
                PostRental post = handleService.getPostByPostId(postId);
                String name = request.getParameter("name");
                double price = Double.parseDouble(request.getParameter("price"));
                int area = Integer.parseInt(request.getParameter("area"));
                int NumOfBedrooms = Integer.parseInt(request.getParameter("NumOfBedrooms"));
                String address = request.getParameter("address");
                String description = request.getParameter("description");
                int type = Integer.parseInt(request.getParameter("type"));
                int location_id = Integer.parseInt(request.getParameter("location_id"));
                String typeActionImg = request.getParameter("add-or-replace");
                String typeOfAction = request.getParameter("typeOfAction");
                boolean isUpdatedPostByPostId = handleService.isUpdatedPostByPostId(post.getId(),
                        name, price, type, area, NumOfBedrooms, address, description, location_id);
                if (isUpdatedPostByPostId) {
                    if (typeActionImg.equals("keep")) {
                    } else if (typeActionImg.equals("replace-photo")) {
                        handleService.isImageDeletedByPostId(postId, appPath);
                        handleService.isHandledSaveImageSuccess(post, request.getParts(), appPath, 0);
                    } else if (typeActionImg.equals("add-new-photo")) {
                        handleService.isHandledSaveImageSuccess(post, request.getParts(), appPath, handleService.getPostImageURLByPostId(postId).size() - 1);
                    }
                    //-- Luu hinh anh --//

                    //-- Xong phan luu hinh anh --//
                    if (!post.getStatus().equals("draft")) {
                        request.getRequestDispatcher("/landlordServicesPage?service=view-request-post&post-id=" + postId).forward(request, response);
                    } else {
                        if (typeOfAction.equals("upload")) {

                            request.setAttribute("postId", post.getId());
                            handleService.isDeleteDuplicateDraftPostsSuccessByPostId(post.getId(), user.getId(), appPath); // --> xoa bo cac ban nhap giong y het nhau
                            request.getRequestDispatcher("L-pay-for-post.jsp").forward(request, response);
                            // them vao draft thanh cong -> tien hanh thanh toan
                        } else if (typeOfAction.equals("draft")) {
                            // them vao draft thanh cong
                            ArrayList<PostRental> postList = handleService.getEditablePostsByUserId(user.getId());
                            request.setAttribute("postList", postList);
                            request.setAttribute("mess", "Draft post updated successfully :)");
                            request.getRequestDispatcher("L-edit-posts.jsp").forward(request, response);
                        }
                    }

                }
            } else if (service.equals("add-new-post")) {
                request.getRequestDispatcher("L-add-new-post.jsp").forward(request, response);
            } else if (service.equals("submit-add-new-post")) {
                String name = request.getParameter("name");
                int price = Integer.parseInt(request.getParameter("price"));
                int area = Integer.parseInt(request.getParameter("area"));
                int NumOfBedrooms = Integer.parseInt(request.getParameter("NumOfBedrooms"));
                String address = request.getParameter("address");
                String description = request.getParameter("description");
                int type = Integer.parseInt(request.getParameter("type"));
                int location_id = Integer.parseInt(request.getParameter("location_id"));
                String typeOfAction = request.getParameter("typeOfAction");
                boolean isInsertSuccess = handleService.isInsertSuccess(name, price, type, area, NumOfBedrooms,
                        address, description, user.getId(), location_id);
                if (isInsertSuccess) {
                    PostRental post = handleService.getLastestPostByUserId(user.getId());
                    //-- Luu hinh anh --//
                    handleService.isHandledSaveImageSuccess(post, request.getParts(), appPath, 0);
                    //-- Xong phan luu hinh anh --//
                    if (typeOfAction.equals("upload")) {
                        int accountBalance = handleService.getAccountPointsByUserId(user.getId());
                        request.setAttribute("accountBalance", accountBalance);
                        request.setAttribute("postId", post.getId());
                        handleService.isDeleteDuplicateDraftPostsSuccessByPostId(post.getId(), user.getId(), appPath); // --> xoa bo cac ban nhap giong y het nhau
                        request.getRequestDispatcher("L-pay-for-post.jsp").forward(request, response);
                        // them vao draft thanh cong -> tien hanh thanh toan
                    } else if (typeOfAction.equals("draft")) {
                        // them vao draft thanh cong
                        ArrayList<PostRental> postList = handleService.getEditablePostsByUserId(user.getId());
                        request.setAttribute("postList", postList);
                        request.setAttribute("mess", "Draft post added successfully :)");
                        request.getRequestDispatcher("L-edit-posts.jsp").forward(request, response);
                    }
                }
            } else if (service.equals("done-add-new-post")) {
                String status = (String) request.getParameter("status");
                int postId = Integer.parseInt(request.getParameter("postId"));
                handleService.isUpdatePostStatusByPostIdSuccess(postId, status);
                handleService.isMoneyDedutedByUserId(user.getId(), status);
                handleService.isUpdatedPostDate(postId, status);
                handleService.isInsertedTransactionSuccess(user.getId(), postId, status);
                // Xu ly thanh toan thanh cong
                ArrayList<PostRental> postList = handleService.getPublishedPostsByUserId(user.getId());
                request.setAttribute("postList", postList);
                request.getRequestDispatcher("/housedetail?id=" + postId).forward(request, response);
            } else if (service.equals("transaction-history")) {
                response.sendRedirect("transaction");
                return;
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
