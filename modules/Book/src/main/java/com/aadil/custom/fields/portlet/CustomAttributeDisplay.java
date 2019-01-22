package com.aadil.custom.fields.portlet;

import com.aadil.custom.fields.model.Book;
import com.liferay.expando.kernel.model.BaseCustomAttributesDisplay;
import com.liferay.portal.kernel.theme.ThemeDisplay;

public class CustomAttributeDisplay extends BaseCustomAttributesDisplay {

	public static final String CLASS_NAME = Book.class.getName();
	@Override
	public String getClassName() {
		// TODO Auto-generated method stub
		return CLASS_NAME;
	}

	@Override
	public String getIconPath(ThemeDisplay themeDisplay) {
		// TODO Auto-generated method stub
		return themeDisplay.getPathThemeImages() + "/common/pages.png";
	}
}
