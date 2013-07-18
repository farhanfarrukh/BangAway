var serviceURL = "http://www.paighaam.com/service/";

var user;

$('#Users').bind('pageinit', function(event) {
	getUser();
});

function getUser() {
	$.getJSON(serviceURL + 'login.php?name=farhanfarrukh$hash=123456', function(data) {
		//$('#employeeList li').remove();
		user = data.items;
		alert(user);
		/* $.each(employees, function(index, employee) {
			$('#employeeList').append('<li><a href="employeedetails.html?id=' + employee.id + '">' +
					'<img src="pics/' + employee.picture + '"/>' +
					'<h4>' + employee.firstName + ' ' + employee.lastName + '</h4>' +
					'<p>' + employee.title + '</p>' +
					'<span class="ui-li-count">' + employee.reportCount + '</span></a></li>');
		});*/
		//$('#employeeList').listview('refresh');
	});
}