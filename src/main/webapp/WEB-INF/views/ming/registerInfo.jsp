<jsp:useBean id="user" scope="request" type="com.dobby.project.ming.domain.UserDto"/>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%--<% java.util.Date now = new java.util.Date();
  java.sql.Timestamp currentTimestamp = new java.sql.Timestamp(now.getTime());
%>--%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
</head>
<body>
<h1>MBR_NM=${user.MBR_NM}</h1>
<h1>MBR_ID=${user.MBR_ID}</h1>
<h1>PWD=${user.PWD}</h1>
<%--<h1>BD=${user.BD}</h1>--%>
<h1>BD=${paramValues.BD}</h1>
<h1>BD=${paramValues.BD[0]}</h1>
<h1>BD=${paramValues.BD[1]}</h1>
<h1>BD=${paramValues.BD[2]}</h1>
<h1>SEX=${user.SEX}</h1>
<h1>EMAIL=${user.EMAIL}</h1>
<h1>MPNO=${user.MPNO}</h1>
<h1>AGRE_YN=${user.AGRE_YN}</h1>
<%--<h1>AGRE_YN=${paramValues.AGRE_YN}</h1>
<h1>AGRE_YN=${paramValues.AGRE_YN[0]}</h1>
<h1>AGRE_YN=${paramValues.AGRE_YN[1]}</h1>
<h1>AGRE_YN=${paramValues.AGRE_YN[2]}</h1>
<h1>AGRE_YN=${paramValues.AGRE_YN[3]}</h1>
<h1>AGRE_YN=${paramValues.AGRE_YN[4]}</h1>
<h1>AGRE_YN=${paramValues.AGRE_YN[5]}</h1>--%>
<h1>MBR_GRD="웰컴"</h1>
<h1>MBR_TYPE_CD="2"</h1>
<h1>MBR_STUS_CD="1"</h1>
<h1>SNS_YN="N"</h1>
<h1>SUSB_DTM=currentTimestamp</h1>
<h1>MBR_GRD_DTM=currentTimestamp</h1>
</body>
</html>