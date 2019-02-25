--use master
--GO

--Create database Sandbox
--go

-------------------------
-- Build tables and review data
--
-- ItemType         - Types of items that can be created
-- ItemTypeAssembly - How types can be combined into assemblies
-- Item             - Created items and what items were used in what final assemblies 

use Sandbox
go

drop TABLE Item
drop TABLE ItemTypeAssembly
drop TABLE ItemType
go

-------------------------------------
-- Base type of an item to produce
create table ItemType
(
	-- Primary key column
	ItemTypeID varchar(10) primary key,

	-- Attributte column
	ItemTypeDescription varchar(max)
)


-------------------------------------
-- Produced items
create table Item
(
	-- Primary key column
	ItemID varchar(10) primary key,

	-- Attributes column
	ItemTypeID varchar(10) not null,
	ItemDescription varchar(max),
	-- The parent item, if used as part of a larger assembly
	AssemblyItemID varchar(10) null
)

alter table Item add constraint fk_Item_ItemType foreign key (ItemTypeID)
references ItemType (ItemTypeID)

alter table Item add constraint fk_Item_AssemblyItem foreign key (AssemblyItemID)
references Item (ItemID)


-------------------------------------
-- The definition of what types of parts are in larger assembly
create table ItemTypeAssembly
(
	-- Primary key columns
	ItemTypeID varchar(10) not null,
	Location int not null,

	-- Attribute column
	SubItemTypeID varchar(10) not null,

	primary key (ItemTypeID, Location)
)

alter table ItemTypeAssembly add constraint fk_ItemTypeAssembly_ItemType foreign key (ItemTypeID)
references ItemType (ItemTypeID)

alter table ItemTypeAssembly add constraint fk_ItemTypeAssembly_SubItemType foreign key (SubItemTypeID)
references ItemType (ItemTypeID)


-------------------------------------
-- Sample data

insert into ItemType
(
	ItemTypeID,
	ItemTypeDescription
)
values
(
	'Type1',
	'A small item'
),
(
	'Type2',
	'Another small item'
),
(
	'Type3',
	'A larger composite item'
),
(
	'Type4',
	'Another large composite item'
)

insert into ItemTypeAssembly
(
	ItemTypeID,
	Location,
	SubItemTypeID
)
values
(
	'Type3',
	1,
	'Type1'
),
(
	'Type3',
	2,
	'Type2'
),
(
	'Type4',
	1,
	'Type1'
)

insert into Item
(
	ItemID,
	ItemTypeID,
	ItemDescription,
	AssemblyItemID
)
values
(
	'Item3',
	'Type3',
	'An instance of a larger composite type',
	null
),
(
	'Item1',
	'Type1',
	'An instance of a small part',
	'Item3'
),
(
	'Item2',
	'Type2',
	'Another instance of a small part',
	'Item3'
),
(
	'Item4',
	'Type4',
	'Another instance of a large composite type',
	null
),
(
	'Item5',
	'Type1',
	'Another instance of the type1 small part',
	'Item4'
)
