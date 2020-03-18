$(document).ready(function () {
    /* 저장버튼 클릭시 */
    $('#infoAndMenu').css('display', 'none');
    
    $(document).on('click', '#personinfoBtn', function () {
        console.log("저장 버튼클릭");
        let age = $(this).parent().siblings().eq(0).children().children().eq(0).children('#age').val();
        console.log("age: ", age);
        let gender = $('input:radio[name="gender"]:checked').val();
        console.log("gender", gender);
        let cm = $(this).parent().siblings().eq(0).children().children().eq(2).children('#cm').val();
        console.log("cm: ", cm);
        let kg = $(this).parent().siblings().eq(0).children().children().eq(3).children('#kg').val();
        console.log("kg: ", kg);
        let activity = $('input:radio[name="activity"]:checked').val();
        console.log("activity", activity);
        
        /*예외처리*/
        if( age == ""){ 
            alert("나이를 입력해주세요");
            return;
        }else if(gender == ""){
            alert("성별을 선택해주세요");
            return;
        }else if(cm == ""){
            alert("키를 입력해주세요");
            return;
        }else if(kg == ""){
            alert("몸무게를 입력해주세요");
            return;
        }else if(activity == ""){
            alert("신체활동 수준설정을 선택해주세요");
            return;
        }else{
            $('#myInfo').css('display', 'none');
            $('#infoAndMenu').css('display', 'block');
            
            /*필요한 칼로리 총량 계산식*/
            if (gender == "male") {
            	var mval1 = 13.75 * kg;
            	var mval2 = 5.0 * cm;
            	var mval3 = 6.8 * age;
            	var mresult = 66.5 + mval1 + mval2 - mval3;
            	var mval4 = activity;
            } else if (gender == "female") {
            	var mval1 = 9.6 * kg;
                var mval2 = 1.85 * cm;
                var mval3 = 4.7 * age;
                var mresult = 655.1 + mval1 + mval2 - mval3;
                var mval4 = activity;
            }
            
            switch (mval4) {
            case "inactive":
            	MyCalorie = mresult * 1.3;
            	break;
            case "rowactive":
            	MyCalorie = mresult * 1.5;
            	break;
            case "activity":
            	MyCalorie = mresult * 1.7;
            	break;
            case "veryactivity":
            	MyCalorie = mresult * 1.9;
            	break;
            }
            
            document.getElementById("calories").innerHTML = MyCalorie.toFixed(2);
            
        }
        
    });

});
