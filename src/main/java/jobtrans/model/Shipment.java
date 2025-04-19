package jobtrans.model;

public class Shipment {
    private int shipmentId;
    private String thirdPartOrderId;
    private int jobId;
    private int senderId;
    private String pickName;
    private String pickProvince;
    private String pickWard;
    private String pickAddress;
    private String pickTel;
    private String name;
    private String province;
    private String ward;
    private String address;
    private String tel;
    private String productName;
    private int productQuantity;
    private float productWeight;
    private String status;
    private String trackingId;

    public Shipment() {
    }

    public Shipment(int shipmentId, String thirdPartOrderId, int jobId, int senderId, String pickName,
                    String pickProvince, String pickWard, String pickAddress, String pickTel,
                    String name, String province, String ward, String address, String tel,
                    String productName, int productQuantity, float productWeight,
                    String status, String trackingId) {
        this.shipmentId = shipmentId;
        this.thirdPartOrderId = thirdPartOrderId;
        this.jobId = jobId;
        this.senderId = senderId;
        this.pickName = pickName;
        this.pickProvince = pickProvince;
        this.pickWard = pickWard;
        this.pickAddress = pickAddress;
        this.pickTel = pickTel;
        this.name = name;
        this.province = province;
        this.ward = ward;
        this.address = address;
        this.tel = tel;
        this.productName = productName;
        this.productQuantity = productQuantity;
        this.productWeight = productWeight;
        this.status = status;
        this.trackingId = trackingId;
    }

    // Getters and Setters

    public int getShipmentId() {
        return shipmentId;
    }

    public void setShipmentId(int shipmentId) {
        this.shipmentId = shipmentId;
    }

    public String getThirdPartOrderId() {
        return thirdPartOrderId;
    }

    public void setThirdPartOrderId(String thirdPartOrderId) {
        this.thirdPartOrderId = thirdPartOrderId;
    }

    public int getJobId() {
        return jobId;
    }

    public void setJobId(int jobId) {
        this.jobId = jobId;
    }

    public int getSenderId() {
        return senderId;
    }

    public void setSenderId(int senderId) {
        this.senderId = senderId;
    }

    public String getPickName() {
        return pickName;
    }

    public void setPickName(String pickName) {
        this.pickName = pickName;
    }

    public String getPickProvince() {
        return pickProvince;
    }

    public void setPickProvince(String pickProvince) {
        this.pickProvince = pickProvince;
    }

    public String getPickWard() {
        return pickWard;
    }

    public void setPickWard(String pickWard) {
        this.pickWard = pickWard;
    }

    public String getPickAddress() {
        return pickAddress;
    }

    public void setPickAddress(String pickAddress) {
        this.pickAddress = pickAddress;
    }

    public String getPickTel() {
        return pickTel;
    }

    public void setPickTel(String pickTel) {
        this.pickTel = pickTel;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getWard() {
        return ward;
    }

    public void setWard(String ward) {
        this.ward = ward;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public int getProductQuantity() {
        return productQuantity;
    }

    public void setProductQuantity(int productQuantity) {
        this.productQuantity = productQuantity;
    }

    public float getProductWeight() {
        return productWeight;
    }

    public void setProductWeight(float productWeight) {
        this.productWeight = productWeight;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getTrackingId() {
        return trackingId;
    }

    public void setTrackingId(String trackingId) {
        this.trackingId = trackingId;
    }
}
