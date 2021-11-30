package dao;

import dto.ExerciseBeginner;
import dto.ExerciseIntermediate;

import java.util.ArrayList;

public class ExerciseIntermediateRepository {
    private ArrayList<ExerciseIntermediate> listOfExercisesInt = new ArrayList<>();
    private static ExerciseIntermediateRepository instance = new ExerciseIntermediateRepository();

    public static ExerciseIntermediateRepository getInstance() {
        return instance;
    }

    public ExerciseIntermediateRepository() {
        ExerciseIntermediate int_exercise = new ExerciseIntermediate("I1", "스미스 머신 벤치프레스");
        ExerciseIntermediate int_exercise1 = new ExerciseIntermediate("I2", "스미스 머신 스쿼트");
        ExerciseIntermediate int_exercise2 = new ExerciseIntermediate("I3", "보조 턱걸이");

        listOfExercisesInt.add(int_exercise);
        listOfExercisesInt.add(int_exercise1);
        listOfExercisesInt.add(int_exercise2);
    }

    public ArrayList<ExerciseIntermediate> getAllExercise() {
        return listOfExercisesInt;
    }

    public ExerciseIntermediate getBookById(String exercise_id) {
        ExerciseIntermediate exerciseById = null;

        for (int i = 0; i < listOfExercisesInt.size(); i++) {
            ExerciseIntermediate exercise = listOfExercisesInt.get(i);
            if(exercise != null && exercise.getExercise_int_id() != null && exercise.getExercise_int_id().equals(exercise_id)){
                exerciseById = exercise;
                break;
            }
        }
        return exerciseById;
    }

    public void addExercise(ExerciseIntermediate exercise) {
        listOfExercisesInt.add(exercise);
    }
}
