package ar.edu.itba.paw.webapp.forms;

public class ReviewForm {
    private String stars;
    private String description;
    private Integer apponintmentId;

    public String getStars() {
        return stars;
    }

    public void setStars(String stars) {
        this.stars = stars;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getApponintmentId() {
        return apponintmentId;
    }

    public void setApponintmentId(Integer apponintmentId) {
        this.apponintmentId = apponintmentId;
    }
}
