package dto;

import java.io.Serializable;

public class BulkFood implements Serializable {
    private String foodId;
    private String foodName;
    private String description;
    private float foodCalorie;
    private String filename;

    public BulkFood() {
    }

    public String getFoodId() {
        return foodId;
    }

    public void setFoodId(String foodId) {
        this.foodId = foodId;
    }

    public String getFoodName() {
        return foodName;
    }

    public void setFoodName(String foodName) {
        this.foodName = foodName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public float getFoodCalorie() {
        return foodCalorie;
    }

    public void setFoodCalorie(float foodCalorie) {
        this.foodCalorie = foodCalorie;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }
}
