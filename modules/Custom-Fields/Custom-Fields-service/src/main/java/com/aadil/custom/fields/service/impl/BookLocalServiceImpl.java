/**
 * Copyright (c) 2000-present Liferay, Inc. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */

package com.aadil.custom.fields.service.impl;

import com.aadil.custom.fields.model.Book;
import com.aadil.custom.fields.service.base.BookLocalServiceBaseImpl;
import com.liferay.expando.kernel.model.ExpandoRow;
import com.liferay.expando.kernel.model.ExpandoTable;
import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.kernel.model.ClassName;
import com.liferay.portal.kernel.security.auth.CompanyThreadLocal;
import com.liferay.portal.kernel.service.ServiceContext;

/**
 * The implementation of the book local service.
 *
 * <p>
 * All custom service methods should be put in this class. Whenever methods are
 * added, rerun ServiceBuilder to copy their definitions into the
 * {@link com.aadil.custom.fields.service.BookLocalService} interface.
 *
 * <p>
 * This is a local service. Methods of this service will not have security
 * checks based on the propagated JAAS credentials because this service can only
 * be accessed from within the same VM.
 * </p>
 *
 * @author Aadil
 * @see BookLocalServiceBaseImpl
 * @see com.aadil.custom.fields.service.BookLocalServiceUtil
 */
public class BookLocalServiceImpl extends BookLocalServiceBaseImpl {
	/*
	 * NOTE FOR DEVELOPERS:
	 *
	 * Never reference this class directly. Always use {@link
	 * com.aadil.custom.fields.service.BookLocalServiceUtil} to access the book
	 * local service.
	 */

	public Book addCustomBook(Book book, ServiceContext serviceContext) throws PortalException, SystemException {

		long bookId = counterLocalService.increment();
		book.setBookId(bookId);
		book = bookLocalService.addBook(book);
		if (serviceContext != null) {
			book.setExpandoBridgeAttributes(serviceContext);
			book = bookPersistence.update(book);
		}
		return book;
	}

	public void deleteCustomBook(long bookId) throws PortalException, SystemException {

		ClassName className = classNameLocalService.getClassName(Book.class.getName());
		ExpandoTable expandoTable = expandoTableLocalService.getDefaultTable(CompanyThreadLocal.getCompanyId(),
				className.getClassNameId());

		/**
		 * Delete ExpandoRow before deleteting Book Entitity If we delete row,
		 * corresponding values will be also deleted In the below code
		 * expandoRowPersistence.fetchByT_C will return null if there is no row
		 */

		ExpandoRow expandoRow = expandoRowPersistence.fetchByT_C(expandoTable.getTableId(), bookId);

		if (expandoRow != null) {
			expandoRowLocalService.deleteRow(expandoRow);
		}

		bookLocalService.deleteBook(bookId);
	}

	public Book updateCustomBook(Book book, ServiceContext serviceContext) throws PortalException, SystemException {

		book = bookLocalService.updateBook(book);
		if (serviceContext != null) {
			book.setExpandoBridgeAttributes(serviceContext);
			book = bookPersistence.update(book);
		}
		return book;
	}
}