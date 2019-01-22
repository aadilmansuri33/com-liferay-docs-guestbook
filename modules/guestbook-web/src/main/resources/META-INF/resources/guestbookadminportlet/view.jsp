<!DOCTYPE script PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="../init.jsp"%>
<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="https://cdn.datatables.net/1.10.7/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.7/css/jquery.dataTables.css">

<h3 align="center"><b>Guestbook</b></h3>
<aui:button-row cssClass="guestbook-admin-buttons">
    <portlet:renderURL var="addGuestbookURL">
        <portlet:param name="mvcPath"  value="/guestbookadminportlet/edit_guestbook.jsp" />
        <portlet:param name="redirect" value="<%= "currentURL" %>" />
    </portlet:renderURL>

    <aui:button onClick="<%= addGuestbookURL.toString() %>" value="Add Guestbook" />
</aui:button-row>

<liferay-ui:search-container total="<%= GuestbookLocalServiceUtil.getGuestbooksCount(scopeGroupId) %>">
    <liferay-ui:search-container-results
        results="<%= GuestbookLocalServiceUtil.getGuestbooks(scopeGroupId, 
            searchContainer.getStart(), searchContainer.getEnd()) %>" />

    <liferay-ui:search-container-row
        className="com.liferay.docs.guestbook.model.Guestbook" modelVar="guestbook">

        <liferay-ui:search-container-column-text property="name" />
        
        <liferay-ui:search-container-column-text property="email" />
        
        <liferay-ui:search-container-column-text property="message" />
        

        <liferay-ui:search-container-column-jsp
            align="center" 
            path="/guestbookadminportlet/guestbook_actions.jsp" />

    </liferay-ui:search-container-row>

    <liferay-ui:search-iterator />
</liferay-ui:search-container>