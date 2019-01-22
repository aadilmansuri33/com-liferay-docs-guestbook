
<%@ include file="../init.jsp"%>
<%
	ResultRow row = (ResultRow) request.getAttribute(WebKeys.SEARCH_CONTAINER_RESULT_ROW);

	Book book = (Book) row.getObject();
%>

<liferay-ui:icon-menu>
	<portlet:actionURL name="deleteBook" var="deleteURL">
		<portlet:param name="bookId"
			value="<%=String.valueOf(book.getBookId())%>" />
	</portlet:actionURL>
	<portlet:actionURL name="viewBook" var="viewURL">
		<portlet:param name="bookId"
			value="<%=String.valueOf(book.getBookId())%>" />
	</portlet:actionURL>
	<portlet:actionURL var="editBookURL" name="viewEdit">
		<portlet:param name="bookId"
			value="<%=String.valueOf(book.getBookId())%>" />
	</portlet:actionURL>
	<liferay-ui:icon image="view" message="View"
		url="<%=viewURL.toString()%>" />
	<liferay-ui:icon image="view" message="Edit"
		url="<%=editBookURL.toString()%>" />
	<liferay-ui:icon-delete image="delete" message="Delete"
		url="<%=deleteURL.toString()%>" />

</liferay-ui:icon-menu>