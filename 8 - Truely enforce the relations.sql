
-- Null values can be rejected with constraints

alter table Item add constraint chk_assemblyitem_missing_assemblyitemtype check
(AssemblyItemID is null or (AssemblyItemID is not null and AssemblyItemTypeID is not null))
GO

alter table Item add constraint chk_assemblylocation_missing_assemblyitemtype check
(AssemblyLocation is null or (AssemblyLocation is not null and AssemblyItemTypeID is not null))
go

update i SET
    AssemblyItemTypeID = a_i.ItemTypeID
from
    Item i
    inner join Item a_i
        on a_i.ItemID = i.AssemblyItemID
GO

alter table Item add constraint chk_assemblyitem_missing_assemblyitemtype check
(AssemblyItemID is null or (AssemblyItemID is not null and AssemblyItemTypeID is not null))
GO

update Item set
    AssemblyItemID = 'Item3',
	AssemblyItemTypeID = 'Type3',
	AssemblyLocation = 1
where
	ItemID = 'Item1'
GO

alter table Item add constraint chk_assemblylocation_missing_assemblyitemtype check
(AssemblyLocation is null or (AssemblyLocation is not null and AssemblyItemTypeID is not null))
go
