package com.aadil.custom.fields.util;

import javax.portlet.ActionRequest;

import com.aadil.custom.fields.model.Book;
import com.aadil.custom.fields.model.impl.BookImpl;
import com.liferay.portal.kernel.util.ParamUtil;

public class ActionUtil {

	public static Book bookFromRequest(ActionRequest request) {
		Book book = new BookImpl();
		book.setAuthor(ParamUtil.getString(request, "authorName", ""));
		book.setBookName(ParamUtil.getString(request, "bookName", ""));
		return book;
	}
}
