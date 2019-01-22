<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>

<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui"%><%@
taglib
	uri="http://liferay.com/tld/portlet" prefix="liferay-portlet"%><%@
taglib
	uri="http://liferay.com/tld/theme" prefix="liferay-theme"%><%@
taglib
	uri="http://liferay.com/tld/ui" prefix="liferay-ui"%>


<%@page import="java.util.List"%>
<%@page import="java.util.Collections"%>
<%@page
	import="com.liferay.expando.kernel.util.ExpandoBridgeFactoryUtil"%>
<%@page import="com.aadil.custom.fields.model.impl.BookImpl"%>
<%@page import="com.liferay.expando.kernel.model.ExpandoBridge"%>
<%@page import="com.aadil.custom.fields.model.Book"%>
<%@page import="com.aadil.custom.fields.service.BookLocalServiceUtil"%>

<%@page import="com.liferay.portal.kernel.util.WebKeys"%>

<%@page import="com.liferay.portal.kernel.dao.search.ResultRow"%>


<%@page import="java.util.List"%>
<%@page import="java.util.Collections"%>
<%@page
	import="com.liferay.expando.kernel.util.ExpandoBridgeFactoryUtil"%>
<%@page import="com.liferay.expando.kernel.model.ExpandoBridge"%>
<%@page import="com.aadil.custom.fields.model.Book"%>
<%@page import="com.aadil.custom.fields.model.impl.BookImpl"%>
<%@page import="com.liferay.portal.kernel.util.ParamUtil"%>

<liferay-theme:defineObjects />

<portlet:defineObjects />