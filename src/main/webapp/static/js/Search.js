/*$(document).ready(function() {
	$.ajax({
		url : "searchAutoComplete",
		success : function(result) {
			localStorage.setItem('autoSearch', result);
		}
	});

});*/
$(".doctorSearch").autocomplete({
	source : function(request, response) {

		$.ajax({
			dataType : "json",
			url : "doctorAutoComplete?keyword=" + $(".doctorSearch").val(),
			success : function(result) {
				response(result);
			}

		});
	},
	select : function(e, ui) {
		var category = $.trim(ui.item.value.split("in")[1]);
	},
	minLength : 2,
	autoFocus : true
});
$(".hospitalSearch").autocomplete({
	source : function(request, response) {

		$.ajax({
			dataType : "json",
			url : "hospitalAutoComplete?keyword=" + $(".hospitalSearch").val(),
			success : function(result) {
				response(result);
			}
		});
	},
	minLength : 2
});
$(".searchArticle").autocomplete({
	source : function(request, response) {

		$.ajax({
			dataType : "json",
			url : "blogAutoComplete?keyword=" + $(".searchArticle").val(),
			success : function(result) {
				response(result);
			}
		});
	},
	minLength : 2
});

$(".citySearch").autocomplete({
	source : function(request, response) {

		$.ajax({
			dataType : "json",
			url : "cityAutoComplete?keyword=" + $(".citySearch").val(),
			success : function(result) {
				response($.map(result, function(item) {
					return {
						label : item.city,
						value : item.city
					}
				}));
			}
		});
	},
	focus : function(event, ui) {
		$(".citySearch").val(ui.item.city);
		// $("#hospitalId").val(ui.item.id);
	},
	select : function(event, ui) {
		$(".citySearch").val(ui.item.city);
		// $("#hospitalId").val(ui.item.key);

	},
	minLength : 2
});
