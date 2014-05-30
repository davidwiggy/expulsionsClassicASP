<%
 	sub setSQL()
		Select Case Application("page")
		
			Case "ExpulsionsIndex"
				Application("SQL") = "SELECT SchoolYear FROM dbo_tblYearDates Order By SchoolYear DESC"
				
			Case "SdntLtHearings"
				Application("SQL") = "SELECT dbo_HRGnew.SchoolYear, dbo_HRGnew.HEARING_DA AS Hearing, dbo_HRGnew.HrgOfficer, dbo_HRGnew.SCHINI AS SchoolInit, " &_
								           " dbo_HRGnew.Id, dbo_HRGnew.StuLast, dbo_HRGnew.StuFirst, dbo_HRGnew.Decision, dbo_HRGnew.Decision_D, dbo_HRGnew.OffenseCode " &_
									 "FROM  ((dbo_HRGnew INNER JOIN dbo_tblOffenses ON dbo_HRGnew.OffenseCode = dbo_tblOffenses.OffenseCode) " &_
									       " INNER JOIN dbo_tblSchools ON dbo_HRGnew.SCHINI = dbo_tblSchools.SchoolInit) " &_
										   " INNER JOIN dbo_tblDecision ON dbo_HRGnew.DECISION = dbo_tblDecision.Code " &_
									 "WHERE dbo_HRGnew.SchoolYear = '" & schYear & "' " &_	   
									 "ORDER BY dbo_HRGnew.HEARING_DA DESC, dbo_HRGnew.STULAST, dbo_HRGnew.STUFIRST " 

										   
			Case "DecisionDescriptionFromCodeNum" 
				Application("SQL") = "SELECT dbo_tblDecision.Desc2 FROM dbo_tblDecision WHERE dbo_tblDecision.Code=" & dCode & ""
										   
			Case "OffenseDescriptionFromCodeNum"
				Application("SQL") = "SELECT dbo_tblOffenses.Offense FROM dbo_tblOffenses WHERE dbo_tblOffenses.OffenseCode=" & code & ""
				
			Case "DetailsFormRace"
				Application("SQL") = "SELECT race, code FROM dbo_tblRace ORDER BY race ASC"
				
			Case "DetailsFormSchool"
				Application("SQL") = "SELECT SchoolInit FROM dbo_tblSchools ORDER BY SchoolInit ASC"
				
			Case "DetailsFormSchoolYear"
				Application("SQL") = "SELECT SchoolYear FROM dbo_tblYearDates ORDER BY SchoolYear DESC"
				
			Case "DetailsFormHearingOff"
				Application("SQL") = "SELECT HearingOfficer FROM dbo_tblHearingOfficers ORDER BY HearingOfficer ASC"
				
			Case "DetailsFormDecision"
				Application("SQL") = "SELECT Description FROM dbo_tblDecision ORDER BY Code ASC"
				
			Case "DetailsFormInfraction"
				Application("SQL") = "SELECT Offense FROM dbo_tblOffenses ORDER BY OffenseCode ASC"
				
			Case "DetailsForm"
				Application("SQL") = "SELECT stulast, stufirst, dob, age, grade, sasiid, race, gender, special_ed, title, parfirst, parlast, street, city, zip, reqrec, reenrolldate, " &_
									 "approved, schini, SchoolYear, hrgofficer, hearing_da, time, certltr, decision, offensecode, inf1, inf2, inf3, inf4, note, [APPEAL/DEC], decision_d, admin " &_
									 "FROM dbo_HRGnew " &_
									 "WHERE id =" & id		
									 
			Case "findDecisionCode"
				Application("SQL") = "SELECT code FROM dbo_tblDecision WHERE Description='" & Request.Form("decision") & "'"
			
			Case "findDecisionFromCode"
				Application("SQL") = "SELECT Description FROM dbo_tblDecision WHERE Code=" & rs("decision") 
				
			Case "findInfCode"
				Application("SQL") = "SELECT offensecode FROM dbo_tblOffenses WHERE Offense='" & Request.Form("violationList1") & "'"
				
			Case "findOffenseFromCode"
				Application("SQL") = "SELECT Offense From dbo_tblOffenses WHERE OffenseCode=" & rs("offensecode")
				
			Case "findRaceCode"
				Application("SQL") = "SELECT code FROM dbo_tblRace WHERE race='" & Request.Form("race") & "'"
									 
			Case "AddSdntExpulsions"
				Application("SQL") = "INSERT INTO dbo_HRGnew " &_
					"(stulast, stufirst, dob, age, grade, sasiid, race, gender, special_ed, title, parfirst, parlast, street, city, state, zip, reqrec, approved, " &_
					"schini, schoolyear, hrgofficer, hearing_da, decision, offenseCode, inf1, inf2, inf3, inf4, [appeal/dec], [time], [note], admin) " &_
					"VALUES " &_
					"('" & Request.Form("stuLast")        & "'," &_
					"'"  & Request.Form("stuFirst")       & "'," &_
					"'"  & Request.Form("dob")            & "'," &_
					"'"  & Request.Form("age")            & "'," &_
					"'"  & Request.Form("grade")          & "'," &_
					"'"  & Request.Form("sas")            & "'," &_
					"'"  & raceCode                       & "'," &_
					"'"  & Request.Form("gender")         & "'," &_
					" "  & special                        & " ," &_
					"'"  & Request.Form("title")          & "'," &_
					"'"  & Request.Form("parFirst")       & "'," &_
					"'"  & Request.Form("parLast")        & "'," &_
					"'"  & Request.Form("address")        & "'," &_
					"'"  & Request.Form("city")           & "'," &_
					"'"  & Request.Form("state")          & "'," &_
					"'"  & Request.Form("zip")            & "'," &_
					"'"  & Request.Form("recDate")        & "'," &_									
					" "  & Request.Form("admission")      & " ," &_					
					"'"  & Request.Form("school")         & "'," &_					
					"'"  & Request.Form("schYear")        & "'," &_					
					"'"  & Request.Form("officer")        & "'," &_		
					"#"  & Request.Form("hearingDate")    & "#," &_	
					" "  & decisionCode                   & " ," &_	
					" "  & offCode                        & " ," &_				
					"'"  & Request.Form("violationList1") & "'," &_					
					"'"  & Request.Form("violationList2") & "'," &_					
					"'"  & Request.Form("violationList3") & "'," &_					
					"'"  & Request.Form("violationList4") & "'," &_					
					"'"  & Request.Form("appealNotes")    & "'," &_
					"'"  & schHearTime                    & "'," &_
					"'"  & Request.Form("notes")          & "'," &_
					"'"  & Request.Form("admin")          & "');"		
						
			Case "findInsertedSdntNum"
				Application("SQL") = "SELECT * FROM dbo_HRGnew " &_
				                     "WHERE stuFirst='" & Request.Form("stuFirst")    & "'" &_
									 "AND stuLast   ='" & Request.Form("stuLast")     & "'" &_
									 "AND dob       ='" & Request.Form("dob")         & "'" &_
									 "AND hearing_da=#" & Request.Form("hearingDate") & "#" &_
									 "AND street    ='" & Request.Form("address")     & "'" &_
									 "AND schini    ='" & Request.Form("school")      & "'" &_
									 "AND SchoolYear='" & Request.Form("schYear")     & "'" &_
									 "AND city      ='" & Request.Form("city")        & "'" 
						
			Case "updateNewInsert1"
				Application("SQL") = "UPDATE dbo_HRGnew " &_
								     "SET ReEnrollDate=#" & Request.Form("reEnrollDate") & "#" &_
									 "WHERE ID=" & newId & ""
									 
			Case "updateNewInsert2"
				Application("SQL") = "UPDATE dbo_HRGnew " &_
									 "SET certltr=#" & Request.Form("certLtrDate") & "#" &_
									 "WHERE ID=" & newId & ""
								
			Case "updateNewInsert3"
				Application("SQL") = "UPDATE dbo_HRGnew " &_
									 "SET decision_d=#" & Request.Form("dateOnLetter") & "#" &_
									 "WHERE ID=" & newId & ""

		End Select
		
	End sub	
%>
