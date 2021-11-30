function CheckAddDietFood() {

    var dietFoodId = document.getElementById("dietFoodId");
    var name = document.getElementById("dietFoodName");
    var description = document.getElementById("description");
    var calorie = document.getElementById("Calorie");

    // 음식 아이디 체크
    if (!check(/^D[0-9]{1,4}$/, dietFoodId, "[음식 코드]\nD와 숫자를 조합하여 2~3자까지 입력하세요\n첫 글자는 반드시 D로 시작하세요"))
        return false;

    // 음식 이름 체크
    if (name.value.length < 1 || name.value.length > 12) {
        alert("[음식명]\n최소 1자에서 최대 12자까지 입력하세요");
        name.select();
        name.focus();
        return false;
    }

    //상품 description 체크
    if (description.value.length < 1) {
        alert("[음식설명]\n최소 1자이상 입력하세요.");
        description.select();
        description.focus();
        return false;
    }

    if (calorie.value.length == isNaN(calorie.value)) {
        alert("[칼로리]\n숫자만 입력하세요");
        calorie.select();
        calorie.focus();
    }

    function check(regExp, e, msg) {
        if (regExp.test(e.value)) {
            return true;
        }
        alert(msg);
        e.select();
        e.focus();
        return false;
    }
}