cd WinUI3_Template_2026\
dotnet publish -p:PublishProfile=NoNativeAOT -p:Configuration=Release_Unpackaged -p:Platform=x64
dotnet publish -p:PublishProfile=NativeAOT -p:Configuration=Release_Unpackaged -p:Platform=x64
pause
