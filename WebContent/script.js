/**
 * 
 * 
 */
function searchType() {
	document.getElementById('employeeForm').action = document
			.getElementById("type").value;
}

function address(f) {
	if (f.check.checked == true) {
		f.current.value = f.permanent.value;
	}
}

function sortTable(n) {
	var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
	table = document.getElementById("myTable2");
	switching = true;
	// Set the sorting direction to ascending:
	dir = "asc";
	/*
	 * Make a loop that will continue until no switching has been done:
	 */
	while (switching) {
		// Start by saying: no switching is done:
		switching = false;
		rows = table.getElementsByTagName("TR");
		/*
		 * Loop through all table rows (except the first, which contains table
		 * headers):
		 */
		for (i = 2; i < (rows.length - 1); i++) {
			// Start by saying there should be no switching:
			shouldSwitch = false;
			/*
			 * Get the two elements you want to compare, one from current row
			 * and one from the next:
			 */
			x = rows[i].getElementsByTagName("TD")[n];
			y = rows[i + 1].getElementsByTagName("TD")[n];
			/*
			 * Check if the two rows should switch place, based on the
			 * direction, asc or desc:
			 */
			if (dir == "asc") {
				if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
					// If so, mark as a switch and break the loop:
					shouldSwitch = true;
					break;
				}
			} else if (dir == "desc") {
				if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
					// If so, mark as a switch and break the loop:
					shouldSwitch = true;
					break;
				}
			}
		}
		if (shouldSwitch) {
			/*
			 * If a switch has been marked, make the switch and mark that a
			 * switch has been done:
			 */
			rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
			switching = true;
			// Each time a switch is done, increase this count by 1:
			switchcount++;
		} else {
			/*
			 * If no switching has been done AND the direction is "asc", set the
			 * direction to "desc" and run the while loop again.
			 */
			if (switchcount == 0 && dir == "asc") {
				dir = "desc";
				switching = true;
			}
		}
	}
}

function myFunction() {
	var input, filter, table, tr, td, i;
	input = document.getElementById("myInput");
	filter = input.value.toUpperCase();
	table = document.getElementById("myTable2");
	tr = table.getElementsByTagName("tr");
	for (i = 1; i < tr.length; i++) {
		td = tr[i].getElementsByTagName("td")[0];
		if (td) {
			if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
				tr[i].style.display = "";
			} else {
				tr[i].style.display = "none";
			}
		}
	}
}

function myFunction1() {
	var input, filter, table, tr, td, i;
	input = document.getElementById("myInput1");
	filter = input.value.toUpperCase();
	table = document.getElementById("myTable2");
	tr = table.getElementsByTagName("tr");
	for (i = 1; i < tr.length; i++) {
		td = tr[i].getElementsByTagName("td")[1];
		if (td) {
			if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
				tr[i].style.display = "";
			} else {
				tr[i].style.display = "none";
			}
		}
	}
}

function myFunction2() {
	var input, filter, table, tr, td, i;
	input = document.getElementById("myInput2");
	filter = input.value.toUpperCase();
	table = document.getElementById("myTable2");
	tr = table.getElementsByTagName("tr");
	for (i = 1; i < tr.length; i++) {
		td = tr[i].getElementsByTagName("td")[2];
		if (td) {
			if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
				tr[i].style.display = "";
			} else {
				tr[i].style.display = "none";
			}
		}
	}
}

function myFunction3() {
	var input, filter, table, tr, td, i;
	input = document.getElementById("myInput3");
	filter = input.value.toUpperCase();
	table = document.getElementById("myTable2");
	tr = table.getElementsByTagName("tr");
	for (i = 1; i < tr.length; i++) {
		td = tr[i].getElementsByTagName("td")[3];
		if (td) {
			if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
				tr[i].style.display = "";
			} else {
				tr[i].style.display = "none";
			}
		}
	}
}

function myFunction4() {
	var input, filter, table, tr, td, i;
	input = document.getElementById("myInput4");
	filter = input.value.toUpperCase();
	table = document.getElementById("myTable2");
	tr = table.getElementsByTagName("tr");
	for (i = 1; i < tr.length; i++) {
		td = tr[i].getElementsByTagName("td")[4];
		if (td) {
			if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
				tr[i].style.display = "";
			} else {
				tr[i].style.display = "none";
			}
		}
	}
}

function myFunction5() {
	var input, filter, table, tr, td, i;
	input = document.getElementById("myInput5");
	filter = input.value.toUpperCase();
	table = document.getElementById("myTable2");
	tr = table.getElementsByTagName("tr");
	for (i = 1; i < tr.length; i++) {
		td = tr[i].getElementsByTagName("td")[5];
		if (td) {
			if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
				tr[i].style.display = "";
			} else {
				tr[i].style.display = "none";
			}
		}
	}
}

function myFunction6() {
	var input, filter, table, tr, td, i;
	input = document.getElementById("myInput6");
	filter = input.value.toUpperCase();
	table = document.getElementById("myTable2");
	tr = table.getElementsByTagName("tr");
	for (i = 1; i < tr.length; i++) {
		td = tr[i].getElementsByTagName("td")[6];
		if (td) {
			if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
				tr[i].style.display = "";
			} else {
				tr[i].style.display = "none";
			}
		}
	}
}

function myFunction7() {
	var input, filter, table, tr, td, i;
	input = document.getElementById("myInput7");
	filter = input.value.toUpperCase();
	table = document.getElementById("myTable2");
	tr = table.getElementsByTagName("tr");
	for (i = 1; i < tr.length; i++) {
		td = tr[i].getElementsByTagName("td")[7];
		if (td) {
			if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
				tr[i].style.display = "";
			} else {
				tr[i].style.display = "none";
			}
		}
	}
}

function validateId(id) {
	if (id.value != null) {
		if (!/^[0-9]+$/.test(id.value)) {
			alert("Please enter only numeric values");
		}
	} else {
		alert("Field can not be empty");
	}
}

function validateForm() {
	var name = document.getElementById("firstName").value;
	var dob = document.getElementById("dob").value;
	var current = document.getElementById("current").value;
	var permanent = document.getElementById("permanent").value;
	var phn = document.getElementById("phn").value;
	var aphn = document.getElementById("aphn").value;
	var email = document.getElementById("email").value;
	
	var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	
	if (name == "" || dob == "" || current == "" || permanent == ""
			|| phn == "" || email == "") {
		alert("fields shouldn't be Empty");
		return false;
	}
	else{
	if(!/^[A-Za-z]+$/.test(name)){
		alert("Enter valid name");
		return false;
	}
	else if(!(phn.match(/^(\+\d{1,3}[- ]?)?\d{10}$/) && ! (phn.match(/0{5,}/)))){
		alert("Enter valid mobile number");
		return false;
	}
	else if(aphn!=""){
		if(!(aphn.match(/^(\+\d{1,3}[- ]?)?\d{10}$/) && !(aphn.match(/0{5,}/)))){
		alert("Enter valid alternative mobile number");
		return false;
	}
	}
	else if(!re.test((email).toLowerCase())) {
	    alert("enter valid email address");
	    return false;
	}
	else{
		return true;
	}
	}
}

function isAlpha(evt) {

	var iKeyCode = (evt.which) ? evt.which : evt.keyCode

	if ((iKeyCode >= 65 && iKeyCode <= 90) || (iKeyCode >= 97 && iKeyCode <= 122))
		return true;

	return false;
}

function isNumber(evt) {
	var iKeyCode = (evt.which) ? evt.which : evt.keyCode
	if (iKeyCode != 46 && iKeyCode > 31 && (iKeyCode < 48 || iKeyCode > 57))
		return false;

	return true;
}

function address(f) {
	if (f.checkBox.checked == true) {
		document.getElementById('permanent').value = document.getElementById('current').value;
	}
}
