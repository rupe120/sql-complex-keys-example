use Sandbox
go

update Item set
	AssemblyItemTypeID = 'Type4'
where
	ItemID = 'Item1'

-- Can we prevent this?
