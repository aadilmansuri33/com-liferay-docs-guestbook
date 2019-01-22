<%@ include file="../init.jsp"%>
<%
	Book book = new BookImpl();

	ExpandoBridge expandoBridge = ExpandoBridgeFactoryUtil.getExpandoBridge(themeDisplay.getCompanyId(),
			Book.class.getName());

	List<String> attributeList = Collections.list(expandoBridge.getAttributeNames());
%>

<portlet:actionURL name="addBook" var="addBookURL" />

<portlet:renderURL windowState="normal" var="backURL">
	<portlet:param name="jspPage" value="/html/view.jsp"></portlet:param>
</portlet:renderURL>

<liferay-ui:header backURL="<%=backURL%>" title="Back" />


<aui:form name="fm" action="<%=addBookURL.toString()%>" method="post">

	<aui:input name="bookName" label="Book Name" />
	<aui:input name="author" label="Author Name" />
	<%
		if (attributeList.size() != 0) {
	%>

	<liferay-ui:header title="Custom Fields" />

	<%
		}
	%>

	<liferay-ui:custom-attributes-available
		className="<%=Book.class.getName()%>">
		<liferay-ui:custom-attribute-list
			className="<%=Book.class.getName()%>"
			classPK="<%=(book != null) ? book.getBookId() : 0%>"
			editable="<%=true%>" label="<%=true%>" />
	</liferay-ui:custom-attributes-available>

	<aui:button-row>
		<aui:button name="addBook" type="submit" value="Add Book" />
	</aui:button-row>

</aui:form>