package jobtrans.model;

import java.util.Date;

public class Api {
    private int Apiid;
    private int accountId;
    private String openRouterApiKey;
    private Date createdAt;

    public Api(int apiid, int accountId, String openRouterApiKey, Date createdAt) {
        Apiid = apiid;
        this.accountId = accountId;
        this.openRouterApiKey = openRouterApiKey;
        this.createdAt = createdAt;
    }

    public int getApiid() {
        return Apiid;
    }

    public void setApiid(int apiid) {
        Apiid = apiid;
    }

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public String getOpenRouterApiKey() {
        return openRouterApiKey;
    }

    public void setOpenRouterApiKey(String openRouterApiKey) {
        this.openRouterApiKey = openRouterApiKey;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }
}