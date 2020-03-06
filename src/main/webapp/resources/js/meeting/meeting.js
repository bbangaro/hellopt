/* 모임 작성 버튼 */
$('.send-btn').click(function () {
	location.href="/hellopt/meetingWrite";
});

  
/* 날짜 뽑기 
  window.onload = function(){
  var dt = new Date();
  var Year = dt.getFullYear();        
  var Month = "" + (dt.getMonth()+1);
  var Day = "" + dt.getDate();            
  
  if(Month.length < 2) Month = "0" + Month;
  if(Day.length < 2) Day = "0" + Day;
  
  var today = Year.toString() + Month + Day;
  
  var mday = document.getElementById("mday").value;
  console.log("미팅날짜"+mday);
  //슬러쉬뺴기
  var mday2 = mday.replace(/\//g, "");
  console.log("/빼기"+mday2);

  //document.getElementById("day").innerHTML = mday2 - today + " day";
  
  } 
  
$(".msub").mouseover(function () {
	
	  var date = new Date();
	  var Year = date.getFullYear();        
	  var Month = "" + (date.getMonth()+1);
	  var Day = "" + date.getDate();            
	  
	  if(Month.length < 2) Month = "0" + Month;
	  if(Day.length < 2) Day = "0" + Day;
	  
	  // 오늘날짜
	  var today = Year.toString() + Month + Day;
	  console.log("오늘날짜"+today);
	  //미팅알짜
	  var mday = document.getElementById("mday").value;
	  console.log("미팅날짜"+mday);
	  //슬러쉬뺴기
	  var mday2 = mday.replace(/\//g, "");
	  console.log("/빼기"+mday2);

	  document.getElementById("day").innerHTML = mday2 - today + " day";
	
});

 */