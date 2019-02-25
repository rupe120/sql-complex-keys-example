use Sandbox
go

-- Null values are allowed in foreign keys

update Item set
	AssemblyItemTypeID = null
where
	ItemID = 'Item1'

update Item set 
	AssemblyItemID = 'Item4'
where
	ItemID = 'Item1'