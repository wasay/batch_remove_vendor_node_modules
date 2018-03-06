@echo off
set back=%cd%
set current=back
for /d %%i in (*) do (
	set current=%%i
	echo current variable: "%%i"
	echo "continue?"
	pause
	
	call :cleanup	
)
cd %back%
echo "end of loop"
pause
	
:cleanup
	cd "%current%"
	echo directory: %current%
	IF NOT "%current%" == "" (
		IF NOT "%current%" == "." (
			IF NOT "%current%" == ".." (
				echo "--------"
				
				echo looking for vendor folder
				@RD /S /Q vendor
				echo removing vendor folder
				
				echo looking for node_modules folder
				@RD /S /Q node_modules
				echo removing node_modules folder
				
				echo "--------"
			)
		)
	)
	cd %back%
	goto :eof
