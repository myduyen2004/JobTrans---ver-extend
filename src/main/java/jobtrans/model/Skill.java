package jobtrans.model;

public class Skill {
    private int cvId;
    private int skillId;
    private int mainSkillId;
    private String mainSkillName;
    private String skillName;
    private String skillCustom;
    private int levelSkill;

    public Skill(int mainSkillId, String mainSkillName) {
        this.mainSkillId = mainSkillId;
        this.mainSkillName = mainSkillName;
    }

    public Skill(int skillId, int mainSkillId, String skillName) {
        this.skillId = skillId;
        this.mainSkillId = mainSkillId;
        this.skillName = skillName;
    }

    public Skill() {
    }
    public Skill(int cvId, int skillId, int mainSkillId, String mainSkillName, String skillName, String skillCustom, int levelSkill) {
        this.cvId = cvId;
        this.skillId = skillId;
        this.mainSkillId = mainSkillId;
        this.mainSkillName = mainSkillName;
        this.skillName = skillName;
        this.skillCustom = skillCustom;
        this.levelSkill = levelSkill;
    }
    // Getters and Setters

    public int getCvId() {
        return cvId;
    }

    public void setCvId(int cvId) {
        this.cvId = cvId;
    }

    public int getSkillId() {
        return skillId;
    }

    public void setSkillId(int skillId) {
        this.skillId = skillId;
    }

    public int getMainSkillId() {
        return mainSkillId;
    }

    public void setMainSkillId(int mainSkillId) {
        this.mainSkillId = mainSkillId;
    }

    public String getMainSkillName() {
        return mainSkillName;
    }

    public void setMainSkillName(String mainSkillName) {
        this.mainSkillName = mainSkillName;
    }

    public String getSkillName() {
        return skillName;
    }

    public void setSkillName(String skillName) {
        this.skillName = skillName;
    }

    public String getSkillCustom() {
        return skillCustom;
    }

    public void setSkillCustom(String skillCustom) {
        this.skillCustom = skillCustom;
    }

    public int getLevelSkill() {
        return levelSkill;
    }

    public void setLevelSkill(int levelSkill) {
        this.levelSkill = levelSkill;
    }

    @Override
    public String toString() {
        return "Skill{" +
                "cvId=" + cvId +
                ", skillId=" + skillId +
                ", mainSkillId=" + mainSkillId +
                ", mainSkillName='" + mainSkillName + '\'' +
                ", skillName='" + skillName + '\'' +
                ", skillCustom='" + skillCustom + '\'' +
                ", levelSkill=" + levelSkill +
                '}';
    }
}
