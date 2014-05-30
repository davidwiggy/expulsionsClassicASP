<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<% DBLink = "ExpulsionsIndex" %>
<!--#include virtual ="connections.asp"-->
<!--#include file="sql.inc"-->
<!--Setting the global varible for the current page-->
<% Application("page")="DetailsForm" %>
<% Id = Request.QueryString("Id") %>
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
<%
	setSQL()
	Dim rs
	Set rs = connection.execute(Application("SQL"))
%>

<!---------- Starting the Main Menu -------------------------------------------------------------->

<div class="mainMenuForDetailsForm">
	<br />
	<div id="menuHeader">
    	Expulsion Hearings
    </div>
    <br />
	<form action="" method="post" name="frmDetails">
    <div id="alignCenter">
    	<input id="buttonDesign" type="button" value="Edit Student" onclick="setEditAction();" style="width:250px; height:30px;" />
        <input id="buttonDesign" type="button" value="Expulsions List" onclick="setList();" style="width:250px; height:30px;" />
        <input id="buttonDesign" type="button" value="Main Menu" onclick="setMain();" style="width:250px; height:30px;" />
    </div>
    <!--Building the left side to the page with input boxes, drop down list, radio boxes, and checkboxes-->
    <div id="leftContainer" >
    	<span id="instructions">General Student Information</span><br /><br />
    	<table class="tableDetailForm" >
        	<tr >
            	<td style="width:37px;">Last: &nbsp;</td>
                <td style="width:145px;"><input type="text" value="<%=rs("stulast")%>" name="stuLast"  /></td>
            </tr>
            <tr >
            	<td id="alignLeft">First: &nbsp;</td>
                <td><input type="text" value="<%=rs("stufirst")%>" name="stuFirst"  /></td>
            </tr>
            <tr >
            	<td id="alignLeft">DOB: &nbsp;</td>
                <td><input type="text" value="<%=rs("dob")%>" name="dob"  /></td>
            </tr>
            <tr >
            	<td id="alignLeft">Age: &nbsp;</td>
                <td><input type="text" value="<%=rs("age")%>" name="age" /></td>
            </tr>
            <tr >
            	<td>Grade: &nbsp;</td>
                <td><input type="text" value="<%=rs("grade")%>" name="grade" /></td>
            </tr>
            <tr >
            	<td id="alignLeft"> SASIID: &nbsp;</td>
                <td><input type="text" value="<%=rs("sasiid")%>" name="sas"  /></td>
            </tr>
            <tr >
            	<td id="alignLeft">Race: &nbsp;</td>
                <td><select name="race" style="width:145px;"><% setRace() %></select></td>
            </tr>
        </table>
        <table class="tableDetailForm">
        	<tr >
                <td id="alignLeft" style="width:65px;">Gender: &nbsp;</td>
                <td style="width:60px;"><select name="gender" style="width:50px;">
                <% If rs("gender") = "M" Then
                	%><option value="M" selected>M</option><option value="F">F</option><%
				   Else %>
					  <option value="M">M</option><option value="F" selected>F</option></select></td><%
				   End If %>
                <td id="alignLeft" style="width:75px;">Special Ed:</td>
                <td id="alignLeft"><input type="checkbox" class="spEd" name="specialEd" <% If rs("special_ed") = -1 Then %> checked="checked" <% End If %> /></td>
            </tr>
         </table>
		<hr align="left" width="90%"/>
        <table class="tableDetailForm">
        	<tr >
            	<td id="alignLeft" style="width:45px;">Title: &nbsp;</td>
                <td style="width:145px;"><input type="text" value="<%=rs("title")%>" name="title"  /></td>
            </tr>
            <tr >
            	<td id="alignLeft">Parent First: &nbsp;</td>
                <td><input type="text" value="<%=rs("parFirst")%>" name="parFirst" /></td>
            </tr>
            <tr >
            	<td id="alignLeft">Parent Last: &nbsp;</td>
                <td><input type="text" value="<%=rs("parlast")%>" name="parLast"  /></td>
            </tr>
            <tr >
            	<td id="alignLeft">Address: &nbsp;</td>
                <td><input type="text" value="<%=rs("street")%>" name="address"  /></td>
            </tr>
            <tr >
            	<td id="alignLeft">City: &nbsp;</td>
                <td><input type="text" value="<%=rs("city")%>" name="city" /></td>
            </tr>
        </table>
        <table class="tableDetailForm">
        	<tr >
                <td id="alignLeft" style="width:65px;">State: &nbsp;</td>
                <td style="width:50px;"><input type="text" readonly="readonly" value="SC" name="state" style="width:40px;"></select></td>
                <td id="alignLeft" style="width:40px;">Zip: &nbsp;</td>
                <td id="alignLeft"><input type="text" name="zip" value="<%=rs("zip")%>" style="width:60px;" /></td>
            </tr>
         </table>
         <hr align="left" width="90%" />
         <div id="instructions"> Re-Admission Information</div>
         <table class="tableDetailForm">
         	<tr >
            	<td id="alignLeft" >Date Received <br />(In Format MM/DD/YYYY): &nbsp;<br /><br /></td>
                <td><input type="text" value="<%=rs("reqrec")%>" name="recDate" /><br /><br /></td>
            </tr>
            <tr>
            	<td id="alignLeft">Date Student Can Re-Enroll: &nbsp;</td>
                <td><input type="text" value="<%=rs("reenrolldate")%>" name="reEnrollDate" /></td>
            </tr>
         </table>
         <table class="tableDetailForm">
         	<tr>
            	<% If rs("approved") = 1 Then %>
            		<td id="alignLeft" style="width:75px;"><input type="radio" name="admission" value="approved" checked />Approved</td>
                	<td id="alignLeft" style="width:75px;"><input type="radio" name="admission" value="denied"  />Denied</td>
                	<td id="alignLeft" style="width:75px;"><input type="radio" name="admission" value="n/a"  />N/A</td>
                <% ElseIf rs("approved") = 2 Then %>
                    <td id="alignLeft" style="width:75px;"><input type="radio" name="admission" value="approved" />Approved</td>
                	<td id="alignLeft" style="width:75px;"><input type="radio" name="admission" value="denied" checked  />Denied</td>
                	<td id="alignLeft" style="width:75px;"><input type="radio" name="admission" value="n/a"  />N/A</td>
                <% Else %>
                	<td id="alignLeft" style="width:75px;"><input type="radio" name="admission" value="approved" />Approved</td>
                	<td id="alignLeft" style="width:75px;"><input type="radio" name="admission" value="denied"  />Denied</td>
                	<td id="alignLeft" style="width:75px;"><input type="radio" name="admission" value="n/a" checked />N/A</td> 
                <% End If %>
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
                <td><input type="text" value="<%=rs("Hearing_da")%>" name="date"  /></td>
            </tr>
            <tr>
            	<td id="alignLeft">Time: &nbsp;</td>
                <td><input type="text" value="<%=rs("time")%>" name="time"  /></td>
            </tr>
            <tr>
            	<td id="alignLeft">Certified Letter Date: &nbsp; </td>
                <td><input type="text" value="<%=rs("certltr")%>" name="certLtrDate" /></td>
            </tr>
            <tr>
            	<td id="alignLeft">Decision: &nbsp;</td>
                <td><select name="decision" style="min-width:150px;"><% setDecision() %></select></td>
            </tr>
        </table>
        <hr align="right" width="100%" />
        <table class="tableDetailForm">
    		<tr>
            	<td id="alignLeft" bgcolor="#FF0000"  style="width:80px;">Infraction: &nbsp;</td>
                <td><select name="violation" style="width:200px; background-color:#FF0000"><% setInfraction() %></select></td>
            </tr>
        </table>
        <table class="tableDetailForm">
        	<tr>
            	<td id="alignCenter" style="width:20px;">1. &nbsp;</td>
                <td><textarea name="violationList1" style="resize:none; min-width:250px; max-height:30px;" readonly="readonly" ><%=rs("inf1")%></textarea></td>
            </tr>
          	<tr>
            	<td id="alignCenter" style="width:20px;">2. &nbsp;</td>
                <td><textarea name="violationList2" style="resize:none; min-width:250px; max-height:30px;"  readonly="readonly" ><%=rs("inf2")%></textarea></td>
            </tr>
          	<tr>
            	<td id="alignCenter" style="width:20px;">3. &nbsp;</td>
                <td><textarea name="violationList3" style="resize:none; min-width:250px; max-height:30px;"  readonly="readonly" ><%=rs("inf3")%></textarea></td>
            </tr>
           	<tr>
            	<td id="alignCenter" style="width:20px;">4. &nbsp;</td>
                <td><textarea name="violationList4" style="resize:none; min-width:250px; max-height:30px;"  readonly="readonly" ><%=rs("inf4")%></textarea></td>
            </tr>
        </table>
        <table class="tableDetailForm">
        	<tr>
            	<td id="alignLeft">Notes: &nbsp;</td>
            </tr>
            <tr>
            	<td id="alignLeft"><textarea name="notes" style="width:300px; height:80px; resize: "><%=rs("note")%></textarea></td>
            </tr>
            <tr>
            	<td id="alignLeft">Appeal/Dec: &nbsp;</td>
            </tr>
            <tr>
            	<td id="alignLeft"><textarea name="appealNotes" style="width:300px; height:50px; resize: "><%=rs("APPEAL/DEC")%></textarea></td>
            </tr>
        </table>
        <table class="tableDetailForm">
        	<tr>
            	<td id="alignLeft" style="width: 140px;">Decision Date on Letter: &nbsp;</td>
                <td><input type="text" value="<%=rs("decision_d")%>" name="dateOnLetter"  value="<%=rs("decision_d")%>"/></td>
            </tr>
            <tr>
            	<td id="alignLeft">Admin: &nbsp;</td>
                <td><input type="text" value="<%=rs("admin")%>" name="admin"  /></td>
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
</script>

<% 
	'Setting the race drop down list	
	sub setRace()
		Application("page") = "DetailsFormRace"
		setSQL()
		Dim rsRace
		Set rsRace = connection.execute(Application("SQL"))
		Dim race
		race = rs("race")
			
		While Not rsRace.EOF
			tempRace = rsRace("code")
			If race = tempRace Then
				%><option value="<%Response.Write(rsRace("race"))%>" selected><%Response.Write(rsRace("race"))%></option><%
			Else
				%><option value="<%Response.Write(rsRace("race"))%>"><%Response.Write(rsRace("race"))%></option><%
			End If
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
		Application("page") = "DetailsForm"
		currentSchool=rs("schini")
		
		While Not rsSchool.EOF
			tempSch = rsSchool("SchoolInit")
			%><%If currentSchool = tempSch Then %><option value="<%Response.Write(tempSch)%>" selected><%Response.Write(tempSch)%></option><%
			    Else%><option value="<%Response.Write(tempSchool)%>"><%Response.Write(tempSch)%></option><%
				End If
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
		Application("page") = "DetailsForm"
		currentYear = rs("schoolYear")
		
		While Not rsSchYear.EOF
			tempYear = rsSchYear("SchoolYear")
			If currentYear = tempYear Then
			%><option value="<%Response.Write(rsSchYear("SchoolYear"))%>" selected><%Response.Write(rsSchYear("SchoolYear"))%></option><%
			Else%><option value="<%Response.Write(rsSchYear("SchoolYear"))%>"><%Response.Write(rsSchYear("SchoolYear"))%></option><%
			End If
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
		Application("page") = "DetailsForm"
		currentOfficer = rs("HrgOfficer")
		
		While Not rsOfficer.EOF
			tempOfficer = rsOfficer("HearingOfficer")
			If currentOfficer = tempOfficer Then
			%><option value="<%Response.Write(rsOfficer("HearingOfficer"))%>" selected><%Response.Write(rsOfficer("HearingOfficer"))%></option><%
			Else%><option value="<%Response.Write(rsOfficer("HearingOfficer"))%>"><%Response.Write(rsOfficer("HearingOfficer"))%></option><%
			End If
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
		Application("page") = "DetailsForm"
		
		Application("page") = "findDecisionFromCode"
		setSQL()
		Dim rsCurrentDecision
		Set rsCurrentDecision = connection.execute(Application("SQL"))
		currentD = rsCurrentDecision("Description")
		rsCurrentDecision.close
		Set rsCurrentDecision = Nothing
		
		While Not rsDecision.EOF
			tempD = rsDecision("Description")
			If currentD = tempD Then
			%><option value="<%Response.Write(rsDecision("Description"))%>" selected><%Response.Write(rsDecision("Description"))%></option><%
			Else%><option value="<%Response.Write(rsDecision("Description"))%>"><%Response.Write(rsDecision("Description"))%></option><%
			End If
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
		Application("page") = "DetailsForm"
		
		Application("page") = "findOffenseFromCode"
		setSQL()
		Dim rsOff
		Set rsOff = connection.execute(Application("SQL"))
		currentOff = rsOff("offense")
		rsOff.close
		Set rsOff = Nothing
		
		While Not rsInfraction.EOF 
			tempOff = rsInfraction("Offense")
			If currentOff = tempOff Then
			%><option value="<%Response.Write(rsInfraction("Offense"))%>" selected><%Response.Write(rsInfraction("Offense"))%></option><%
			Else%><option value="<%Response.Write(rsInfraction("Offense"))%>"><%Response.Write(rsInfraction("Offense"))%></option><%
			End If
			rsInfraction.MoveNext
		Wend
		rsInfraction.close
		Set rsInfraction = Nothing
	End sub
%>

</body>
</html>