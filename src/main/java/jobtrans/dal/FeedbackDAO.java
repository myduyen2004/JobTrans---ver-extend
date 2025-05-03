package jobtrans.dal;

import jobtrans.model.*;
import jobtrans.utils.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class FeedbackDAO {
    private final DBConnection dbConnection;

    public FeedbackDAO() {
        dbConnection = DBConnection.getInstance();
    }

    public List<Feedback> getFeedbackBytoUserIdAndJobId(int toUserId, int jobId) {
        List<Feedback> feedbacks = new ArrayList<>();

        String query = "SELECT * FROM Feedback WHERE to_user_id = ? and job_id = ?";

        try {
            Connection con = dbConnection.openConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, toUserId);
            ps.setInt(2, jobId);
            ResultSet resultSet = ps.executeQuery();
            while (resultSet.next()) {
                Feedback feedback = new Feedback();
                feedback.setFeedbackId(resultSet.getInt("feedback_id"));
                feedback.setJobId(resultSet.getInt("job_id"));
                feedback.setFromUserId(resultSet.getInt("from_user_id"));
                feedback.setToUserId(resultSet.getInt("to_user_id"));
                feedback.setRating(resultSet.getInt("rating"));
                feedback.setContent(resultSet.getString("content"));
                feedback.setCreatedAt(resultSet.getTimestamp("created_at"));
                feedback.setType(resultSet.getString("type"));

                feedbacks.add(feedback);
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return feedbacks;
    }

    public Feedback getFeedbackByToUserIdAndJobIdAndFromUserId(int toUserId, int jobId, int fromUserId) {
        Feedback feedback = null;

        String query = "SELECT * FROM Feedback WHERE to_user_id = ? and job_id = ? and from_user_id = ?";

        try {
            Connection con = dbConnection.openConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, toUserId);
            ps.setInt(2, jobId);
            ps.setInt(3, fromUserId);
            ResultSet resultSet = ps.executeQuery();
            if (resultSet.next()) {
                feedback = new Feedback();
                feedback.setFeedbackId(resultSet.getInt("feedback_id"));
                feedback.setJobId(resultSet.getInt("job_id"));
                feedback.setFromUserId(resultSet.getInt("from_user_id"));
                feedback.setToUserId(resultSet.getInt("to_user_id"));
                feedback.setRating(resultSet.getInt("rating"));
                feedback.setContent(resultSet.getString("content"));
                feedback.setCreatedAt(resultSet.getTimestamp("created_at"));
                feedback.setType(resultSet.getString("type"));
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return feedback;
    }

    public void addFeedback(Feedback feedback) {
        String query = "INSERT INTO Feedback (job_id, from_user_id, to_user_id, rating, content, type) " +
                "VALUES (?, ?, ?, ?, ?, ?)";

        try {
            Connection con = dbConnection.openConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, feedback.getJobId());
            ps.setInt(2, feedback.getFromUserId());
            ps.setInt(3, feedback.getToUserId());
            ps.setInt(4, feedback.getRating());
            ps.setNString(5, feedback.getContent());
            ps.setNString(6, feedback.getType());

            ps.executeUpdate();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

//    public static void main(String[] args) {
//        FeedbackDAO feedbackDAO = new FeedbackDAO();
//        System.out.println(feedbackDAO.getFeedbackByToUserIdAndJobIdAndFromUserId(2, 9, 7));
//    }
}
