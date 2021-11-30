package dao;

import dto.BulkFood;
import dto.DietFood;

import java.util.ArrayList;

public class BulkFoodRepository {
    private ArrayList<BulkFood> listOfBFoods = new ArrayList<BulkFood>();
    private static BulkFoodRepository instance = new BulkFoodRepository();

    public static BulkFoodRepository getInstance() {
        return instance;
    }

    public BulkFoodRepository() {
        BulkFood food = new BulkFood();
        food.setFoodId("B1");
        food.setFoodName("구운연어");
        food.setDescription("지방과 단백질이 충분히 함량되어있어 마른 외배협 체형의 벌크업에 도움이 됨");
        food.setFoodCalorie(150);
        food.setFilename("B1.png");

        BulkFood food2 = new BulkFood();
        food2.setFoodId("B2");
        food2.setFoodName("닭고기, 콩과 치즈 들어간 부리토");
        food2.setDescription("높은 칼로리인 데다가 근육량 증가에 필수적인 탄수화물 단백질 지방 함량이 매우 높음");
        food2.setFoodCalorie(535);
        food2.setFilename("B2.png");

        BulkFood food3 = new BulkFood();
        food3.setFoodId("B3");
        food3.setFoodName("햄버거");
        food3.setDescription("높은 칼로리인 데다가 근육량 증가에 필수적인 탄수화물 단백질 지방 함량이 매우 높음");
        food3.setFoodCalorie(426);
        food3.setFilename("B3.png");

        BulkFood food4 = new BulkFood();
        food4.setFoodId("B4");
        food4.setFoodName("많은 양의 그래놀라 시리얼");
        food4.setDescription("시리얼을 많은양을 섭취해 줌으르써 많은 칼로리를 섭취하도록 함(기준100g)");
        food4.setFoodCalorie(360);
        food4.setFilename("B4.png");

        listOfBFoods.add(food);
        listOfBFoods.add(food2);
        listOfBFoods.add(food3);
        listOfBFoods.add(food4);
    }

    public ArrayList<BulkFood> getAllBFoods() {
        return listOfBFoods;
    }

    public BulkFood getFoodBById(String bookId) {
        BulkFood foodById = null;

        for (int i = 0; i < listOfBFoods.size(); i++) {
            BulkFood book = listOfBFoods.get(i);
            if(book != null && book.getFoodId() != null && book.getFoodId().equals(bookId)){
                foodById = book;
                break;
            }
        }
        return foodById;
    }

    public void addBFood(BulkFood food) {
        listOfBFoods.add(food);
    }
}
