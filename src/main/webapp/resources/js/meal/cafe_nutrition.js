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
        }
        
    });


});
