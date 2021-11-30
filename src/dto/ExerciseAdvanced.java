package dto;

import java.io.Serializable;

public class ExerciseAdvanced implements Serializable {

    private String exercise_adv_id;
    private String exercise_adv_name;

    public ExerciseAdvanced() {
    }

    public ExerciseAdvanced(String exercise_adv_id, String exercise_adv_name) {
        this.exercise_adv_id = exercise_adv_id;
        this.exercise_adv_name = exercise_adv_name;
    }

    public String getExercise_adv_id() {
        return exercise_adv_id;
    }

    public void setExercise_adv_id(String exercise_adv_id) {
        this.exercise_adv_id = exercise_adv_id;
    }

    public String getExercise_adv_name() {
        return exercise_adv_name;
    }

    public void setExercise_adv_name(String exercise_adv_name) {
        this.exercise_adv_name = exercise_adv_name;
    }
}