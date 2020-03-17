<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>칼로리총량</title>
<script src="${pageContext.request.contextPath}/resources/js/meal/cafe_nutrition.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/meal/meal.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
    <div class="meal_contents">
                    <div class="cafe_category" id="myInfo">
                <h3 class="nutrtion_subtitle">나의 정보</h3>
                <p class="info_p">BMI 수치를 계산하기 위한 정보입니다. 입력되는 개인정보는 저장되지 않습니다.</p>
                <form action="nutrtion" method="post" class="info_form">
                    <div>
                        <ul>
                            <li class="info_lileft">
                                <label for="age" class="info_label">나이</label>
                                <input type="text" id="age" class="nutrition_inputS" placeholder="ex) 20" required>
                            </li>
                            <li class="info_lileft">
                                <label for="gender" class="info_label">성별</label>
                                <!--<label for="male">남성</label>
                                <input type="radio" id="male" name="gender" value="male">
                                <label for="female">여성</label>
                                <input type="radio" id="female" name="gender" value="female">-->
                                <label class="box-radio-input"><input type="radio" nid="male" name="gender" value="male" checked="checked"><span>남성</span></label>
                                <label class="box-radio-input"><input type="radio" id="female" name="gender" value="female"><span>여성</span></label>
                            </li>
                            <li class="info_lileft infor_clear">
                                <label for="cm" class="info_label">키</label>
                                <input type="text" id="cm" class="nutrition_inputS" placeholder="cm" required>
                            </li>
                            <li class="info_lileft">
                                <label for="kg" class="info_label">몸무게</label>
                                <input type="text" id="kg" class="nutrition_inputS" placeholder="kg" required>
                            </li>
                        </ul>
                    </div>
                    <div class="active_box">
                        <p class="active_p">신체활동 수준설정</p>
                        <ul>
                            <li class="active_li">
                               <input type="radio" id="inactive" name="activity" value="inactive" checked="checked">
                                <label for="inactive" class="inactive1">비 활동적 <span class="active_span">(입원환자등 활동이 제한된 사람들의 활동 수준)</span>
                                </label>
                            </li>
                            <li class="active_li">
                               <input type="radio" id="rowactive" name="activity" value="inactive">
                                <label for="rowactive" class="inactive1">저 활동적 <span class="active_span">(대부분의 시간을 앉아서 하는 정적 활동 수준)</span>
                                </label>
                            </li>
                            <li class="active_li">
                                <input type="radio" id="activity" name="activity" value="activity">
                                <label for="activity" class="inactive1">활동적<span class="active_span">(주로 앉아서 보내지만 서서 하는 직업,통근, 물건구입, 가사, 가벼운 운동 등 포함)</span>
                                </label>
                            </li>
                            <li class="active_li">
                                <input type="radio" id="veryactivity" name="activity" value="veryactivity">
                                <label for="veryactivity" class="inactive1">매우 활동적<span class="active_span">(주로 서서 하는 작업 종사 또는 운동 등의 활발한 여가 활동 수준)</span>
                                </label>
                                
                            </li>
                        </ul>
                    </div>
                    <div class="active_btn_box">
                        <input type="button" value="저장" class="admin_btn subminbtn" id="personinfoBtn">
                        <input type="reset" value="리셋" class="admin_btn">
                    </div>
                </form>
            </div>
            <div class="cafe_category" id="infoAndMenu">
                <div>
                   <div class="kacl_box">
                    <p class="goal_kacl">목표 섭취 열량(kacl)</p>
                    <p class="goal_kacl_num">1751.0</p>
                </div>
                <div class="kacl_box">
                    <p class="goal_kacl">총 섭취 열량(kacl)</p>
                    <p class="goal_kacl_num">1751.0</p>
                </div>
                <div class="nutrtion_box">
                    <p class="nutrtion_info">탄수화물(g)</p>
                    <p class="nutrtion_info">1751.0</p>
                    <p class="nutrtion_info">단백질(g)</p>
                    <p class="nutrtion_info">1751.0</p>
                    <p class="nutrtion_info">지방(g)</p>
                    <p class="nutrtion_info">1751.0</p>
                    <p class="nutrtion_info">나트륨(g)</p>
                    <p class="nutrtion_info">1751.0</p>
                </div>
                    <h3 class="nutrtion_subtitle">메뉴 검색</h3>
                    <div class="menu_search_box">
                        <form action="" method="post">
                            <input type="text" id="menusearchtxt"name="menusearchtxt" class="nutrition_inputL" placeholder="메뉴 명을 작성하세요">
		                    <input type="submit" value="검색" class="admin_btnS subminbtn inputright">
                        </form>
                    </div>
                  <div class="menu_title">
                      <p class="menu_title_p menu_title_pbig">메뉴</p>
                        <p class="menu_title_p">기준중량(g)</p>
                        <p class="menu_title_p">열량(kal)</p>
                        <p class="menu_title_p">선택</p>
                  </div>
                    <div class="menu_list_box">
                        <ul>
                            <li class="menu_list_li">
                               <p class="menu_list_lip menu_list_lipbig">아메리카노</p>
                                <p class="menu_list_lip">150</p>
                                <p class="menu_list_lip">100</p>
                                <p class="menu_list_lip"><a href="#"alt="선택">+</a></p> 
                            </li>
                        </ul>
                    </div>
                </div>
                <h3 class="nutrtion_subtitle">메뉴 정보</h3>
                <div class="menu_title">
                      <p class="menu_title_pd menu_title_pdsmall">번호</p>
                        <p class="menu_title_pd menu_title_pdbig">메뉴</p>
                        <p class="menu_title_pd">섭취량(g)</p>
                        <p class="menu_title_pd">열량(kacl)</p>
                        <p class="menu_title_pd">탄수화물(g)</p>
                        <p class="menu_title_pd">단백질(g)</p>
                        <p class="menu_title_pd">지방(g)</p>
                        <p class="menu_title_pd">나트륨(g)</p>
                </div>
                <form action="" method="post">
                   <div class="menu_list_box">
                        <ul>
                            <li class="menu_list_li">
                              <p class="menu_list_lipd menu_list_lipdsmall">1</p>
                               <p class="menu_list_lipd menu_list_lipdbig">아메리카노</p>
                                <p class="menu_list_lipd">100</p>
                                <p class="menu_list_lipd">100</p>
                                <p class="menu_list_lipd">100</p>
                                <p class="menu_list_lipd">100</p>
                                <p class="menu_list_lipd">100</p>
                                <p class="menu_list_lipd">100</p>
                            </li>
                        </ul>
                    </div>
                    <div class="active_btn_box">
                       <input type="submit" value="평가" class="admin_btn subminbtn">
                    </div>
                </form>
            </div>
    </div>

</body>
</html>