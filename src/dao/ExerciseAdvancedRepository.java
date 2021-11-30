package dao;

import dto.ExerciseAdvanced;

import java.util.ArrayList;

public class ExerciseAdvancedRepository {
    private ArrayList<ExerciseAdvanced> listOfExercisesAdv = new ArrayList<>();
    private static ExerciseAdvancedRepository instance = new ExerciseAdvancedRepository();

    public static ExerciseAdvancedRepository getInstance() {
        return instance;
    }

    public ExerciseAdvancedRepository() {
        ExerciseAdvanced adv_exercise = new ExerciseAdvanced("A1", "플랫 벤치프레스");
        ExerciseAdvanced adv_exercise1 = new ExerciseAdvanced("A2", "프리 스쿼트");
        ExerciseAdvanced adv_exercise2 = new ExerciseAdvanced("A3", "데드 리프트");

        listOfExercisesAdv.add(adv_exercise);
        listOfExercisesAdv.add(adv_exercise1);
        listOfExercisesAdv.add(adv_exercise2);
    }

    public ArrayList<ExerciseAdvanced> getAllExercise() {
        return listOfExercisesAdv;
    }

    public ExerciseAdvanced getBookById(String exercise_id) {
        ExerciseAdvanced exerciseById = null;

        for (int i = 0; i < listOfExercisesAdv.size(); i++) {
            ExerciseAdvanced exercise = listOfExercisesAdv.get(i);
            if(exercise != null && exercise.getExercise_adv_id() != null && exercise.getExercise_adv_id().equals(exercise_id)){
                exerciseById = exercise;
                break;
            }
        }
        return exerciseById;
    }

    public void addExercise(ExerciseAdvanced exercise) {
        listOfExercisesAdv.add(exercise);
    }
}
