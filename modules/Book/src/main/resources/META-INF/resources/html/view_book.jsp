
<%@page import="com.aadil.custom.fields.util.WebKeys"%>
<%@ include file="../init.jsp"%>

<portlet:renderURL var="backURL">
	<portlet:param name="jspPage" value="/html/view.jsp" />
</portlet:renderURL>

<liferay-ui:header backURL="<%=backURL%>" title="Back" />

<%
	Book book = (Book) request.getAttribute(WebKeys.BOOK_ENTRY);
	ExpandoBridge expandoBridge = ExpandoBridgeFactoryUtil.getExpandoBridge(themeDisplay.getCompanyId(),
			Book.class.getName(), book.getBookId());

	List<String> attributeList = Collections.list(expandoBridge.getAttributeNames());
%>


<aui:form>
	<aui:model-context bean="<%=book%>" model="<%=Book.class%>" />
	<aui:input name="bookName" label="Book Name" disabled="true" />
	<aui:input name="author" label="Author Name" disabled="true" />

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
			editable="<%=false%>" label="<%=true%>" />
	</liferay-ui:custom-attributes-available>
</aui:form>

