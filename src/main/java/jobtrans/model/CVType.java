package jobtrans.model;

public class CVType {
    private int typeId;
    private String typeName;
    private String description;
    private int priceCv;
    private String imageCv;

    public CVType() {
    }

    public CVType(int typeId, String typeName, String description, int priceCv, String imageCv) {
        this.typeId = typeId;
        this.typeName = typeName;
        this.description = description;
        this.priceCv = priceCv;
        this.imageCv = imageCv;
    }

    public int getTypeId() {
        return typeId;
    }

    public void setTypeId(int typeId) {
        this.typeId = typeId;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getPriceCv() {
        return priceCv;
    }

    public void setPriceCv(int priceCv) {
        this.priceCv = priceCv;
    }

    public String getImageCv() {
        return imageCv;
    }

    public void setImageCv(String imageCv) {
        this.imageCv = imageCv;
    }

}
