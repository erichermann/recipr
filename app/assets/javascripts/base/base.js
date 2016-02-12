$(function() {
  $('.datepicker').datepicker();
});

function remove_fields(link, divToRemove) {
  if(confirm('Are you sure?')) {
    $(link).prev("input[type=hidden]").val('1');
    $(link).hide();
    $('#'+divToRemove).hide();
  }
}

function add_fields(link, association, content) { 
  var new_id = new Date().getTime(); 
  var regexp = new RegExp("new_" + association, "g"); 
  $(link).parent().before(content.replace(regexp, new_id)); 
}

$(document).ready(function() {
  $('#form_submit_button').on('click', function() {
    $('.loading-left').show();

		$.get($('#search_form').attr('action'), 
    $('#search_form').serialize(),
    function() {
			$('.loading-left').hide();
		}, 'script');

	  return false;			
	});
});

$(function () {
	jQuery.fn.submitWithAjax = function(update) {
    this.submit(function()  {
	    $(this).find(':input').removeAttr('disabled');
	    $.post($(this).attr('action'), $(this).serialize(), update, "script");
	    return false;
	  });
	};
});