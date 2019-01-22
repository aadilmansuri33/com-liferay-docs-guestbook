<%@page import="com.aadil.custom.fields.util.WebKeys"%>
<%@ include file="../init.jsp"%>

<%
	Book book = (Book) request.getAttribute(WebKeys.BOOK);
	ExpandoBridge expandoBridge = ExpandoBridgeFactoryUtil.getExpandoBridge(themeDisplay.getCompanyId(),
			Book.class.getName(), book.getBookId());

	List<String> attributeList = Collections.list(expandoBridge.getAttributeNames());
%>

<portlet:renderURL windowState="normal" var="backURL">
	<portlet:param name="jspPage" value="/html/view.jsp"></portlet:param>
</portlet:renderURL>

<portlet:actionURL name="updateBook" var="updateBookURL" />

<liferay-ui:header backURL="<%=backURL%>" title="Back" />


<aui:form name="fm" method="post"
	action="<%=updateBookURL.toString()%>">
	<aui:model-context bean="<%=book%>" model="<%=Book.class%>" />
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
		<aui:button name="updateBook" type="submit" value="Update Book" />
	</aui:button-row>

</aui:form>