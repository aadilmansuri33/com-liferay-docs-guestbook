package com.liferay.docs.guestbook.portlet.portlet;

import org.osgi.service.component.annotations.Component;

import com.liferay.docs.guestbook.model.Guestbook;
import com.liferay.docs.guestbook.portlet.constants.GuestbookPortletKeys;
import com.liferay.expando.kernel.model.BaseCustomAttributesDisplay;
import com.liferay.expando.kernel.model.CustomAttributesDisplay;

@Component(immediate = true, property = {
		"javax.portlet.name=" + GuestbookPortletKeys.GUESTBOOK }, service = CustomAttributesDisplay.class)
public class CustomFields extends BaseCustomAttributesDisplay {

	@Override
	public String getClassName() {
		// TODO Auto-generated method stub
		return Guestbook.class.getName();
	}
}
