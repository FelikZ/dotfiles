@echo off
setlocal ENABLEDELAYEDEXPANSION

REM Directory NAME matters for the output dir
REM for %%f in (%*) do (
for %%f in (
    "C:\Data\Projects\Italy\Video4\Source.mov"
) do (
    REM %%~nf
    set in_file=%%~f

    for %%a in (%%~f) do for %%b in ("%%~dpa\.") do set "parent=%%~nxb"

    set out_dir=C:\Data\GDrive\Video\FelikZ\!parent!

    echo.
    echo Creating "!out_dir!"
    mkdir "!out_dir!"

    set out_file=!out_dir!\%%~nf-final.mp4

    echo.
    echo Writting
    echo ** !in_file!
    echo ++ !out_file!

    REM -ss 00:01:25 -to 00:01:30 ^
    REM -c:a aac ^
    REM -b:a 256k ^

    ffmpeg.exe ^
        -y ^
        -i "!in_file!" ^
        -framerate 24 ^
        -b:v 20000k ^
        -c:v libx265 ^
        -c:a copy ^
        -f mp4 ^
        -tune grain ^
        -preset medium ^
        -profile:v main422-10 ^
        -pix_fmt yuv422p10le ^
        -vf scale=in_range=tv:out_range=tv ^
        -colorspace bt709 ^
        -color_range tv ^
        -an ^
        -x265-params pass=1 ^
        NUL

    ffmpeg.exe ^
        -y ^
        -i "!in_file!" ^
        -framerate 24 ^
        -b:v 20000k ^
        -c:v libx265 ^
        -c:a copy ^
        -f mp4 ^
        -tune grain ^
        -preset medium ^
        -profile:v main422-10 ^
        -pix_fmt yuv422p10le ^
        -vf scale=in_range=tv:out_range=tv ^
        -colorspace bt709 ^
        -color_range tv ^
        -x265-params pass=2 ^
        "!out_file!"
)

REM shutdown -s -t 3600
