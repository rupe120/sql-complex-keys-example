use Sandbox
go

--------------------
-- Add the missing assembly information to Item

alter table Item add 
	AssemblyItemTypeID varchar(10) null,
	AssemblyLocation int null
GO

update Item set
	AssemblyItemTypeID = 'Type3',
	AssemblyLocation = 1
where
	ItemID = 'Item1'

update Item set
	AssemblyItemTypeID = 'Type3',
	AssemblyLocation = 2
where
	ItemID = 'Item2'

alter table Item add constraint fk_Item_ItemTypeAssembly foreign key (AssemblyItemTypeID, AssemblyLocation)
references ItemTypeAssembly (ItemTypeID, Location)
