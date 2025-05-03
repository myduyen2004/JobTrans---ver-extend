package jobtrans.model;

import java.math.BigDecimal;
import java.util.Date;

public class Contract {
    private int contractId;
    private int applicantId;
    private int employerId;
    private int jobId;
    private String contractPreview;
    private String contractLink;
    private String status;

    private String aName;
    private String aIdentity;
    private Date aIdentityDate;
    private String aIdentityAddress;
    private Date aBirthday;
    private String aAddress;
    private String aRepresentative;
    private String aTaxCode;
    private String aPhoneNumber;
    private String aEmail;
    private boolean aSignature;

    private String bIdentity;
    private Date bIdentityDate;
    private String bIdentityAddress;
    private Date bBirthday;
    private String bAddress;
    private String bRepresentative;
    private String bPhoneNumber;
    private String bEmail;
    private boolean bSignature;

    private String jobGoal;
    private String jobRequirement;
    private Date startDate;
    private Date endDate;
    private String jobAddress;
    private BigDecimal jobFee;
    private BigDecimal jobDepositA;
    private Date jobDepositADate;
    private String jobDepositAText;
    private BigDecimal jobDepositB;
    private Date jobDepositBDate;
    private String jobDepositBText;

    public Contract() {
    }

    public Contract(int contractId, int applicantId, int employerId, int jobId, String contractPreview,
                    String contractLink, String status, String aName, String aIdentity, Date aIdentityDate,
                    String aIdentityAddress, Date aBirthday, String aAddress, String aRepresentative,
                    String aTaxCode, String aPhoneNumber, String aEmail, boolean aSignature,
                    String bIdentity, Date bIdentityDate, String bIdentityAddress, Date bBirthday,
                    String bAddress, String bRepresentative, String bPhoneNumber, String bEmail, boolean bSignature,
                    String jobGoal, String jobRequirement, Date startDate, Date endDate, String jobAddress,
                    BigDecimal jobFee, BigDecimal jobDepositA, Date jobDepositADate, String jobDepositAText,
                    BigDecimal jobDepositB, Date jobDepositBDate, String jobDepositBText) {
        this.contractId = contractId;
        this.applicantId = applicantId;
        this.employerId = employerId;
        this.jobId = jobId;
        this.contractPreview = contractPreview;
        this.contractLink = contractLink;
        this.status = status;
        this.aName = aName;
        this.aIdentity = aIdentity;
        this.aIdentityDate = aIdentityDate;
        this.aIdentityAddress = aIdentityAddress;
        this.aBirthday = aBirthday;
        this.aAddress = aAddress;
        this.aRepresentative = aRepresentative;
        this.aTaxCode = aTaxCode;
        this.aPhoneNumber = aPhoneNumber;
        this.aEmail = aEmail;
        this.aSignature = aSignature;
        this.bIdentity = bIdentity;
        this.bIdentityDate = bIdentityDate;
        this.bIdentityAddress = bIdentityAddress;
        this.bBirthday = bBirthday;
        this.bAddress = bAddress;
        this.bRepresentative = bRepresentative;
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

    public int getApplicantId() {
        return applicantId;
    }

    public void setApplicantId(int applicantId) {
        this.applicantId = applicantId;
    }

    public int getEmployerId() {
        return employerId;
    }

    public void setEmployerId(int employerId) {
        this.employerId = employerId;
    }

    public int getJobId() {
        return jobId;
    }

    public void setJobId(int jobId) {
        this.jobId = jobId;
    }

    public String getContractPreview() {
        return contractPreview;
    }

    public void setContractPreview(String contractPreview) {
        this.contractPreview = contractPreview;
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

    public String getaName() {
        return aName;
    }

    public void setaName(String aName) {
        this.aName = aName;
    }

    public String getaIdentity() {
        return aIdentity;
    }

    public void setaIdentity(String aIdentity) {
        this.aIdentity = aIdentity;
    }

    public Date getaIdentityDate() {
        return aIdentityDate;
    }

    public void setaIdentityDate(Date aIdentityDate) {
        this.aIdentityDate = aIdentityDate;
    }

    public String getaIdentityAddress() {
        return aIdentityAddress;
    }

    public void setaIdentityAddress(String aIdentityAddress) {
        this.aIdentityAddress = aIdentityAddress;
    }

    public Date getaBirthday() {
        return aBirthday;
    }

    public void setaBirthday(Date aBirthday) {
        this.aBirthday = aBirthday;
    }

    public String getaAddress() {
        return aAddress;
    }

    public void setaAddress(String aAddress) {
        this.aAddress = aAddress;
    }

    public String getaRepresentative() {
        return aRepresentative;
    }

    public void setaRepresentative(String aRepresentative) {
        this.aRepresentative = aRepresentative;
    }

    public String getaTaxCode() {
        return aTaxCode;
    }

    public void setaTaxCode(String aTaxCode) {
        this.aTaxCode = aTaxCode;
    }

    public String getaPhoneNumber() {
        return aPhoneNumber;
    }

    public void setaPhoneNumber(String aPhoneNumber) {
        this.aPhoneNumber = aPhoneNumber;
    }

    public String getaEmail() {
        return aEmail;
    }

    public void setaEmail(String aEmail) {
        this.aEmail = aEmail;
    }

    public boolean isaSignature() {
        return aSignature;
    }

    public void setaSignature(boolean aSignature) {
        this.aSignature = aSignature;
    }

    public String getbIdentity() {
        return bIdentity;
    }

    public void setbIdentity(String bIdentity) {
        this.bIdentity = bIdentity;
    }

    public Date getbIdentityDate() {
        return bIdentityDate;
    }

    public void setbIdentityDate(Date bIdentityDate) {
        this.bIdentityDate = bIdentityDate;
    }

    public String getbIdentityAddress() {
        return bIdentityAddress;
    }

    public void setbIdentityAddress(String bIdentityAddress) {
        this.bIdentityAddress = bIdentityAddress;
    }

    public Date getbBirthday() {
        return bBirthday;
    }

    public void setbBirthday(Date bBirthday) {
        this.bBirthday = bBirthday;
    }

    public String getbAddress() {
        return bAddress;
    }

    public void setbAddress(String bAddress) {
        this.bAddress = bAddress;
    }

    public String getbRepresentative() {
        return bRepresentative;
    }

    public void setbRepresentative(String bRepresentative) {
        this.bRepresentative = bRepresentative;
    }

    public String getbPhoneNumber() {
        return bPhoneNumber;
    }

    public void setbPhoneNumber(String bPhoneNumber) {
        this.bPhoneNumber = bPhoneNumber;
    }

    public String getbEmail() {
        return bEmail;
    }

    public void setbEmail(String bEmail) {
        this.bEmail = bEmail;
    }

    public boolean isbSignature() {
        return bSignature;
    }

    public void setbSignature(boolean bSignature) {
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

    public BigDecimal getJobFee() {
        return jobFee;
    }

    public void setJobFee(BigDecimal jobFee) {
        this.jobFee = jobFee;
    }

    public BigDecimal getJobDepositA() {
        return jobDepositA;
    }

    public void setJobDepositA(BigDecimal jobDepositA) {
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

    public BigDecimal getJobDepositB() {
        return jobDepositB;
    }

    public void setJobDepositB(BigDecimal jobDepositB) {
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

    @Override
    public String toString() {
        return "Contract{" +
                "contractId=" + contractId +
                ", applicantId=" + applicantId +
                ", employerId=" + employerId +
                ", jobId=" + jobId +
                ", contractPreview='" + contractPreview + '\'' +
                ", contractLink='" + contractLink + '\'' +
                ", status='" + status + '\'' +
                ", aName='" + aName + '\'' +
                ", aIdentity='" + aIdentity + '\'' +
                ", aIdentityDate=" + aIdentityDate +
                ", aIdentityAddress='" + aIdentityAddress + '\'' +
                ", aBirthday=" + aBirthday +
                ", aAddress='" + aAddress + '\'' +
                ", aRepresentative='" + aRepresentative + '\'' +
                ", aTaxCode='" + aTaxCode + '\'' +
                ", aPhoneNumber='" + aPhoneNumber + '\'' +
                ", aEmail='" + aEmail + '\'' +
                ", aSignature=" + aSignature +
                ", bIdentity='" + bIdentity + '\'' +
                ", bIdentityDate=" + bIdentityDate +
                ", bIdentityAddress='" + bIdentityAddress + '\'' +
                ", bBirthday=" + bBirthday +
                ", bAddress='" + bAddress + '\'' +
                ", bPhoneNumber='" + bPhoneNumber + '\'' +
                ", bEmail='" + bEmail + '\'' +
                ", bSignature=" + bSignature +
                ", jobGoal='" + jobGoal + '\'' +
                ", jobRequirement='" + jobRequirement + '\'' +
                ", startDate=" + startDate +
                ", endDate=" + endDate +
                ", jobAddress='" + jobAddress + '\'' +
                ", jobFee=" + jobFee +
                ", jobDepositA=" + jobDepositA +
                ", jobDepositADate=" + jobDepositADate +
                ", jobDepositAText='" + jobDepositAText + '\'' +
                ", jobDepositB=" + jobDepositB +
                ", jobDepositBDate=" + jobDepositBDate +
                ", jobDepositBText='" + jobDepositBText + '\'' +
                '}';
    }
}