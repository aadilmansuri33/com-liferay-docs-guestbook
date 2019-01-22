create index IX_F1E37075 on custom_Book (bookId);
create index IX_916049D1 on custom_Book (uuid_[$COLUMN_LENGTH:75$], companyId);
create unique index IX_17631093 on custom_Book (uuid_[$COLUMN_LENGTH:75$], groupId);