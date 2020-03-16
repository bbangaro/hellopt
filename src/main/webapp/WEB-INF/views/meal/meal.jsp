<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>칼로리총량</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/meal/meal.css">
</head>
<body>
    <div class="meal_contents">
        <div class="cafe_category">
            <h3 class="nutrtion_subtitle">나의 정보</h3>
            <p class="info_p">BMI 수치를 계산하기 위한 정보입니다. 입력되는 개인정보는 저장되지 않습니다.</p>
            <form action="" method="post" class="info_form">
                <div>
                    <ul>
                        <li class="info_lileft">
                            <label for="year" class="info_label">출생년도</label>
                            <input type="text" id="year" class="nutrition_inputS" placeholder="ex)2000" required>
                        </li>
                        <li class="info_lileft">
                            <label for="gender" class="info_label">성별</label>
                            <label for="male">남성</label>
                            <input type="radio" id="male" name="gender" value="male">
                            <label for="female">여성</label>
                            <input type="radio" id="female" name="gender" value="female">
                        </li>
                        <li class="info_lileft infor_clear">
                            <label for="year" class="info_label">키</label>
                            <input type="text" id="year" class="nutrition_inputS" placeholder="cm" required>
                        </li>
                        <li class="info_lileft">
                            <label for="year" class="info_label">몸무게</label>
                            <input type="text" id="year" class="nutrition_inputS" placeholder="kg" required>
                        </li>
                    </ul>
                </div>
                <div class="active_box">
                    <p class="active_p">신체활동 수준설정</p>
                    <ul>
                        <li class="active_li">
                            <input type="radio" id="inactive" name="activity" value="inactive">
                            <label for="inactive">비 활동 <span class="active_span">(거의 책상에 앉아서 하는 일을 하는 등, 몸을 사용할 일이 별로 없는 사람. 이런 사람은 규칙적인 운동을 하지 않고, 운동을 해도 강도가 낮은 운동만 한다.)</span>
                            </label>
                        </li>
                        <li class="active_li">
                            <input type="radio" id="activity" name="activity" value="activity">
                            <label for="activity">활동 <span class="active_span">(육체를 조금 더 사용해야 하는 직업을 가졌거나, 걸을 일이 많은 사람. 또한 일주일에 3번 정도씩은 규칙적인 운동과 중간 강도 정도의 운동을 한다.)</span>
                            </label>
                        </li>
                        <li class="active_li">
                            <input type="radio" id="veryactivity" name="activity" value="veryactivity">
                            <label for="veryactivity">매우 활동 <span class="active_span">(하루에 한 시간 정도 강도 높은 운동을 하거나 육체를 많이 사용하는 직업을 가진 사람. 더불어 규칙적이고 체계적인 운동도 한다. )</span>
                            </label>

                        </li>
                    </ul>
                </div>
                <div class="active_btn_box">
                    <input type="submit" value="저장" class="admin_btn subminbtn">
                    <input type="reset" value="리셋" class="admin_btn">
                </div>
            </form>
        </div>
        <div class="cafe_category">
            <div>
                <h3 class="nutrtion_subtitle">메뉴 검색</h3>
                <div class="menu_search_box">
                    <form action="" method="post">
                        <label for="menusearchtxt" class="info_label">메뉴 명</label>
                        <input type="text" id="menusearchtxt" name="menusearchtxt" class="nutrition_inputL">
                        <input type="submit" value="검색" class="admin_btnS subminbtn">
                    </form>
                </div>
                <div class="menu_title">
                    <p class="menu_title_p">식사</p>
                    <p class="menu_title_p">기준중량(g)</p>
                    <p class="menu_title_p">열량(kal)</p>
                    <p class="menu_title_p">선택</p>
                </div>
                <div class="menu_list_box">
                    <ul>
                        <li class="menu_list_li">
                            <p class="menu_list_lip">피자</p>
                            <p class="menu_list_lip">150</p>
                            <p class="menu_list_lip">100</p>
                            <p class="menu_list_lip"><a href="#" alt="선택">+</a></p>
                        </li>
                    </ul>
                </div>
            </div>

        </div>
        <div class="cafe_category">
            <h3 class="nutrtion_subtitle">식사 정보</h3>
            <div class="kacl_box">
                <p class="goal_kacl">목표섭취열량(kacl)</p>
                <p class="goal_kacl_num">1751.0</p>
                <p class="goal_kacl">목표섭취열량(kacl)</p>
                <p class="goal_kacl_num">1751.0</p>
            </div>
            <div class="menu_title">
                <p class="menu_title_pd">번호</p>
                <p class="menu_title_pd">메뉴</p>
                <p class="menu_title_pd">섭취량</p>
                <p class="menu_title_pd">열량</p>
                <p class="menu_title_pd">탄수화물</p>
                <p class="menu_title_pd">단백질</p>
                <p class="menu_title_pd">지방</p>
                <p class="menu_title_pd">나트륨</p>
            </div>
            <form action="" method="post">
                <ul>
                    <li>

                    </li>
                    <li>
                        <input type="submit" value="평가" class="admin_btn subminbtn">
                    </li>
                </ul>

            </form>

        </div>
    </div>

</body>
</html>