package jobtrans.model;

import java.sql.Date;

public class Conversation {
    private int conversationId;
    private int jobId;
    private Date startDate;

    public Conversation() {
    }

    public Conversation(int conversationId, int jobId, Date startDate) {
        this.conversationId = conversationId;
        this.jobId = jobId;
        this.startDate = startDate;
    }

    public int getConversationId() {
        return conversationId;
    }

    public void setConversationId(int conversationId) {
        this.conversationId = conversationId;
    }

    public int getJobId() {
        return jobId;
    }

    public void setJobId(int jobId) {
        this.jobId = jobId;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }
}
