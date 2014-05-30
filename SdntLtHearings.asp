<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<% DBLink = "ExpulsionsIndex" %>
<!--#include virtual ="connections.asp"-->
<!--#include file="sql.inc"-->
<!--Setting the global varible for the current page-->
<% Application("page")="SdntLtHearings" %>
<% 
	schYear = Request.Form("schoolYear")
%>

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
<body onload="wait();">
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

<div id="menuHeader">
    Expulsion Hearings
</div>
<form action="DetailsFormAdd.asp" method="post" name="frmList">
<div id="instructions">
    To view student details click on their Id number Or to add a new student Click HERE 

		<input type="submit" value="Add New Student" id="buttonDesign" style="width:200px; height:30px;" />
    </form>
</div>
	<%
		setSQL()
		Dim SQL
		SQL = Application("SQL")
		Dim rs
		Set rs = connection.execute(SQL)	
	%>
    

<table class="tableList" border="1" >
	<th>School Year</th><th>Hearing</th><th>Officer</th><th>School</th><th>Id</th><th>Last Name</th><th>First Name</th><th>Hearing Result</th><th>Hearing Date</th><th>Offense</th>
	

    <%while not rs.eof%>
        <tr>
     		<td><%=rs("SchoolYear")%></td>
            <td><%=rs("Hearing")   %></td>
            <td><%=rs("HrgOfficer")%></td>
            <td><%=rs("SchoolInit")%></td>
            <td><A HREF="DetailsFormEdit.asp?Id=<%=rs("Id")%>"</A>
            	<%=rs("Id")%></td>
            <td><%=rs("StuLast")   %></td>
            <td><%=rs("StuFirst")  %></td>
            <td><% dCode = rs("Decision")  
				   setDecision()   %></td>
            <td><%=rs("Decision_D")%></td>
            <td><% code = rs("OffenseCode")
				   setOffense()    %></td>
        
       
        <%rs.movenext%>
        </tr>
    <%wend%>
	<%
		rs.close
		Set rs = Nothing 
		connection.close
    %>
    
</table>  
</form>
<%
	sub setDecision()
		Application("page") = "DecisionDescriptionFromCodeNum"
		setSQL()
		Dim rsDecision
		Set rsDecision = connection.execute(Application("SQL"))
		Response.Write(rsDecision("Desc2"))
		Application("page") = "SdntLtHearings"
		rsDecision.close
		Set rsDecision = Nothing
	End sub
	
	sub setOffense()
		Application("page") = "OffenseDescriptionFromCodeNum"
		setSQL()
		Dim rsOffense
		Set rsOffense = connection.execute(Application("SQL"))
		Response.Write(rsOffense("Offense"))
		Application("page") = "SdntLtHearings"
		rsOffense.close
		set rsOffense = Nothing
	End sub
%>

</body>
</html>