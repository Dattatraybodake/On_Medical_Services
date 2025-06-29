<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<script>
	function AllowAlphabet() {
		if (!ureg.fname.value.match(/^[a-zA-Z]+$/) && ureg.fname.value != "") {
			ureg.fname.value = "";
			ureg.fname.focus();
			alert("Please Enter only alphabet in text");
		}

	}
</script>

<script>
	function AllowAlphabet() {
		if (!ureg.mname.value.match(/^[a-zA-Z]+$/) && ureg.mname.value != "") {
			ureg.mname.value = "";
			ureg.mname.focus();
			alert("Please Enter only alphabet in text");
		}

	}
</script>

<script>
	function AllowAlphabet2() {
		if (!ureg.lname.value.match(/^[a-zA-Z]+$/) && ureg.lname.value != "") {
			ureg.lname.value = "";
			ureg.lname.focus();
			alert("Please Enter only alphabet in text");
		}

	}
</script>
<script>
	function validateEmail() {

		var email = document.ureg.email.value;

		if (email == 0) {
			alert("Enter Valid mail id");
			//document.ureg.email.focus();
			return false;
		}
		if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(email)) {
		} else {
			alert("Enter valid mail id");
			//	document.ureg.email.focus();
			return false;
		}

	}
</script>

<script type="text/javascript">
	function ValidateMobNumber(txtMobId) {
		var fld = document.getElementById(txtMobId);

		if (fld.value == "") {
			alert("You didn't enter a phone number.");
			fld.value = "";
			//	fld.focus();
			return false;
		} else if (isNaN(fld.value)) {
			alert("The phone number contains illegal characters.");
			fld.value = "";
			//	fld.focus();
			return false;
		} else if (!(fld.value.length == 10)) {
			alert("The phone number is the wrong length. \nPlease enter 10 digit mobile no.");
			fld.value = "";
			//	fld.focus();
			return false;
		}
	}
</script>


<meta charset="utf-8">
<script language="Javascript">
	function validation() {

		var email = document.ureg.email.value;

		if (email == 0) {
			alert("Enter Valid mail id");
			document.ureg.email.focus();
			return false;
		}
		if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(email)) {
		} else {
			alert("Enter valid mail id");
			document.ureg.email.focus();
			return false;
		}

	}
</script>


<script type="text/javascript">
	function ValidateMobNumber(txtMobId) {
		var fld = document.getElementById(txtMobId);

		if (fld.value == "") {
			alert("You didn't enter a phone number.");
			fld.value = "";
			//	fld.focus();
			return false;
		} else if (isNaN(fld.value)) {
			alert("The phone number contains illegal characters.");
			fld.value = "";
			//	fld.focus();
			return false;
		} else if (!(fld.value.length == 10)) {
			alert("The phone number is the wrong length. \nPlease enter 10 digit mobile no.");
			fld.value = "";
			//	fld.focus();
			return false;
		}

	}

	function validatepassword() {

		var password = document.ureg.password.value;

		if (password != "") {
			if (password.length < 6) {
				//	document.ureg.password.focus();
				document.ureg.password = "";
				alert("Password must contain at least 6 characters!");

				return false;
			}
		}
	}
</script>


</head>
<body>

</body>
</html>