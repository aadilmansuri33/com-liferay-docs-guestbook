<%@page import="java.util.Collections"%>
<%@page import="com.liferay.expando.kernel.util.ExpandoBridgeFactoryUtil"%>
<%@page import="com.liferay.expando.kernel.model.ExpandoBridge"%>
<%@include file="../init.jsp"%>

<%
	long guestbookId = ParamUtil.getLong(request, "guestbookId");

	Guestbook guestbook = null;

	List<String> list;
	if (guestbookId > 0) {
		guestbook = GuestbookLocalServiceUtil.getGuestbook(guestbookId);
		ExpandoBridge expandoBridge = ExpandoBridgeFactoryUtil.getExpandoBridge(themeDisplay.getCompanyId(),
				Guestbook.class.getName(),guestbook.getGuestbookId());
		 list = Collections.list(expandoBridge.getAttributeNames());
	}
	else{ ExpandoBridge expandoBridge = ExpandoBridgeFactoryUtil.getExpandoBridge(themeDisplay.getCompanyId(),
			Guestbook.class.getName());
		 list = Collections.list(expandoBridge.getAttributeNames());
	}
%>

<portlet:renderURL var="viewURL">
	<portlet:param name="mvcPath" value="/guestbookadminportlet/view.jsp" />
</portlet:renderURL>

<portlet:actionURL
	name='<%=guestbook == null ? "addGuestbook" : "updateGuestbook"%>'
	var="editGuestbookURL" />

<aui:form action="<%=editGuestbookURL%>" name="fm">

	<aui:model-context bean="<%=guestbook%>" model="<%=Guestbook.class%>" />

	<aui:input type="hidden" name="guestbookId"
		value='<%=guestbook == null ? "" : guestbook.getGuestbookId()%>' />

	<aui:fieldset>
		<aui:input name="name" />
		<aui:input name="email" />
		<aui:input name="message" />
	</aui:fieldset>
	<liferay-ui:asset-categories-error />
	<liferay-ui:asset-tags-error />
	<liferay-ui:panel defaultState="closed" extended="<%=false%>"
		id="guestbookCategorizationPanel" persistState="<%=true%>"
		title="categorization">
		<aui:fieldset>
			<aui:input name="categories" type="assetCategories" />

			<aui:input name="tags" type="assetTags" />
		</aui:fieldset>
	</liferay-ui:panel>
		<%if(list.size()!=0) {%>
		<liferay-ui:panel defaultState="closed" extended="<%=false%>"
		id="customFieldsPanel" persistState="<%=true%>"
		title="custom fields">
		<liferay-ui:custom-attributes-available
		className="<%=Guestbook.class.getName()%>">
		<aui:fieldset collapsed="<%= true %>" collapsible="<%= true %>" label="custom-fields">
		<liferay-ui:custom-attribute-list
			classPK="<%=(guestbook != null) ? guestbook.getGuestbookId() : 0%>"
			className="<%=Guestbook.class.getName() %>" editable="<%=true %>" label="<%=true %>" />
			</aui:fieldset>
		</liferay-ui:custom-attributes-available>
		</liferay-ui:panel>
	<%} %>
	<liferay-ui:panel defaultState="closed" extended="<%=false%>"
		id="guestbookAssetLinksPanel" persistState="<%=true%>"
		title="related-assets">
		<aui:fieldset>
			<liferay-ui:input-asset-links
				className="<%=Guestbook.class.getName()%>"
				classPK="<%=guestbookId%>" />
		</aui:fieldset>
	</liferay-ui:panel>
	<aui:button-row>
		<aui:button type="submit" />
		<aui:button onClick="<%= viewURL.toString() %>" type="cancel" />
	</aui:button-row>
</aui:form>
