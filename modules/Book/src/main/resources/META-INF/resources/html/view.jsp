
<%@page import="javax.portlet.WindowState"%>

<%@ include file="../init.jsp"%>


<portlet:renderURL var="viewaddPageURL">
	<portlet:param name="jspPage" value="/html/add_book.jsp" />
</portlet:renderURL>

<a href="<%=viewaddPageURL.toString()%>">Add Book</a>

<liferay-ui:success key="added-book" message="Book Added Successfully" />
<liferay-ui:success key="deleted-book"
	message="Book Deleted Successfully" />
<liferay-ui:success key="updated-book"
	message="Book Updated Successfully" />

<%-- <liferay-ui:search-container total="<%= BookLocalServiceUtil.getBooksCount() %>">
	<liferay-ui:search-container-results
		results="<%= BookLocalServiceUtil.getBooks(searchContainer.getStart(), searchContainer.getEnd()) %>"  />
	<liferay-ui:search-container-row
		className="com.aadil.custom.fields.model.Book" modelVar="aBook">

		<liferay-ui:search-container-column-text property="author"
			name="Author" />

		<liferay-ui:search-container-column-text property="bookName"
			name="Book Name" />

		<liferay-ui:search-container-column-jsp path="/html/action.jsp"
			align="right" />


	</liferay-ui:search-container-row>

	<liferay-ui:search-iterator />
</liferay-ui:search-container> --%>