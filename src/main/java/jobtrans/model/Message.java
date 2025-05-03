package jobtrans.model;

import java.util.Date;

public class Message {
    private int messageId;
    private int conversationId;
    private int senderId;
    private String senderName;
    private String content;
    private Date sentTime;
    private Integer repliedToId; // Cho phép null
    private boolean isSticker;
    private String attachmentUrl;
    private String repliedContent;

    // Constructors
    public Message() {}

    public Message(int messageId, int conversationId, int senderId, String content, Date sentTime,
                   Integer repliedToId, boolean isSticker, String attachmentUrl) {
        this.messageId = messageId;
        this.conversationId = conversationId;
        this.senderId = senderId;
        this.content = content;
        this.sentTime = sentTime;
        this.repliedToId = repliedToId;
        this.isSticker = isSticker;
        this.attachmentUrl = attachmentUrl;
    }

    // Getters and Setters
    public int getMessageId() {
        return messageId;
    }

    public void setMessageId(int messageId) {
        this.messageId = messageId;
    }

    public int getConversationId() {
        return conversationId;
    }

    public void setConversationId(int conversationId) {
        this.conversationId = conversationId;
    }

    public int getSenderId() {
        return senderId;
    }

    public void setSenderId(int senderId) {
        this.senderId = senderId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getSentTime() {
        return sentTime;
    }

    public void setSentTime(Date sentTime) {
        this.sentTime = sentTime;
    }

    public Integer getRepliedToId() {
        return repliedToId;
    }

    public void setRepliedToId(Integer repliedToId) {
        this.repliedToId = repliedToId;
    }

    public boolean isSticker() {
        return isSticker;
    }

    public void setSticker(boolean isSticker) {
        this.isSticker = isSticker;
    }

    public String getAttachmentUrl() {
        return attachmentUrl;
    }

    public void setAttachmentUrl(String attachmentUrl) {
        this.attachmentUrl = attachmentUrl;
    }

    public String getSenderName() {
        return senderName;
    }

    public void setSenderName(String senderName) {
        this.senderName = senderName;
    }

    public String getRepliedContent() {
        return repliedContent;
    }

    public void setRepliedContent(String repliedContent) {
        this.repliedContent = repliedContent;
    }
}
