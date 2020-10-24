// require rails-ujs
// require gentelella


//= require jquery.min
//= require jquery_ujs
//= require bootstrap/dist/js/bootstrap.min
//= require fastclick/lib/fastclick
//= require nprogress/nprogress
//= require Chart.js/dist/Chart.min
//= require jquery-sparkline/dist/jquery.sparkline.min
//= require Flot/jquery.flot
//= require Flot/jquery.flot.pie
//= require Flot/jquery.flot.time
//= require Flot/jquery.flot.stack
//= require Flot/jquery.flot.resize
//= require flot.orderbars/js/jquery.flot.orderBars
//= require flot-spline/js/jquery.flot.spline.min
//= require flot.curvedlines/curvedLines
//= require DateJS/build/date
//= require moment/min/moment.min
//=  require bootstrap-daterangepicker/daterangepicker
//= require gentelella-custom

$(document).ready(function(){
	setTimeout(function(){
    	$('#notice_wrapper').slideUp('slow', function(){
        	$(this).remove();
          })
        }, 3000);
});

