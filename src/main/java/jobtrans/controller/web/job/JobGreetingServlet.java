package jobtrans.controller.web.job;


import jobtrans.dal.JobDAO;
import jobtrans.dal.JobGreetingDAO;
import jobtrans.model.Account;
import jobtrans.model.JobGreeting;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name="JobGreetingServlet", urlPatterns={"/job-greeting"})
public class JobGreetingServlet extends HttpServlet {

}