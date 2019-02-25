use Sandbox
go

update Item set
	AssemblyLocation = 2
where
	ItemID = 'Item1'

-- What is missing to enforce the assembly relation?
