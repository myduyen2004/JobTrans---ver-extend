package jobtrans.model;

import java.sql.Timestamp;

public class Message {
    private int messageId;
    private int jobId;
    private int senderId;
    private int conversationId;
    private String attachment;
    private String content;
    private Timestamp sentTime;

    public Message() {
    }

    public Message(int messageId, int jobId, int senderId, int conversationId, String attachment, String content, Timestamp sentTime) {
        this.messageId = messageId;
        this.jobId = jobId;
        this.senderId = senderId;
        this.conversationId = conversationId;
        this.attachment = attachment;
        this.content = content;
        this.sentTime = sentTime;
    }

    public int getMessageId() {
        return messageId;
    }

    public void setMessageId(int messageId) {
        this.messageId = messageId;
    }

    public int getJobId() {
        return jobId;
    }

    public void setJobId(int jobId) {
        this.jobId = jobId;
    }

    public int getSenderId() {
        return senderId;
    }

    public void setSenderId(int senderId) {
        this.senderId = senderId;
    }

    public int getConversationId() {
        return conversationId;
    }

    public void setConversationId(int conversationId) {
        this.conversationId = conversationId;
    }

    public String getAttachment() {
        return attachment;
    }

    public void setAttachment(String attachment) {
        this.attachment = attachment;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Timestamp getSentTime() {
        return sentTime;
    }

    public void setSentTime(Timestamp sentTime) {
        this.sentTime = sentTime;
    }
}

