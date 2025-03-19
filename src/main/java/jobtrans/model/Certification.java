package jobtrans.model;

import java.util.Date;

public class Certification {
    private int certificationId;
    private String certificationName;
    private Date year;
    private String customCertification;
    private String description;

    // Constructor
    public Certification(int certificationId, String certificationName, Date year, String customCertification, String description) {
        this.certificationId = certificationId;
        this.certificationName = certificationName;
        this.year = year;
        this.customCertification = customCertification;
        this.description = description;
    }

    // Getter và Setter
    public int getCertificationId() {
        return certificationId;
    }

    public void setCertificationId(int certificationId) {
        this.certificationId = certificationId;
    }

    public String getCertificationName() {
        return certificationName;
    }

    public void setCertificationName(String certificationName) {
        this.certificationName = certificationName;
    }

    public Date getYear() {
        return year;
    }

    public void setYear(Date year) {
        this.year = year;
    }

    public String getCustomCertification() {
        return customCertification;
    }

    public void setCustomCertification(String customCertification) {
        this.customCertification = customCertification;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "Certification{" +
                "certificationId=" + certificationId +
                ", certificationName='" + certificationName + '\'' +
                ", year=" + year +
                ", customCertification='" + customCertification + '\'' +
                ", description='" + description + '\'' +
                '}';
    }
}
