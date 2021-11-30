package dao;

import dto.DietFood;

import java.util.ArrayList;

public class DietFoodRepository {
    private ArrayList<DietFood> listOfFoods = new ArrayList<DietFood>();
    private static DietFoodRepository instance = new DietFoodRepository();

    public static DietFoodRepository getInstance() {
        return instance;
    }

    public DietFoodRepository() {
        DietFood food = new DietFood();
        food.setFoodId("D1");
        food.setFoodName("샐러드");
        food.setDescription("간단한 채소 버무림 음식류, 칼로리가 매우적고 영양소가 풍부하여 다이어트에 매우 좋음");
        food.setFoodCalorie(30);
        food.setFilename("D1.png");

        DietFood food2 = new DietFood();
        food2.setFoodId("D2");
        food2.setFoodName("고구마");
        food2.setDescription("칼로리가 낮으면서 포만감을 주는 대표적인 다이어트 식품");
        food2.setFoodCalorie(130);
        food2.setFilename("D2.png");

        DietFood food3 = new DietFood();
        food3.setFoodId("D3");
        food3.setFoodName("현미밥");
        food3.setDescription("백미보다 탄수화물 함량/칼로리는 낮고 나머지 영양소가 풍부함");
        food3.setFoodCalorie(200);
        food3.setFilename("D3.png");

        DietFood food4 = new DietFood();
        food4.setFoodId("D4");
        food4.setFoodName("닭가슴살");
        food4.setDescription("단백질이 풍부하고 지방함유량이 적은데다가 칼로리도 낮아 다이어트에 매우 적합");
        food4.setFoodCalorie(130);
        food4.setFilename("D4.png");

        listOfFoods.add(food);
        listOfFoods.add(food2);
        listOfFoods.add(food3);
        listOfFoods.add(food4);
    }

    public ArrayList<DietFood> getAllFoods() {
        return listOfFoods;
    }

    public DietFood getFoodById(String bookId) {
        DietFood foodById = null;

        for (int i = 0; i < listOfFoods.size(); i++) {
            DietFood book = listOfFoods.get(i);
            if(book != null && book.getFoodId() != null && book.getFoodId().equals(bookId)){
                foodById = book;
                break;
            }
        }
        return foodById;
    }

    public void addFood(DietFood food) {
        listOfFoods.add(food);
    }
}
