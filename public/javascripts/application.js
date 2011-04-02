// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(document).ready(function(){
	
	function leftPad(num, toLength) {
		var numStr = "00"+num;
		numStr =  numStr.substring(numStr.length-toLength,numStr.length)
		return numStr;
	}

	function getTimeAsString() {
	    var currentDate = new Date();
		var year = currentDate.getFullYear();
		var month = leftPad(currentDate.getMonth()+1,2);
		var day = leftPad(currentDate.getDate(),2);
		var dateStr = year+'-'+month+'-'+day;
	    var ms = leftPad(currentDate.getUTCMilliseconds(),3);
	    return dateStr+' '+currentDate.toTimeString().substring(0, 8)+"."+ms;
	}
	
	$('.setTimeButton').click(function() {
		var currentTime = getTimeAsString();
		$timeInput = $(this).parents('li').find('.timeInput');
		var bibNum = $(this).parents('li').find('.bibInput').val();
		var override = true;
		if ($timeInput.val()) {
			override = confirm('Reset time to '+currentTime+' for bib '+bibNum+'?');
		}
		if (override) {
			$timeInput.val(currentTime);
		}
	});
	
	function getTimeAsString2() {
	    var currentDate = new Date();
		var year = currentDate.getFullYear();
		var month = leftPad(currentDate.getMonth()+1,2);
		var day = leftPad(currentDate.getDate(),2);
		var dateStr = year+'-'+month+'-'+day;
	    return dateStr+' '+currentDate.toTimeString().substring(0, 8)+".000";
	}

	$('.setTimeButton2').click(function() {
		var currentTime = getTimeAsString();
		$timeInput = $('.timeInput');
		$timeInput.val(currentTime);
	});

});