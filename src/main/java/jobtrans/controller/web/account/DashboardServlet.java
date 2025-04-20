package jobtrans.controller.web.account;

import com.google.gson.Gson;
import jobtrans.dal.DashboardDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "DashboardServlet", urlPatterns = {"/WeeklyRevenue", "/MonthlyRevenue","/JobsByYears","/JobByDays","/JobByMonths"})
public class DashboardServlet extends HttpServlet {
    private DashboardDAO   dashboardDAO = new DashboardDAO();
    private Gson gson =new Gson();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        String path = request.getServletPath();

        if ("/WeeklyRevenue".equals(path)) {
            // Lấy dữ liệu hàng tuần (hoặc hàng ngày tùy theo logic DAO của bạn)
            List<Map<String, Object>> weeklyRevenueData = dashboardDAO.getDailyRevenue();
            String jsonData = gson.toJson(weeklyRevenueData);
            response.getWriter().write(jsonData);
        } else if ("/MonthlyRevenue".equals(path)) {

            // Lấy dữ liệu hàng tháng
            List<Map<String, Object>> monthlyRevenueData = dashboardDAO.getMonthlyRevenue();
            String jsonData = gson.toJson(monthlyRevenueData);
            response.getWriter().write(jsonData);
        }else if ("/JobsByYears".equals(path)) {

            List<Map<String, Object>> jobStatisticsList  = dashboardDAO.getJobStatisticsByYear();
            String jsonData = gson.toJson(jobStatisticsList);
            response.getWriter().write(jsonData);

        }else if ("/JobByDays".equals(path)) {
            List<Map<String, Object>> jobStatisticsList = dashboardDAO.getJobStatisticsByDay();
            String jsonData = gson.toJson(jobStatisticsList);
            response.getWriter().write(jsonData);

        }
        else if ("/JobByMonths".equals(path)) {
            System.out.println("Servlet /JobTrans/JobsBy đã được gọi!");
            List<Map<String, Object>> jobStatisticsList = dashboardDAO.getJobStatisticsByMonth();
            String jsonData = gson.toJson(jobStatisticsList);
            response.getWriter().write(jsonData);

        }
    }


}


