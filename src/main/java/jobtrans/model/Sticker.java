package jobtrans.model;

public class Sticker {
    private int stickerId;
    private String stickerUrl;
    private String stickerName;

    // Constructors
    public Sticker() {}

    public Sticker(int stickerId, String stickerUrl, String stickerName) {
        this.stickerId = stickerId;
        this.stickerUrl = stickerUrl;
        this.stickerName = stickerName;
    }

    // Getters and Setters
    public int getStickerId() {
        return stickerId;
    }

    public void setStickerId(int stickerId) {
        this.stickerId = stickerId;
    }

    public String getStickerUrl() {
        return stickerUrl;
    }

    public void setStickerUrl(String stickerUrl) {
        this.stickerUrl = stickerUrl;
    }

    public String getStickerName() {
        return stickerName;
    }

    public void setStickerName(String stickerName) {
        this.stickerName = stickerName;
    }
}
