<%-- 
    Document   : suggestJSON
    Created on : 12-giu-2019, 16.08.15
    Author     : Gianluca
--%>

<%@page contentType="application/json" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="json" uri="http://www.atg.com/taglibs/json"%>

<json:array>
    <c:forEach var="autoriFound" items="${autoriList}">
        <json:object>
            <json:property name="nome" value="${autoriFound.getNome()}"/>
            <json:property name="cognome" value="${autoriFound.getCognome()}"/>
            <json:property name="id" value="${autoriFound.getId()}"/>
        </json:object>
    </c:forEach>
</json:array>