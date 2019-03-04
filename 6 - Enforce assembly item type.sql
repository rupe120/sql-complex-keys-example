use Sandbox
go

-- Create a unique index on the full assembly information to enforce the assembly structure
create unique index idx_Item_Type on Item (ItemID, ItemTypeID)

alter table Item drop constraint fk_Item_AssemblyItem
alter table Item add constraint fk_Item_AssemblyItem foreign key (AssemblyItemID, AssemblyItemTypeID)
references Item (ItemID, ItemTypeID)
GO

-- Fix the assembly information
update Item set
	AssemblyItemTypeID = 'Type3'
where
	ItemID = 'Item1'

alter table Item add constraint fk_Item_AssemblyItem foreign key (AssemblyItemID, AssemblyItemTypeID)
references Item (ItemID, ItemTypeID)
