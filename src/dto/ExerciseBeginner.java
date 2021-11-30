package dto;

import java.io.Serializable;

public class ExerciseBeginner implements Serializable {

    private String exercise_beg_id;
    private String exercise_beg_name;

    public ExerciseBeginner() {
    }

    public ExerciseBeginner(String exercise_beg_id, String exercise_beg_name) {
        this.exercise_beg_id = exercise_beg_id;
        this.exercise_beg_name = exercise_beg_name;
    }

    public String getExercise_beg_id() {
        return exercise_beg_id;
    }

    public void setExercise_beg_id(String exercise_beg_id) {
        this.exercise_beg_id = exercise_beg_id;
    }

    public String getExercise_beg_name() {
        return exercise_beg_name;
    }

    public void setExercise_beg_name(String exercise_beg_name) {
        this.exercise_beg_name = exercise_beg_name;
    }
}