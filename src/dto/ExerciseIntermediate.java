package dto;

import javax.annotation.processing.Generated;
import java.io.Serializable;

public class ExerciseIntermediate implements Serializable {

    private String exercise_int_id;
    private String exercise_int_name;

    public ExerciseIntermediate() {
    }

    public ExerciseIntermediate(String exercise_int_id, String exercise_int_name) {
        this.exercise_int_id = exercise_int_id;
        this.exercise_int_name = exercise_int_name;
    }

    public String getExercise_int_id() {
        return exercise_int_id;
    }

    public void setExercise_int_id(String exercise_int_id) {
        this.exercise_int_id = exercise_int_id;
    }

    public String getExercise_int_name() {
        return exercise_int_name;
    }

    public void setExercise_int_name(String exercise_int_name) {
        this.exercise_int_name = exercise_int_name;
    }
}