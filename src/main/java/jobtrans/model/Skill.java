package jobtrans.model;

public class Skill {
    private int skillId;
    private String skillName;
    private String levelSkill;
    private String customSkill;

    // Constructor
    public Skill(int skillId, String skillName, String levelSkill, String customSkill) {
        this.skillId = skillId;
        this.skillName = skillName;
        this.levelSkill = levelSkill;
        this.customSkill = customSkill;
    }

    // Getter và Setter
    public int getSkillId() {
        return skillId;
    }

    public void setSkillId(int skillId) {
        this.skillId = skillId;
    }

    public String getSkillName() {
        return skillName;
    }

    public void setSkillName(String skillName) {
        this.skillName = skillName;
    }

    public String getLevelSkill() {
        return levelSkill;
    }

    public void setLevelSkill(String levelSkill) {
        this.levelSkill = levelSkill;
    }

    public String getCustomSkill() {
        return customSkill;
    }

    public void setCustomSkill(String customSkill) {
        this.customSkill = customSkill;
    }

    @Override
    public String toString() {
        return "Skill{" +
                "skillId=" + skillId +
                ", skillName='" + skillName + '\'' +
                ", levelSkill='" + levelSkill + '\'' +
                ", customSkill='" + customSkill + '\'' +
                '}';
    }
}
