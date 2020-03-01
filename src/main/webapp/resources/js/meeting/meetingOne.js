 var swiper = new Swiper('.swiper-container', {
      zoom: true,
      pagination: {
        el: '.swiper-pagination',
      },
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },
    });



//이동 
 
(function () {
	  var removeSuccess;

	  $(document).ready(function () {
	    return $('.send-btn2').click(function () {
 
    	location.href="/hellopt/meeting";
      
    });
  });

}).call(this);

 
