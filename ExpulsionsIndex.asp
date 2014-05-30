<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<% DBLink = "ExpulsionsIndex" %>
<!--#include virtual ="connections.asp"-->
<!--#include file="sql.inc"-->
<!--Setting the global varible for the current page-->
<% Application("page")="ExpulsionsIndex" %>
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
<div class="mainMenu">
	<p id="menuHeader">
    	Expulsion Hearings
    </p>
    <form action="" method="post" name="frmIndex" >
    <div id="picHolder">
   		<img id="JudgePic" src="judge-cartoon1.jpg" alt="Judge" />
    </div>
    <table width="100%">
    <tr><td></td>
    	<td id="schoolYear" colspan="100%">
        	School Year:  <select name="schoolYear">
        	<%
            	getYears()
       		%></select>
    	</td>
 	</tr>
    <tr>
    	<td id="alignCenter" colspan="100%">
        	<input id="buttonDesign" type="submit" value="Expulsion Hearings" onclick="setHearings();" style="width:400px; height:50px;"  />
        </td>
    </tr>
    <tr>
        <td id="alignCenter" colspan="100%">
        	<input id="buttonDesign" type="submit" value="Select Students to List" onclick="" style="width:400px; height:50px"  />
        </td>
    </tr>
    <tr>
    	<td id="alignRight">
        	<input id="buttonDesign" type="submit" value="Schools" onclick="" style="width:200px; height:35px;" />
        </td>
        <td id="alignLeft">
        	<input id="buttonDesign" type="submit" value="Offenses" onclick="" style="width:200px; height:35px;" />
        </td>
    </tr>
    <tr>
    	<td id="alignRight">
        	<input id="buttonDesign" type="submit" value="Results" onclick="" style="width:200px; height:35px;"  />
        </td>
        <td id="alignLeft">
        	<input id="buttonDesign" type="submit" value="School Years" onclick="" style="width:200px; height:35px;"  />
        </td>
    </tr>
    <tr>
    	<td id="alignCenter" colspan="100%">
        	<input id="buttonDesign" type="submit" value="Hearing Offices" onclick="" style="width:200px; height:35px;"  />
        </td>
    </tr>
    </form>
	</table>
</div>
<script>
	function setHearings()
	{
		document.frmIndex.action="SdntLtHearings.asp";
	}
</script>

<%
	'This function loads a drop down list with years.
	sub getYears()
		setSQL()
		Dim SQL
		SQL = Application("SQL")
		Dim rs
		Set rs = connection.execute(SQL)

		While Not rs.EOF
		%><option value="<%=rs("SchoolYear")%>"><%=rs("SchoolYear")%></option>
		<%
		rs.MoveNext
		Wend
		
		rs.close
		Set rs = Nothing 
		connection.close
	end sub
%>
</body>
</html>