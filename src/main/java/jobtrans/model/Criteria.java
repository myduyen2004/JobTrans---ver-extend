package jobtrans.model;

public class Criteria {
    private int criteriaId;
    private String content;
    private int criteriaPoint;
    private String labelTag;
    private String typeCriteria; // Trừ điểm, Cộng điểm, Block, Nhãn cảnh báo

    // Constructors
    public Criteria() {
    }

    public Criteria(int criteriaId, String content, int criteriaPoint, String labelTag, String typeCriteria) {
        this.criteriaId = criteriaId;
        this.content = content;
        this.criteriaPoint = criteriaPoint;
        this.labelTag = labelTag;
        this.typeCriteria = typeCriteria;
    }

    // Getters and Setters
    public int getCriteriaId() {
        return criteriaId;
    }

    public void setCriteriaId(int criteriaId) {
        this.criteriaId = criteriaId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getCriteriaPoint() {
        return criteriaPoint;
    }

    public void setCriteriaPoint(int criteriaPoint) {
        this.criteriaPoint = criteriaPoint;
    }

    public String getLabelTag() {
        return labelTag;
    }

    public void setLabelTag(String labelTag) {
        this.labelTag = labelTag;
    }

    public String getTypeCriteria() {
        return typeCriteria;
    }

    public void setTypeCriteria(String typeCriteria) {
        this.typeCriteria = typeCriteria;
    }
}
