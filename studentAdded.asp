<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<% DBLink = "ExpulsionsIndex" %>
<!--#include virtual ="connections.asp"-->
<!--#include file="sql.inc"-->
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

<!--Starting the code for inserting a new record into HRGnew-->
<%
	special = Request.Form("spEd")
	schHearTime = Request.Form("hearingTime")
	schHearTime = schHearTime & " " & Request.Form("ampm")
	
	if special <> "Yes" Then
		special = "No"
	End If
	
	'Getting code for Decision
	Application("page") = "findDecisionCode"
	setSQL()
	Dim rsDecisionCode
	Set rsDecisionCode = connection.execute(Application("SQL"))
	decisionCode = rsDecisionCode("code")
	rsDecisionCode.close
	Set rsDecisionCode = Nothing
	
	'Getting code for infraction
	Application("page") = "findInfCode"
	setSQL()
	Dim rsInfCode
	Set rsInfCode = connection.execute(Application("SQL"))
	offCode = rsInfCode("offenseCode")
	rsInfCode.close
	Set rsInfCode = Nothing
	
	'Getting code for race
	Application("page") = "findRaceCode"
	setSQL()
	Dim rsRaceCode
	Set rsRaceCode = connection.execute(Application("SQL"))
	raceCode = rsRaceCode("code")
	rsRaceCode.close
	Set rsRaceCode = Nothing
	
	'Inserting New Record
	Application("page") = "AddSdntExpulsions"
	setSQL()
	Dim rsInsert
	Set rsInsert = connection.execute(Application("SQL"))
	
	'Finding inserted student id number from database
	Application("page") = "findInsertedSdntNum"
	setSQL()
	Dim rsFindId
	Set rsFindId = connection.execute(Application("SQL"))
	newId = rsFindId("Id")
	rsFindId.close
	Set rsFindId = Nothing
	
	'This is updating the insert students reEnroll date. I had to do it like this because the insert statement for dates would not allow
	'for null. So I needed a condition to see if the user entered a date in the text box and then just update the student information from
	'that point. I will have to do the same thing for cert. letter date and decision date.
	If Request.Form("reEnrollDate") <> "" Then
		Application("page") = "updateNewInsert1"
		setSQL()
		Dim rsUpdateEnrollDate
		Set rsUpdateEnrollDate = connection.execute(Application("SQL"))
	End If
	
	If Request.Form("certLtrDate") <> "" Then
		Application("page") = "updateNewInsert2"
		setSQL()
		Dim rsUpdateCertDate
		Set rsUpdateCertDate = connection.execute(Application("SQL"))
	End If
	
	If Request.Form("dateOnLetter") <> "" Then
		Application("page") = "updateNewInsert3"
		setSQL()
		Dim rsUpdateDecisionD
		Set rsUpdateDecisionD = connection.execute(Application("SQL"))
	End If
	
%>
<!--Finished with the inserting statements-->

<!---------- Starting the Main Menu -------------------------------------------------------------->
<div class="mainMenuForDetailsForm">
	<br />
	<div id="menuHeader">
    	Expulsion Hearings
    </div>
    <br />
	<form action="" method="post" name="frmDetails">
    <div id="alignCenter">
    	<input id="buttonDesign" type="submit" value="Edit Student" onclick="setEdit();" style="width:250px; height:30px;" />
        <input id="buttonDesign" type="submit" value="Main Menu" onclick="setMain();" style="width:250px; height:30px;" />
    </div>
    <table class="tableDetailForm">
    <tr><td id="alignCenter"><span style="font-weight:bold;">Student Information Updated in the Database.</span></td></tr>
    </table>
    <!--Building the left side to the page with input boxes, drop down list, radio boxes, and checkboxes-->
    <div id="leftContainer" >
    	<span id="instructions">General Student Information</span><br /><br />
    	<table class="tableDetailForm" >
        	<tr >
            	<td style="width:37px;">Last: &nbsp;</td>
                <td style="width:145px;"><input type="text" value="<%=Request.Form("stuLast")%>" style="background-color:#CCCCCC;" readonly="readonly"/></td>
            </tr>
            <tr >
            	<td id="alignLeft">First: &nbsp;</td>
                <td><input type="text" value="<%=Request.Form("stuFirst")%>" style="background-color:#CCCCCC;" readonly="readonly" /></td>
            </tr>
            <tr >
            	<td id="alignLeft">DOB: &nbsp;</td>
                <td><input type="text" value="<%=Request.Form("dob")%>" style="background-color:#CCCCCC;" readonly="readonly" /></td>
            </tr>
            <tr >
            	<td id="alignLeft">Age: &nbsp;</td>
                <td><input type="text" value="<%=Request.Form("age")%>" style="background-color:#CCCCCC;" readonly="readonly"/></td>
            </tr>
            <tr >
            	<td>Grade: &nbsp;</td>
                <td><input type="text" value="<%=Request.Form("grade")%>" style="background-color:#CCCCCC;" readonly="readonly"/></td>
            </tr>
            <tr >
            	<td id="alignLeft"> SASIID: &nbsp;</td>
                <td><input type="text" value="<%=Request.Form("sas")%>" style="background-color:#CCCCCC;" readonly="readonly" /></td>
            </tr>
            <tr >
            	<td id="alignLeft">Race: &nbsp;</td>
                <td><input type="text" value="<%=Request.Form("race")%>" style="background-color:#CCCCCC;" readonly="readonly"/></td>
            </tr>
        </table>
        <table class="tableDetailForm">
        	<tr >
                <td id="alignLeft" style="width:65px;">Gender: &nbsp;</td>
                <td style="width:60px;"><input type="text" style="width:50px; background-color:#CCCCCC;" readonly="readonly" value="<%=Request.Form("gender")%>"></td>
                <td id="alignLeft" style="width:75px;">Special Ed:</td>
                <td id="alignLeft"><input type="checkbox" <%If Request.Form("spEd") = "Yes" Then %> checked="checked" <%End If%> disabled="disabled" /></td>
            </tr>
         </table>
		<hr align="left" width="90%"/>
        <table class="tableDetailForm">
        	<tr >
            	<td id="alignLeft" style="width:45px;">Title: &nbsp;</td>
                <td style="width:145px;"><input type="text" value="<%=Request.Form("title")%>" style="background-color:#CCCCCC;" readonly="readonly" /></td>
            </tr>
            <tr >
            	<td id="alignLeft">Parent First: &nbsp;</td>
                <td><input type="text" value="<%=Request.Form("parFirst")%>" style="background-color:#CCCCCC;" readonly="readonly" /></td>
            </tr>
            <tr >
            	<td id="alignLeft">Parent Last: &nbsp;</td>
                <td><input type="text" value="<%=Request.Form("parLast")%>" style="background-color:#CCCCCC;" readonly="readonly" /></td>
            </tr>
            <tr >
            	<td id="alignLeft">Address: &nbsp;</td>
                <td><input type="text" value="<%=Request.Form("address")%>" style="background-color:#CCCCCC;" readonly="readonly" /></td>
            </tr>
            <tr >
            	<td id="alignLeft">City: &nbsp;</td>
                <td><input type="text" value="<%=Request.Form("city")%>" style="background-color:#CCCCCC;" readonly="readonly" /></td>
            </tr>
        </table>
        <table class="tableDetailForm">
        	<tr >
                <td id="alignLeft" style="width:65px;">State: &nbsp;</td>
                <td style="width:50px;"><input type="text" value="SC" style="width:40px;background-color:#CCCCCC;" readonly="readonly"></select></td>
                <td id="alignLeft" style="width:40px;">Zip: &nbsp;</td>
                <td id="alignLeft"><input type="text" class="zip" name="zip" value="<%=Request.Form("zip")%>" style="width:50px; background-color:#CCCCCC;" readonly="readonly"/></td>
            </tr>
         </table>
         <hr align="left" width="90%" />
         <div id="instructions"> Re-Admission Information</div>
         <table class="tableDetailForm">
         	<tr >
            	<td id="alignLeft" >Date Received <br />(In Format MM/DD/YYYY): &nbsp;<br /><br /></td>
                <td><input type="text" value="<%=Request.Form("recDate")%>" style="background-color:#CCCCCC;" readonly="readonly" /><br /><br /></td>
            </tr>
            <tr>
            	<td id="alignLeft">Date Student Can Re-Enroll: &nbsp;</td>
                <td><input type="text" value="<%=Request.Form("reEnrollDate")%>" name="reEnrollDate" style="background-color:#CCCCCC;" readonly="readonly" /></td>
            </tr>
         </table>
         <table class="tableDetailForm">
         	<tr>
            	<td id="alignLeft" style="width:75px;"><input type="radio" name="admission" value="approved" readonly="readonly" <%If Request.Form("admission")=1 Then %> checked="checked" <%End If%> />Approved</td>
                <td id="alignLeft" style="width:75px;"><input type="radio" name="admission" value="denied" readonly="readonly" <%If Request.Form("admission")=2 Then %> checked="checked" <%End If%>  />Denied</td>
                <td id="alignLeft" style="width:75px;"><input type="radio" name="admission" value="n/a" readonly="readonly" <%If Request.Form("admission")=3 Then %> checked="checked" <%End If%>  />N/A</td>
            </tr>
         </table>
    </div>
    <!--Building the Right side of the screen with more input boxes and drop downs.-->
    <div id="rightContainer" >
    <span id="instructions">Expulsion Information</span><br /><br />
    	<table class="tableDetailForm">
        	<tr>
            	<td id="alignLeft" style="width:45px;">School: &nbsp;</td>
                <td style="width:145px;"><input type="text" style="min-width:150px; background-color:#CCCCCC;" readonly="readonly" value="<%=Request.Form("school")%>" /></td>
            </tr>
            <tr>
            	<td id="alignLeft">School Year: &nbsp;</td>
                <td><input type="text" style="min-width:150px; background-color:#CCCCCC;" readonly="readonly" value="<%=Request.Form("schYear")%>" /></td>
            </tr>
            <tr>
            	<td id="alignLeft">Hearing Officer: &nbsp;</td>
                <td><input type="text" style="min-width:150px; background-color:#CCCCCC;" readonly="readonly" value="<%=Request.Form("officer")%>" /></td>
            </tr>
            <tr>
            	<td id="alignLeft">Hearing Date: &nbsp;</td>
                <td><input type="text" value="<%=Request.Form("hearingDate")%>" style="background-color:#CCCCCC;" readonly="readonly" /></td>
            </tr>
            <tr>
            	<td id="alignLeft">Hearing Time: &nbsp;</td>
                <td><input type="text" value="<%=schHearTime%>" style="background-color:#CCCCCC;" readonly="readonly" /></td>
            </tr>
            <tr>
            	<td id="alignLeft">Certified Letter Date: &nbsp; </td>
                <td><input type="text" value="<%=Request.Form("certLtrDate")%>" style="background-color:#CCCCCC;" readonly="readonly" /></td>
            </tr>
            <tr>
            	<td id="alignLeft">Decision: &nbsp;</td>
                <td><input type="text" style="min-width:150px; background-color:#CCCCCC;" readonly="readonly" value="<%=Request.Form("decision")%>" /></td>
            </tr>
        </table>
        <hr align="right" width="100%" />
        <table class="tableDetailForm">
    		<tr>
            	<td id="alignLeft" bgcolor="#FF0000"  style="width:80px;">Infraction: &nbsp;</td>
                <td><input type="text" style="width:200px; background-color:#CCCCCC;" readonly="readonly" value="<%=Request.Form("violation")%>" /></td>
            </tr>
        </table>
        <table >
        	<tr>
            	<td id="alignCenter" style="width:20px;">1. &nbsp;</td>
                <td id="alignLeft" style="width:100px;"><textarea style="resize:none; width:225px; max-height:30px; background-color:#CCCCCC;" readonly="readonly" ><%=Request.Form("violationList1")%></textarea></td>
            </tr>
          	<tr>
            	<td id="alignCenter" style="width:20px;">2. &nbsp;</td>
                <td><textarea style="resize:none; width:225px; max-height:30px; background-color:#CCCCCC;" readonly="readonly" ><%=Request.Form("violationList2")%></textarea></td>
            </tr>
          	<tr>
            	<td id="alignCenter" style="width:20px;">3. &nbsp;</td>
                <td><textarea style="resize:none; width:225px; max-height:30px; background-color:#CCCCCC;" readonly="readonly" ><%=Request.Form("violationList3")%></textarea></td>
            </tr>
           	<tr>
            	<td id="alignCenter" style="width:20px;">4. &nbsp;</td>
                <td><textarea style="resize:none; width:225px; max-height:30px; background-color:#CCCCCC;" readonly="readonly" ><%=Request.Form("violationList4")%></textarea></td>
            </tr>
        </table>
        <table class="tableDetailForm">
        	<tr>
            	<td id="alignLeft">Notes: &nbsp;</td>
            </tr>
            <tr>
            	<td id="alignLeft"><textarea style="width:300px; height:80px; background-color:#CCCCCC;" readonly="readonly"><%=Request.Form("notes")%></textarea></td>
            </tr>
            <tr>
            	<td id="alignLeft">Appeal/Dec: &nbsp;</td>
            </tr>
            <tr>
            	<td id="alignLeft"><textarea style="width:300px; height:50px; background-color:#CCCCCC;" readonly="readonly"><%=Request.Form("appealNotes")%></textarea></td>
            </tr>
        </table>
        <table class="tableDetailForm">
        	<tr>
            	<td id="alignLeft" style="width: 140px;">Decision Date on Letter: &nbsp;</td>
                <td><input type="text" value="<%=Request.Form("dateOnLetter")%>" style="background-color:#CCCCCC;" readonly="readonly" /></td>
            </tr>
            <tr>
            	<td id="alignLeft">Admin: &nbsp;</td>
                <td><input type="text" value="<%=Request.Form("admin")%>" style="background-color:#CCCCCC;" readonly="readonly" /></td>
            </tr>
        </table>
    </form>
    </div>
</div>


<script>
	function setEdit()
	{
		document.frmDetails.action="DetailsFormEdit.asp?Id=<%=(newId)%>";
	}
	function setMain()
	{
		document.frmDetails.action="ExpulsionsIndex.asp"
	}
	
</script>

</body>
</html>