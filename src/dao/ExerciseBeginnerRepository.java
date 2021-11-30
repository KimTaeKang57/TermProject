package dao;

import dto.ExerciseBeginner;

import java.util.ArrayList;

public class ExerciseBeginnerRepository {
    private ArrayList<ExerciseBeginner> listOfExercisesBeg = new ArrayList<>();
    private static ExerciseBeginnerRepository instance = new ExerciseBeginnerRepository();

    public static ExerciseBeginnerRepository getInstance() {
        return instance;
    }

    public ExerciseBeginnerRepository() {
        ExerciseBeginner big_exercise = new ExerciseBeginner("B1", "팔굽혀펴기");
        ExerciseBeginner big_exercise1 = new ExerciseBeginner("B2", "턱걸이");
        ExerciseBeginner big_exercise2 = new ExerciseBeginner("B3", "윗몸일으키기");

        listOfExercisesBeg.add(big_exercise);
        listOfExercisesBeg.add(big_exercise1);
        listOfExercisesBeg.add(big_exercise2);
    }

    public ArrayList<ExerciseBeginner> getAllExercise() {
        return listOfExercisesBeg;
    }

    public ExerciseBeginner getBookById(String exercise_id) {
        ExerciseBeginner exerciseById = null;

        for (int i = 0; i < listOfExercisesBeg.size(); i++) {
            ExerciseBeginner exercise = listOfExercisesBeg.get(i);
            if(exercise != null && exercise.getExercise_beg_id() != null && exercise.getExercise_beg_id().equals(exercise_id)){
                exerciseById = exercise;
                break;
            }
        }
        return exerciseById;
    }

    public void addExercise(ExerciseBeginner exercise) {
        listOfExercisesBeg.add(exercise);
    }
}
