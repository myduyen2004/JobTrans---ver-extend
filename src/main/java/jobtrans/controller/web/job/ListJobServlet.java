package jobtrans.controller.web.job;

import jobtrans.dal.JobCategoryDAO;
import jobtrans.dal.JobDAO;
import jobtrans.model.Job;
import jobtrans.model.JobCategory;
import java.math.BigDecimal;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.Normalizer;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;


@WebServlet("/viec-lam")
public class ListJobServlet extends HttpServlet {
    private static final int JOBS_PER_PAGE = 5; // Số công việc trên một trang, bạn có thể điều chỉnh
    JobCategoryDAO jobCategoryDAO = new JobCategoryDAO();
    JobCategory jobCategory = new JobCategory();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String priceFilter = request.getParameter("price");
        String jobTypeFilter = request.getParameter("jobType");
        String sortType = request.getParameter("sort");
        String keyword = request.getParameter("keyword");
        int currentPage = 1;

        // Lấy thông tin từ Path Info trước (ưu tiên cho lần đầu sắp xếp/lọc)
        String pathInfo = request.getPathInfo();
        if (pathInfo != null && !pathInfo.equals("/")) {
            String[] parts = pathInfo.split("/");
            for (String part : parts) {
                if (part.equals("sap-xep-theo-moi-nhat")) {
                    sortType = "recent";
                } else if (part.equals("sap-xep-theo-gia-giam")) {
                    sortType = "price-desc";
                } else if (part.equals("sap-xep-theo-gia-tang")) {
                    sortType = "price-asc";
                } else if (part.startsWith("gia-")) {
                    priceFilter = part.substring(4).replace("-trieu", "m").replace("-den-", "-");
                    if (priceFilter.equals("tat-ca")) priceFilter = null;
                } else if (part.startsWith("trang-")) {
                    try {
                        currentPage = Integer.parseInt(part.substring(6));
                    } catch (NumberFormatException e) {
                        System.err.println("Invalid page parameter in Path Info: " + part);
                    }
                }
            }
        }

        // Lấy thông tin từ Query Parameters (ưu tiên cho chuyển trang phân trang)
        String pageParam = request.getParameter("page");

        if (pageParam != null && !pageParam.isEmpty()) {
            try {
                currentPage = Integer.parseInt(pageParam);
            } catch (NumberFormatException e) {
                System.err.println("Invalid page parameter in Query Param: " + pageParam);
            }
        }

        // Lấy sort, priceFilter, jobTypeFilter từ Query Parameters (ghi đè nếu đã có từ Path Info)
        if (request.getParameter("sort") != null) {
            sortType = request.getParameter("sort");
        }
        if (request.getParameter("price") != null && !request.getParameter("price").equals("tat-ca")) {
            priceFilter = request.getParameter("price");
        }
        if (request.getParameter("jobType") != null && !request.getParameter("jobType").equals("all")) {
            jobTypeFilter = request.getParameter("jobType");
        }

        List<Job> filteredAndSortedJobs;

        // Nếu có từ khóa tìm kiếm, thực hiện tìm kiếm
        if (keyword != null && !keyword.trim().isEmpty()) {
            filteredAndSortedJobs = searchJobs(keyword);
            // Lưu từ khóa tìm kiếm để hiển thị trên UI
            request.setAttribute("keyword", keyword);
        } else {
            // Nếu không có từ khóa, lấy tất cả công việc
            JobDAO jobDAO = new JobDAO();
            filteredAndSortedJobs = new ArrayList<>(jobDAO.getAllJob());
        }

        // Lọc theo giá
        if (priceFilter != null && !priceFilter.isEmpty()) {
            filterByPrice(filteredAndSortedJobs, priceFilter);
        }

        // Lọc theo loại công việc (đã thay đổi vị trí để lọc trước khi phân trang)
        if (jobTypeFilter != null && !jobTypeFilter.isEmpty() && !jobTypeFilter.equals("all")) {
            String finalJobTypeFilter = jobTypeFilter.toLowerCase();

            filteredAndSortedJobs.removeIf(job -> {
                JobCategory category = jobCategoryDAO.getJobCategoryByJobId(job.getJobId());
                job.setJobCategory(category); // Gán jobCategory vào job

                if (category != null && category.getCategoryName() != null) {
                    String jobCategoryNameLower = removeDiacritics(category.getCategoryName().toLowerCase().replaceAll("\\s+", ""));
                    return !finalJobTypeFilter.equals(jobCategoryNameLower);
                }
                return true;
            });
        }

        // Sắp xếp danh sách
        if (sortType != null) {
            switch (sortType) {
                case "recent":
                    filteredAndSortedJobs.sort(Comparator.comparing(Job::getPostDate).reversed());
                    break;
                case "price-desc":
                    filteredAndSortedJobs.sort(Comparator.comparing(Job::getBudgetMax, Comparator.reverseOrder()));
                    break;
                case "price-asc":
                    filteredAndSortedJobs.sort(Comparator.comparing(Job::getBudgetMax));
                    break;
            }
        }
        // Tính toán thông số phân trang DỰA TRÊN DANH SÁCH ĐÃ LỌC VÀ SẮP XẾP(để dưới cùng)
        int totalJobs = filteredAndSortedJobs.size();
        System.out.println("Total Jobs: " + totalJobs);
        int totalPages = (int) Math.ceil((double) totalJobs / JOBS_PER_PAGE);
        if (currentPage > totalPages && totalPages > 0) {
            currentPage = totalPages;
        }//xử lý nếu trang hiện tại lớn hơn tổng số trang
        int start = (currentPage - 1) * JOBS_PER_PAGE;
        int end = Math.min(start + JOBS_PER_PAGE, totalJobs);

        List<Job> jobsToDisplay = filteredAndSortedJobs.subList(start, end);

        // Lấy JobCategory cho từng công việc HIỂN THỊ TRÊN TRANG HIỆN TẠI nếu chưa có
        for (Job job : jobsToDisplay) {
            if (job.getJobCategory() == null) {
                JobCategory category = jobCategoryDAO.getJobCategoryByJobId(job.getJobId());
                job.setJobCategory(category);
            }
        }

        // Truyền dữ liệu cho JSP
        request.setAttribute("start", start);
        request.setAttribute("end", end);
        request.setAttribute("jobList", jobsToDisplay);
        request.setAttribute("totalJobs", totalJobs);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("sortType", sortType);
        request.setAttribute("priceFilter", priceFilter);
        request.setAttribute("jobTypeFilter", jobTypeFilter);

        request.getRequestDispatcher("/listJob.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    // CHUẨN HÓA CÁC KÝ TỰ CÓ DẤU
    public static String removeDiacritics(String input) {
        return Normalizer.normalize(input, Normalizer.Form.NFD).replaceAll("\\p{InCombiningDiacriticalMarks}+", "");
    }

    // Sắp xếp theo giá tiền


    private void filterByPrice(List<Job> jobs, String priceFilter) {
        try {
            BigDecimal oneMillion = new BigDecimal("1000000");
            BigDecimal twoMillion = new BigDecimal("2000000");
            BigDecimal threeMillion = new BigDecimal("3000000");
            BigDecimal fourMillion = new BigDecimal("4000000");
            BigDecimal fiveMillion = new BigDecimal("5000000");
            BigDecimal tenMillion = new BigDecimal("10000000");
            BigDecimal twentyMillion = new BigDecimal("20000000");
            BigDecimal thirtyMillion = new BigDecimal("30000000");
            BigDecimal fiftyMillion = new BigDecimal("50000000");

            switch (priceFilter) {
                case "under1m":
                    jobs.removeIf(job -> job.getBudgetMax().compareTo(oneMillion) >= 0);
                    break;
                case "1-2m":
                    jobs.removeIf(job -> job.getBudgetMax().compareTo(oneMillion) < 0 || job.getBudgetMax().compareTo(twoMillion) > 0);
                    break;
                case "3-4m":
                    jobs.removeIf(job -> job.getBudgetMax().compareTo(threeMillion) < 0 || job.getBudgetMax().compareTo(fourMillion) > 0);
                    break;
                case "4-5m":
                    jobs.removeIf(job -> job.getBudgetMax().compareTo(fourMillion) < 0 || job.getBudgetMax().compareTo(fiveMillion) > 0);
                    break;
                case "5-10m":
                    jobs.removeIf(job -> job.getBudgetMax().compareTo(fiveMillion) < 0 || job.getBudgetMax().compareTo(tenMillion) > 0);
                    break;
                case "10-20m":
                    jobs.removeIf(job -> job.getBudgetMax().compareTo(tenMillion) < 0 || job.getBudgetMax().compareTo(twentyMillion) > 0);
                    break;
                case "20-30m":
                    jobs.removeIf(job -> job.getBudgetMax().compareTo(twentyMillion) < 0 || job.getBudgetMax().compareTo(thirtyMillion) > 0);
                    break;
                case "30-50m":
                    jobs.removeIf(job -> job.getBudgetMax().compareTo(thirtyMillion) < 0 || job.getBudgetMax().compareTo(fiftyMillion) > 0);
                    break;
                case "above50m":
                    jobs.removeIf(job -> job.getBudgetMax().compareTo(fiftyMillion) <= 0);
                    break;
            }
        } catch (NumberFormatException e) {
            System.err.println("Error in price filtering: " + e.getMessage());
        }
    }

    // Tối ưu hàm tìm kiếm để trả về danh sách công việc thay vì chuyển hướng
    private List<Job> searchJobs(String keyword) {
        JobDAO jobDao = new JobDAO();
        List<Job> jobList = new ArrayList<>();
        try {
            jobList = jobDao.searchJobsByKeyword(keyword);
        } catch (Exception ex) {
            System.out.println("Error searching jobs: " + ex.getMessage());
        }
        return jobList;
    }
}