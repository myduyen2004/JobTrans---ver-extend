package jobtrans.model;

public class Tag {
    private int tagId;
    private String tagName;
    private String description;

    // Constructors
    public Tag() {
    }

    public Tag(int tagId, String tagName, String description) {
        this.tagId = tagId;
        this.tagName = tagName;
        this.description = description;
    }

    // Getters and Setters
    public int getTagId() {
        return tagId;
    }

    public void setTagId(int tagId) {
        this.tagId = tagId;
    }

    public String getTagName() {
        return tagName;
    }

    public void setTagName(String tagName) {
        this.tagName = tagName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
