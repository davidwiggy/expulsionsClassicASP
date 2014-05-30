<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<% DBLink = "ExpulsionsIndex" %>
<!--#include virtual ="connections.asp"-->
<!--#include file="sql.inc"-->
<!--Setting the global varible for the current page-->
<% Application("page")="DetailsFormAdd" %>
<!--
	Developer: David Wiggins
    Date: March 2014
    Purpose: 
             
-->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
   <link rel="stylesheet" type="text/css" href="ExpulsionsCSS.css" />
   <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
   <meta name="GENERATOR" content="Microsoft FrontPage 4.0">
   
	<title>BCSD Intranet Home Page</title>
<!-- STANDARD HEADER BEGIN******************************************************************-->
</head>
<body>
<table width="100%">
<tr><td align="right" valign="top"><b><A HREF="/index.asp"><font face="tahoma" color="#006600" size="0">Home Page</font></b></A></td></tr>
<br>

</table>

<table width="100%">
<tr>
  	<td align="left"> <img src="BCSD_Logo_Medium.jpg" alt="Logo" width="143" height="120" /></td>
	<td align="center" valign="middle"><b><font face="tahoma" color="#006600" size="6">Welcome to Berkeley County School District's Intranet</font></b></td>
</tr>
</table>
<hr>

<div align="center">
<font face="tahoma" color="#006600" size="1"><b>
<% =formatDateTime(date(), vblongdate) %></b></font><br>

</div>

<!---------- Starting the Main Menu -------------------------------------------------------------->

<div class="mainMenuForDetailsForm">
	<br />
	<div id="menuHeader">
    	Expulsion Hearings
    </div>
    <br />
	<form action="" method="post" name="frmDetails">
    <div id="alignCenter">
    	<input id="buttonDesign" type="submit" value="Add Student" onclick="return checkFormInfo();" style="width:250px; height:30px;" />
        <input id="buttonDesign" type="submit" value="Expulsions List" onclick="setList();" style="width:250px; height:30px;" />
        <input id="buttonDesign" type="submit" value="Main Menu" onclick="setMain();" style="width:250px; height:30px;" />
    </div>
    <table class="tableDetailForm">
    <tr><td id="alignCenter">	<span style="font-weight:bold;"> Yellow Fields are Required. </span></td></tr>
    <tr><td id="alignCenter"><span style="font-weight:bold;">Please enter ALL dates in format MM/DD/YYYY.</span></td></tr>
    </table>
    <!--Building the left side to the page with input boxes, drop down list, radio boxes, and checkboxes-->
    <div id="leftContainer" >
    	<span id="instructions">General Student Information</span><br /><br />
    	<table class="tableDetailForm" >
        	<tr >
            	<td style="width:37px;">Last: &nbsp;</td>
                <td style="width:145px;"><input type="text" value="" name="stuLast" style="background-color:#FFFF00;" /></td>
            </tr>
            <tr >
            	<td id="alignLeft">First: &nbsp;</td>
                <td><input type="text" value="" name="stuFirst" style="background-color:#FFFF00;" /></td>
            </tr>
            <tr >
            	<td id="alignLeft">DOB: &nbsp;</td>
                <td><input type="text" value="" name="dob" style="background-color:#FFFF00;" /></td>
            </tr>
            <tr >
            	<td id="alignLeft">Age: &nbsp;</td>
                <td><input type="text" value="" name="age" /></td>
            </tr>
            <tr >
            	<td>Grade: &nbsp;</td>
                <td><input type="text" value="" name="grade" /></td>
            </tr>
            <tr >
            	<td id="alignLeft"> SASIID: &nbsp;</td>
                <td><input type="text" value="" name="sas"  /></td>
            </tr>
            <tr >
            	<td id="alignLeft">Race: &nbsp;</td>
                <td><select name="race" style="width:145px;"><% setRace() %></select></td>
            </tr>
        </table>
        <table class="tableDetailForm">
        	<tr >
                <td id="alignLeft" style="width:65px;">Gender: &nbsp;</td>
                <td style="width:60px;"><select name="gender" style="width:50px;"><option>M</option><option>F</option></select></td>
                <td id="alignLeft" style="width:75px;">Special Ed:</td>
                <td id="alignLeft"><input type="checkbox" name="spEd" value="Yes" /> </td>
            </tr>
         </table>
		<hr align="left" width="90%"/>
        <table class="tableDetailForm">
        	<tr >
            	<td id="alignLeft" style="width:45px;">Title: &nbsp;</td>
                <td style="width:145px;"><input type="text" value="" name="title"  /></td>
            </tr>
            <tr >
            	<td id="alignLeft">Parent First: &nbsp;</td>
                <td><input type="text" value="" name="parFirst" /></td>
            </tr>
            <tr >
            	<td id="alignLeft">Parent Last: &nbsp;</td>
                <td><input type="text" value="" name="parLast"  /></td>
            </tr>
            <tr >
            	<td id="alignLeft">Address: &nbsp;</td>
                <td><input type="text" value="" name="address" style="background-color:#FFFF00;" /></td>
            </tr>
            <tr >
            	<td id="alignLeft">City: &nbsp;</td>
                <td><input type="text" value="" name="city" style="background-color:#FFFF00;" /></td>
            </tr>
        </table>
        <table class="tableDetailForm">
        	<tr >
                <td id="alignLeft" style="width:65px;">State: &nbsp;</td>
                <td style="width:50px;"><input type="text" readonly="readonly" value="SC" name="state" style="width:40px;"></select></td>
                <td id="alignLeft" style="width:40px;">Zip: &nbsp;</td>
                <td id="alignLeft"><input type="text" class="zip" name="zip"  style="width:50px; background-color:#FFFF00;"/></td>
            </tr>
         </table>
         <hr align="left" width="90%" />
         <div id="instructions"> Re-Admission Information</div>
         <table class="tableDetailForm">
         	<tr >
            	<td id="alignLeft" >Date Received <br />(In Format MM/DD/YYYY): &nbsp;<br /><br /></td>
                <td><input type="text" value="" name="recDate" /><br /><br /></td>
            </tr>
            <tr>
            	<td id="alignLeft">Date Student Can Re-Enroll: &nbsp;</td>
                <td><input type="text" value="" name="reEnrollDate" /></td>
            </tr>
         </table>
         <table class="tableDetailForm">
         	<tr>
            	<td id="alignLeft" style="width:75px;"><input type="radio" name="admission" value="1" />Approved</td>
                <td id="alignLeft" style="width:75px;"><input type="radio" name="admission" value="2"  />Denied</td>
                <td id="alignLeft" style="width:75px;"><input type="radio" name="admission" value="3"  checked="checked"/>N/A</td>
            </tr>
         </table>
    </div>
    <!--Building the Right side of the screen with more input boxes and drop downs.-->
    <div id="rightContainer" >
    <span id="instructions">Expulsion Information</span><br /><br />
    	<table class="tableDetailForm">
        	<tr>
            	<td id="alignLeft" style="width:45px;">School: &nbsp;</td>
                <td style="width:145px;"><select name="school" style="min-width:150px;"><% setSchool()%></select></td>
            </tr>
            <tr>
            	<td id="alignLeft">School Year: &nbsp;</td>
                <td><select name="schYear" style="min-width:150px;" ><% setSchYear() %></select></td>
            </tr>
            <tr>
            	<td id="alignLeft">Hearing Officer: &nbsp;</td>
                <td><select name="officer" style="min-width:150px;"><% setHearOff() %></select></td>
            </tr>
            <tr>
            	<td id="alignLeft">Hearing Date: &nbsp;</td>
                <td><input type="text" value="" name="hearingDate" style="background-color:#FFFF00;" /></td>
            </tr>
        </table>
        <table class="tableDetailForm">
            <tr>
            	<td id="alignLeft">Hearing Time: &nbsp;</td>
                <td><input type="text" value="" name="hearingTime" style="background-color:#FFFF00; width:75px;" /></td>
                <td><select name="ampm" style="width:50px; background-color:#FFFF00;"><option value="AM">AM</option><option value="PM">PM</option></select></td>
            </tr>
        </table>
        <table class="tableDetailForm">
            <tr>
            	<td id="alignLeft" style="width:125px;">Certified Letter Date: &nbsp; </td>
                <td><input type="text" value="" name="certLtrDate" /></td>
            </tr>
            <tr>
            	<td id="alignLeft">Decision: &nbsp;</td>
                <td><select name="decision" style="min-width:150px; background-color:#FFFF00;"><% setDecision() %></select></td>
            </tr>
        </table>
        <hr align="right" width="100%" />
        <table class="tableDetailForm">
    		<tr>
            	<td id="alignLeft" bgcolor="#FF0000"  style="width:80px;">Infraction: &nbsp;</td>
                <td><select name="violation"  id="violation" style="width:200px; background-color:#FF0000" onchange="setInfBoxes();"><% setInfraction() %></select></td>
            </tr>
        </table>
        <table >
        	<tr>
            	<td id="alignCenter" style="width:20px;">1. &nbsp;</td>
                <td id="alignLeft" style="width:100px;"><textarea name="violationList1" id="violationList1" style="resize:none; width:225px; max-height:30px;"  readonly="readonly" ></textarea></td>
                <td id="alignLeft" style="width:15px;"><input id="clearButton" type="button" value="X" name="clearInf1" onclick="clear1();"/></td>
            </tr>
          	<tr>
            	<td id="alignCenter" style="width:20px;">2. &nbsp;</td>
                <td><textarea name="violationList2" id="violationList2" style="resize:none; width:225px; max-height:30px;"  readonly="readonly" ></textarea></td>
                <td id="alignLeft" style="width:15px;"><input id="clearButton" type="button" value="X" name="clearInf2" onclick="clear2();"/></td>
            </tr>
          	<tr>
            	<td id="alignCenter" style="width:20px;">3. &nbsp;</td>
                <td><textarea name="violationList3" id="violationList3" style="resize:none; width:225px; max-height:30px;"  readonly="readonly" ></textarea></td>
                <td id="alignLeft" style="width:15px;"><input id="clearButton" type="button" value="X" name="clearInf3" onclick="clear3();"/></td>
            </tr>
           	<tr>
            	<td id="alignCenter" style="width:20px;">4. &nbsp;</td>
                <td><textarea name="violationList4" id="violationList4" style="resize:none; width:225px; max-height:30px;"  readonly="readonly" ></textarea></td>
                <td id="alignLeft" style="width:15px;"><input id="clearButton" type="button" value="X" name="clearInf4" onclick="clear4();"/></td>
            </tr>
        </table>
        <table class="tableDetailForm">
        	<tr>
            	<td id="alignLeft">Notes: &nbsp;</td>
            </tr>
            <tr>
            	<td id="alignLeft"><textarea name="notes" style="width:300px; height:80px; resize: "></textarea></td>
            </tr>
            <tr>
            	<td id="alignLeft">Appeal/Dec: &nbsp;</td>
            </tr>
            <tr>
            	<td id="alignLeft"><textarea name="appealNotes" style="width:300px; height:50px; resize: "></textarea></td>
            </tr>
        </table>
        <table class="tableDetailForm">
        	<tr>
            	<td id="alignLeft" style="width: 140px;">Decision Date on Letter: &nbsp;</td>
                <td><input type="text" value="" name="dateOnLetter"  /></td>
            </tr>
            <tr>
            	<td id="alignLeft">Admin: &nbsp;</td>
                <td><input type="text" value="" name="admin"  /></td>
            </tr>
        </table>
    </form>
    </div>
</div>


<script>
	function setHearings()
	{
		document.frmIndex.action="SdntLtHearings.asp";
	}
	
	function clear1()
	{
		document.getElementById('violationList1').value = "";
		document.getElementById('violationList1').value = document.getElementById('violationList2').value;
		document.getElementById('violationList2').value = document.getElementById('violationList3').value;
		document.getElementById('violationList3').value = document.getElementById('violationList4').value;
		document.getElementById('violationList4').value = "";
	}
	function clear2()
	{
		document.getElementById('violationList2').value = "";
		document.getElementById('violationList2').value = document.getElementById('violationList3').value;
		document.getElementById('violationList3').value = document.getElementById('violationList4').value;
		document.getElementById('violationList4').value = "";
	}
	function clear3()
	{
		document.getElementById('violationList3').value = "";
		document.getElementById('violationList3').value = document.getElementById('violationList4').value;
		document.getElementById('violationList4').value = "";
	}
	function clear4()
	{
		document.getElementById('violationList4').value = "";
	}
	
	//This function sets the infraction textarea with the choosen value
	function setInfBoxes()
	{
		var mylist=document.getElementById("violation");
	    var currentViolation = mylist.options[mylist.selectedIndex].text;
		if (document.getElementById('violationList1').value === "")
		{
			document.getElementById('violationList1').value = currentViolation;
		}
		else if (document.getElementById('violationList2').value === "")
		{
			document.getElementById('violationList2').value = currentViolation;
		}
		else if (document.getElementById('violationList3').value === "")
		{
			document.getElementById('violationList3').value = currentViolation;
		}
		else if (document.getElementById('violationList4').value === "")
		{
			document.getElementById('violationList4').value = currentViolation;
		}
		else
		{
			alert("Only four violations per offense allowed");
		}
	}
	
	
	//This function validates the information entered into the form.
	function checkFormInfo()
	{
			var first    =document.forms["frmDetails"]["stuFirst"].value;
			var last     =document.forms["frmDetails"]["stuLast"].value;
			var city     =document.forms["frmDetails"]["city"].value;
			var zip      =document.forms["frmDetails"]["zip"].value;
			var address  =document.forms["frmDetails"]["address"].value;
			var dob      =document.forms["frmDetails"]["dob"].value;
			var hearDate =document.forms["frmDetails"]["hearingDate"].value;
			var received =document.forms["frmDetails"]["recDate"].value;
			var enroll   =document.forms["frmDetails"]["reEnrollDate"].value;
			var letter   =document.forms["frmDetails"]["certLtrDate"].value;
			var dec      =document.forms["frmDetails"]["decision"].value;
			var offense  =document.forms["frmDetails"]["violation"].value;
			var hTime    =document.forms["frmDetails"]["hearingTime"].value;
			var pattern =/^([0-9]{2})\/([0-9]{2})\/([0-9]{4})$/;

	
			if(received === null || received === "")
			{
			
			}else{
				if(pattern.test(received) == false)
				{
					alert("Received date Must be Entered in this Format MM/DD/YYYY. \n\nCHECK YOUR MONTH MUST BE (MM) TWO DIGITS\n\n EXAMPLE: 01/01/2001");
					return false;
				}
				else if(isValidDate(received) == false)
				{
					alert("Date must be a valid date");
					return false;
				}
			}
			
			if(enroll === null || enroll === ""){
			}else{
				if(pattern.test(enroll) == false)
				{
					alert("Enroll date Must be Entered in this Format MM/DD/YYYY. \n\nCHECK YOUR MONTH MUST BE (MM) TWO DIGITS\n\n EXAMPLE: 01/01/2001");
					return false;
				}
				else if(isValidDate(enroll) == false)
				{
					alert("Date must be a valid date");
					return false;
				}
			}
			
			if(letter === null || letter === "")
			{
			
			}else{
				if(pattern.test(letter) == false)
				{
					alert("Certified Letter date Must be Entered in this Format MM/DD/YYYY. \n\nCHECK YOUR MONTH MUST BE (MM) TWO DIGITS\n\n EXAMPLE: 01/01/2001");
					return false;
				}
				else if(isValidDate(letter) == false)
				{
					alert("Date must be a valid date");
					return false;
				}
			}
			
			if(first===null || first==="" || last===null || last==="")
			{
				alert("Both First and Last Name Fields Must be Filled out!");
				return false;
			}
			else if(address===null || address==="")
			{
				alert("Address Field Must be Filled out!");
				return false;
			}
			else if(city===null || city==="" || /^\D+$/.test(city) == false)
			{
				alert("City must be filled out and not contain any numbers.");
				return false;
			}
			else if(zip===null || zip==="" || /^\d+$/.test(zip) == false || zip.length != 5)
			{
				alert("Zip code must be filled in, contain only numbers, and have be 5 digits long.");
				return false;
			}
			else if(dob===null || dob==="" || pattern.test(dob) == false)
			{
				alert("DOB Date Must be Entered in this Format MM/DD/YYYY. \n\nCHECK YOUR MONTH MUST BE (MM) TWO DIGITS \n\n EXAMPLE: 01/01/2001");
				return false;
			}
			else if(isValidDate(dob) == false)
			{
				alert("Date must be a valid date");
				return false;
			}
			else if(hearDate===null || hearDate==="" || pattern.test(hearDate) == false)
			{
				alert("Hearing Date Must be Entered in this Format MM/DD/YYYY. \n\nCHECK YOUR MONTH MUST BE (MM) TWO DIGITS \n\n EXAMPLE: 01/01/2001");
				return false;
			}
			else if(isValidDate(hearDate) == false)
			{
				alert("Date must be a valid date");
				return false;
			}
			else if(hTime===null || hTime==="")
			{
				alert("You must fill in time in the following format HH:MM")
				return false;
			}
			else if(validatetime()==false)
			{
				return false;
			}
			else if(dec===null || dec ==="")
			{
				alert("You must select a Decision");
				return false;
			}
			else if(offense===null || offense==="")
			{
				alert("You Must select an Infraction");
				return false;
			}
			else
			{	
				document.frmDetails.action="studentAdded.asp";
				return true;
			}
	}
	
	//This function validates the date
	function isValidDate(date) {
        var valid = true;

        //date = date.replace('/-/g', '');

        var month = parseInt(date.substring(0, 2));
        var day   = parseInt(date.substring(3, 5));
        var year  = parseInt(date.substring(6, 10));
		
        if((month < 1) || (month > 12)) valid = false;
        else if((day < 1) || (day > 31)) valid = false;
        else if(((month == 4) || (month == 6) || (month == 9) || (month == 11)) && (day > 30)) valid = false;
        else if((month == 2) && (((year % 400) == 0) || ((year % 4) == 0)) && ((year % 100) != 0) && (day > 29)) valid = false;
        else if((month == 2) && ((year % 100) == 0) && (day > 29)) valid = false;

    	return valid;
	}
	
	//Begin validating the user entered time
	function  validatetime()
	{
	  var strval = document.frmDetails.hearingTime.value;
	  var strval1;
		
	  //minimum lenght is 6. example 1:2 AM
	  if(strval.length != 5)
	  {
	   alert("Invalid entry. Time must be in format HH:MM.");
	   return false;
	  }
	  	  
	  var hour = parseInt(strval.substring(0,2));
	  var minute = parseInt(strval.substring(3,5));
	  
	  if(hour > 12)
	  {
	   alert("invalid time. Hour can not be greater than 12.");
	   return false;
	  }
	  else if(hour < 0)
	  {
	   alert("Invalid time. Hour can not be hours less than 0.");
	   return false;
	  }
	  else if(isNaN(hour) == true)
	  {
	  	alert("Time must be numeric.");
		return false;
	  }
	  //Completes checking hours.
	  if(minute > 59)
	  {
	  	alert("invalid time. Minute can not be greater than 59.");
		return false;
	  }
	  else if (minute < 0)
	  {
	  	alert("invalid time. Minute can not be less than 0.");
		return false;
	  }
	  else if(isNaN(minute) == true)
	  {
	  	alert("Time must be numeric.");
		return false;
	  }
	   
	   	return true;
	}	
	
</script>

<% 
	'Setting the race drop down list	
	sub setRace()
		Application("page") = "DetailsFormRace"
		setSQL()
		Dim rsRace
		Set rsRace = connection.execute(Application("SQL"))
		Application("page") = "DetailsForm"
		
		While Not rsRace.EOF
				%><option value="<%Response.Write(rsRace("race"))%>"><%Response.Write(rsRace("race"))%></option><%
		rsRace.MoveNext
		Wend
		rsRace.close
		Set rsRace= Nothing
	End sub
	
	'Setting the Schools drop down list
	sub setSchool()
		Application("page") = "DetailsFormSchool"
		setSQL()
		Dim rsSchool
		Set rsSchool = connection.execute(Application("SQL"))
		Application("page") = "DetailsFormAdd"
		
		While Not rsSchool.EOF
			%><option value="<%Response.Write(rsSchool("SchoolInit"))%>"><%Response.Write(rsSchool("SchoolInit"))%></option><%
			rsSchool.MoveNext
		Wend
		rsSchool.close
		Set rsSchool = Nothing
	End sub
	
	sub setSchYear()
		Application("page") = "DetailsFormSchoolYear"
		setSQL()
		Dim rsSchYear
		Set rsSchYear = connection.execute(Application("SQL"))
		Application("page") = "DetailsFormAdd"
		
		While Not rsSchYear.EOF
			%><option value="<%Response.Write(rsSchYear("SchoolYear"))%>"><%Response.Write(rsSchYear("SchoolYear"))%></option><%
			rsSchYear.MoveNext
		Wend
		rsSchYear.close
		Set rsSchYear = Nothing
	End sub
	
	sub setHearOff()
		Application("page") = "DetailsFormHearingOff"
		setSQL()
		Dim rsOfficer
		Set rsOfficer = connection.execute(Application("SQL"))
		Application("page") = "DetailsFormAdd"
		
		While Not rsOfficer.EOF
			%><option value="<%Response.Write(rsOfficer("HearingOfficer"))%>"><%Response.Write(rsOfficer("HearingOfficer"))%></option><%
			rsOfficer.MoveNext
		Wend
		rsOfficer.close
		Set rsOfficer = Nothing
	End sub
	
	sub setDecision()
		Application("page") = "DetailsFormDecision"
		setSQL()
		Dim rsDecision
		Set rsDecision = connection.execute(Application("SQL"))
		Application("page") = "DetailsFormAdd"
		%><option value=""></option><%
		
		While Not rsDecision.EOF
			%><option value="<%Response.Write(rsDecision("Description"))%>"><%Response.Write(rsDecision("Description"))%></option><%
			rsDecision.MoveNext
		Wend
		rsDecision.close
		Set rsDecision = Nothing
	End sub
	
	sub setInfraction()
		Application("page") = "DetailsFormInfraction"
		setSQL()
		Dim rsInfraction
		Set rsInfraction = connection.execute(Application("SQL"))
		Application("page") = "DetailsFormAdd"
		%><option value=""></option><%
		While Not rsInfraction.EOF 
			%><option value="<%Response.Write(rsInfraction("Offense"))%>"><%Response.Write(rsInfraction("Offense"))%></option><%
			rsInfraction.MoveNext
		Wend
		rsInfraction.close
		Set rsInfraction = Nothing
	End sub
%>

</body>
</html>