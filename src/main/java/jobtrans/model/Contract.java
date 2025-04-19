package jobtrans.model;

import java.util.Date;

import java.util.Date;

public class Contract {
    private int contractId;
    private int jobId;
    private String contractLink;
    private String status;
    private String aName;
    private String aAddress;
    private String aRepresentative;
    private String aEmail;
    private boolean aSignature;
    private String bIdentity;
    private Date bIdentityDate;
    private Date bBirthday;
    private String bAddress;
    private String bPhoneNumber;
    private String bEmail;
    private boolean bSignature;
    private String jobGoal;
    private String jobRequirement;
    private Date startDate;
    private Date endDate;
    private String jobAddress;
    private float jobFee;
    private float jobDepositA;
    private Date jobDepositADate;
    private String jobDepositAText;
    private float jobDepositB;
    private Date jobDepositBDate;
    private String jobDepositBText;

    public Contract() {
    }

    public Contract(int contractId, int jobId, String contractLink, String status, String aName, String aAddress,
                    String aRepresentative, String aEmail, boolean aSignature, String bIdentity, Date bIdentityDate,
                    Date bBirthday, String bAddress, String bPhoneNumber, String bEmail, boolean bSignature,
                    String jobGoal, String jobRequirement, Date startDate, Date endDate, String jobAddress, float jobFee,
                    float jobDepositA, Date jobDepositADate, String jobDepositAText, float jobDepositB, Date jobDepositBDate,
                    String jobDepositBText) {
        this.contractId = contractId;
        this.jobId = jobId;
        this.contractLink = contractLink;
        this.status = status;
        this.aName = aName;
        this.aAddress = aAddress;
        this.aRepresentative = aRepresentative;
        this.aEmail = aEmail;
        this.aSignature = aSignature;
        this.bIdentity = bIdentity;
        this.bIdentityDate = bIdentityDate;
        this.bBirthday = bBirthday;
        this.bAddress = bAddress;
        this.bPhoneNumber = bPhoneNumber;
        this.bEmail = bEmail;
        this.bSignature = bSignature;
        this.jobGoal = jobGoal;
        this.jobRequirement = jobRequirement;
        this.startDate = startDate;
        this.endDate = endDate;
        this.jobAddress = jobAddress;
        this.jobFee = jobFee;
        this.jobDepositA = jobDepositA;
        this.jobDepositADate = jobDepositADate;
        this.jobDepositAText = jobDepositAText;
        this.jobDepositB = jobDepositB;
        this.jobDepositBDate = jobDepositBDate;
        this.jobDepositBText = jobDepositBText;
    }

    // Getters and Setters

    public int getContractId() {
        return contractId;
    }

    public void setContractId(int contractId) {
        this.contractId = contractId;
    }

    public int getJobId() {
        return jobId;
    }

    public void setJobId(int jobId) {
        this.jobId = jobId;
    }

    public String getContractLink() {
        return contractLink;
    }

    public void setContractLink(String contractLink) {
        this.contractLink = contractLink;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getAName() {
        return aName;
    }

    public void setAName(String aName) {
        this.aName = aName;
    }

    public String getAAddress() {
        return aAddress;
    }

    public void setAAddress(String aAddress) {
        this.aAddress = aAddress;
    }

    public String getARepresentative() {
        return aRepresentative;
    }

    public void setARepresentative(String aRepresentative) {
        this.aRepresentative = aRepresentative;
    }

    public String getAEmail() {
        return aEmail;
    }

    public void setAEmail(String aEmail) {
        this.aEmail = aEmail;
    }

    public boolean isASignature() {
        return aSignature;
    }

    public void setASignature(boolean aSignature) {
        this.aSignature = aSignature;
    }

    public String getBIdentity() {
        return bIdentity;
    }

    public void setBIdentity(String bIdentity) {
        this.bIdentity = bIdentity;
    }

    public Date getBIdentityDate() {
        return bIdentityDate;
    }

    public void setBIdentityDate(Date bIdentityDate) {
        this.bIdentityDate = bIdentityDate;
    }

    public Date getBBirthday() {
        return bBirthday;
    }

    public void setBBirthday(Date bBirthday) {
        this.bBirthday = bBirthday;
    }

    public String getBAddress() {
        return bAddress;
    }

    public void setBAddress(String bAddress) {
        this.bAddress = bAddress;
    }

    public String getBPhoneNumber() {
        return bPhoneNumber;
    }

    public void setBPhoneNumber(String bPhoneNumber) {
        this.bPhoneNumber = bPhoneNumber;
    }

    public String getBEmail() {
        return bEmail;
    }

    public void setBEmail(String bEmail) {
        this.bEmail = bEmail;
    }

    public boolean isBSignature() {
        return bSignature;
    }

    public void setBSignature(boolean bSignature) {
        this.bSignature = bSignature;
    }

    public String getJobGoal() {
        return jobGoal;
    }

    public void setJobGoal(String jobGoal) {
        this.jobGoal = jobGoal;
    }

    public String getJobRequirement() {
        return jobRequirement;
    }

    public void setJobRequirement(String jobRequirement) {
        this.jobRequirement = jobRequirement;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public String getJobAddress() {
        return jobAddress;
    }

    public void setJobAddress(String jobAddress) {
        this.jobAddress = jobAddress;
    }

    public float getJobFee() {
        return jobFee;
    }

    public void setJobFee(float jobFee) {
        this.jobFee = jobFee;
    }

    public float getJobDepositA() {
        return jobDepositA;
    }

    public void setJobDepositA(float jobDepositA) {
        this.jobDepositA = jobDepositA;
    }

    public Date getJobDepositADate() {
        return jobDepositADate;
    }

    public void setJobDepositADate(Date jobDepositADate) {
        this.jobDepositADate = jobDepositADate;
    }

    public String getJobDepositAText() {
        return jobDepositAText;
    }

    public void setJobDepositAText(String jobDepositAText) {
        this.jobDepositAText = jobDepositAText;
    }

    public float getJobDepositB() {
        return jobDepositB;
    }

    public void setJobDepositB(float jobDepositB) {
        this.jobDepositB = jobDepositB;
    }

    public Date getJobDepositBDate() {
        return jobDepositBDate;
    }

    public void setJobDepositBDate(Date jobDepositBDate) {
        this.jobDepositBDate = jobDepositBDate;
    }

    public String getJobDepositBText() {
        return jobDepositBText;
    }

    public void setJobDepositBText(String jobDepositBText) {
        this.jobDepositBText = jobDepositBText;
    }
}
