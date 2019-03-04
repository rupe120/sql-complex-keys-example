use Sandbox
go

-- Create the unique index to reference from the foreign key
create unique index idx_ItemTypeAssembly_ItemRelation on ItemTypeAssembly (ItemTypeID, Location, SubItemTypeID)

alter table Item drop constraint fk_Item_ItemTypeAssembly
alter table Item add constraint fk_Item_ItemTypeAssembly foreign key (AssemblyItemTypeID, AssemblyLocation, ItemTypeID)
references ItemTypeAssembly (ItemTypeID, Location, SubItemTypeID)
go

-- Fix the item data to allow the foreign key to be created
update Item set
	AssemblyLocation = 1
where
	ItemID = 'Item1'

alter table Item add constraint fk_Item_ItemTypeAssembly foreign key (AssemblyItemTypeID, AssemblyLocation, ItemTypeID)
references ItemTypeAssembly (ItemTypeID, Location, SubItemTypeID)
