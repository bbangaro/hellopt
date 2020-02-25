/* 모임 작성 버튼 */

(function () {
  var removeSuccess;

  removeSuccess = function () {
    return $('.button').removeClass('success');
  };

  $(document).ready(function () {
    return $('.button').click(function () {
 
//      $(this).addClass('success');
//      return setTimeout(removeSuccess, 3000);
    	location.href="/hellopt/meetingWrite";
      
    });
  });

}).call(this);

