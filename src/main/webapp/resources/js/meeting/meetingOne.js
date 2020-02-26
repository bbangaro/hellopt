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

	  removeSuccess = function () {
	    return $('.button').removeClass('success');
  };

  $(document).ready(function () {
    return $('.button').click(function () {
 
    	location.href="/hellopt/meeting";
      
    });
  });

}).call(this);
