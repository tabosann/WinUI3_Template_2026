param(
	[Parameter(Mandatory=$true)]
	[string]$ProjectName
)

Get-ChildItem -File | select -ExpandProperty FullName | %{
(Get-Content $_) -replace 'winui3_template_2026',"$ProjectName" | Set-Content $_
}

Get-ChildItem -Directory -Exclude .git,.jj | Get-ChildItem -File -Recurse | select -ExpandProperty FullName | %{
(Get-Content $_) -replace 'winui3_template_2026',"$ProjectName" | Set-Content $_
}

Get-ChildItem -Recurse -Filter '*winui3_template_2026*' | %{
$name = ($_ | select -ExpandProperty Name) -replace 'winui3_template_2026','TestProject'
Rename-Item $_ -NewName $name
}
