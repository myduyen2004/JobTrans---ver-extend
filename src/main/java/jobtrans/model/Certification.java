package jobtrans.model;

import java.util.Date;

public class Certification {
    private int certificationId;
    private String certificationName;
    private Date awardYear;
    private String customCertification;
    private String description;

    public Certification() {
    }

    public Certification(int certificationId, String certificationName, Date awardYear, String customCertification, String description) {
        this.certificationId = certificationId;
        this.certificationName = certificationName;
        this.awardYear = awardYear;
        this.customCertification = customCertification;
        this.description = description;
    }
    // Getters and Setters

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

    public Date getAwardYear() {
        return awardYear;
    }

    public void setAwardYear(Date awardYear) {
        this.awardYear = awardYear;
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
                ", awardYear=" + awardYear +
                ", customCertification='" + customCertification + '\'' +
                ", description='" + description + '\'' +
                '}';
    }
}
