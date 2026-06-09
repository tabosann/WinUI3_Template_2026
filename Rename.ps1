param(
	[Parameter(Mandatory=$true)]
	[string]$ProjectName
)

Get-ChildItem -File | select -ExpandProperty FullName | %{
(Get-Content $_) -replace 'winui3_template_2026',"$ProjectName" | Set-Content $_ -Encoding UTF8
}

Get-ChildItem -Directory -Exclude .git,.jj | Get-ChildItem -File -Recurse | select -ExpandProperty FullName | %{
(Get-Content $_) -replace 'winui3_template_2026',"$ProjectName" | Set-Content $_ -Encoding UTF8
}

Get-ChildItem -Recurse -Filter '*winui3_template_2026*' | %{
$name = $_.Name -replace 'winui3_template_2026',"$ProjectName"
Rename-Item $_.FullName -NewName $name
}
