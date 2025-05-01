package jobtrans.dal;

import jobtrans.model.Message;
import jobtrans.utils.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MessageDAO {
    private final DBConnection dbConnection;

    public MessageDAO() {
        dbConnection = DBConnection.getInstance();
    }

    // 1. saveMessage
    public boolean saveMessage(Message message) throws Exception {
        String sql = "INSERT INTO Message (conversation_id, sender_id, content, sent_time, replied_to_id, is_sticker, attachment_url) " +
                "VALUES (?, ?, ?, GETDATE(), ?, ?, ?)";
        try (PreparedStatement stmt = dbConnection.openConnection().prepareStatement(sql)) {
            stmt.setInt(1, message.getConversationId());
            stmt.setInt(2, message.getSenderId());
            stmt.setString(3, message.getContent());
            if (message.getRepliedToId() != null) {
                stmt.setInt(4, message.getRepliedToId());
            } else {
                stmt.setNull(4, Types.INTEGER);
            }
            stmt.setBoolean(5, message.isSticker());
            stmt.setString(6, message.getAttachmentUrl());

            int rowsInserted = stmt.executeUpdate();
            return rowsInserted > 0; // Trả về true nếu có ít nhất 1 dòng được chèn
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }




    public List<Message> getRecentMessages(int conversationId, int limit) {
        List<Message> messages = new ArrayList<>();
        String query = "SELECT m.*, a.account_name, " +
                "rm.content as replied_content " +
                "FROM Message m " +
                "JOIN Account a ON m.sender_id = a.account_id " +
                "LEFT JOIN Message rm ON m.replied_to_id = rm.message_id " +
                "WHERE m.conversation_id = ?"+
                "ORDER BY m.sent_time ASC " +
                "OFFSET 0 ROWS FETCH NEXT ? ROWS ONLY";

        try (
             PreparedStatement ps = dbConnection.openConnection().prepareStatement(query)) {

            ps.setInt(1, conversationId);
            ps.setInt(2, limit);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Message message = new Message();
                    message.setMessageId(rs.getInt("message_id"));
                    message.setConversationId(rs.getInt("conversation_id"));
                    message.setSenderId(rs.getInt("sender_id"));
                    message.setSenderName(rs.getString("account_name"));
                    message.setContent(rs.getString("content"));
                    message.setSentTime(rs.getTimestamp("sent_time"));

                    Integer repliedToId = rs.getInt("replied_to_id");
                    if (!rs.wasNull()) {
                        message.setRepliedToId(repliedToId);
                        message.setRepliedContent(rs.getString("replied_content"));
                    }

                    message.setSticker(rs.getBoolean("is_sticker"));
                    message.setAttachmentUrl(rs.getString("attachment_url"));

                    messages.add(message);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return messages;
    }

    /**
     * Lấy tin nhắn theo ID
     * @param messageId ID của tin nhắn cần lấy
     * @return đối tượng Message hoặc null nếu không tìm thấy
     */

    private String getMessageContent(int messageId) {
        String query = "SELECT content FROM Message WHERE message_id = ?";

        try (PreparedStatement ps = dbConnection.openConnection().prepareStatement(query)) {

            ps.setInt(1, messageId);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getString("content");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return null;
    }

    public Message getMessageById(int messageId) {
        String query = "SELECT m.*, a.account_name " +
                "FROM Message m " +
                "JOIN Account a ON m.sender_id = a.account_id " +
                "WHERE m.message_id = ?";

        try (PreparedStatement ps = dbConnection.openConnection().prepareStatement(query)) {

            ps.setInt(1, messageId);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Message message = new Message();
                    message.setMessageId(rs.getInt("message_id"));
                    message.setConversationId(rs.getInt("conversation_id"));
                    message.setSenderId(rs.getInt("sender_id"));
                    message.setSenderName(rs.getString("account_name"));
                    message.setContent(rs.getString("content"));
                    message.setSentTime(rs.getTimestamp("sent_time"));

                    Integer repliedToId = rs.getInt("replied_to_id");
                    if (!rs.wasNull()) {
                        message.setRepliedToId(repliedToId);
                        // Lấy nội dung tin nhắn được reply trong một truy vấn khác
                        message.setRepliedContent(getMessageContent(repliedToId));
                    }

                    message.setSticker(rs.getBoolean("is_sticker"));
                    message.setAttachmentUrl(rs.getString("attachment_url"));

                    return message;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return null;
    }



    private Message extractMessage(ResultSet rs) throws SQLException {
        Message msg = new Message();
        msg.setMessageId(rs.getInt("message_id"));
        msg.setConversationId(rs.getInt("conversation_id"));
        msg.setSenderId(rs.getInt("sender_id"));
        msg.setContent(rs.getString("content"));
        msg.setSentTime(rs.getTimestamp("sent_time"));
        msg.setRepliedToId(rs.getObject("replied_to_id") != null ? rs.getInt("replied_to_id") : null);
        msg.setSticker(rs.getBoolean("is_sticker"));
        msg.setAttachmentUrl(rs.getString("attachment_url"));
        return msg;
    }
}
