/* 모임 작성 버튼 */

(function () {
  var removeSuccess;

//  removeSuccess = function () {
//    return $('.button').removeClass('success');
//  };

  $(document).ready(function () {
    return $('.send-btn').click(function () {
 
    	location.href="/hellopt/meetingWrite";
      
    });
  });

}).call(this);

