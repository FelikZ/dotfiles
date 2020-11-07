@echo off
setlocal ENABLEDELAYEDEXPANSION

REM Directory NAME matters for the output dir
REM for %%f in (%*) do (
for %%f in (
    "C:\Data\Projects\Utrecht-202008\Source.mov"
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
        -c:a aac ^
        -b:a 320k ^
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

    REM NVENC 2 pass
    REM 4k 422 10b
    REM -ss 00:01:25 -to 00:01:30 ^
    REM ffmpeg.exe ^
    REM     -y ^
    REM     -i "!in_file!" ^
    REM     -framerate 24 ^
    REM     -b:v 20000k ^
    REM     -c:v nvenc_hevc ^
    REM     -f mp4 ^
    REM     -preset medium ^
    REM     -profile:v main ^
    REM     -pix_fmt yuv420p ^
    REM     -colorspace bt709 ^
    REM     -color_range tv ^
    REM     -an ^
    REM     -rc vbr_2pass ^
    REM     -pass 1 ^
    REM     -2pass -1 ^
    REM     "!out_file!"

    REM ffmpeg.exe ^
    REM     -y ^
    REM     -i "!in_file!" ^
    REM     -framerate 24 ^
    REM     -b:v 20000k ^
    REM     -c:v nvenc_hevc ^
    REM     -c:a aac ^
    REM     -b:a 320k ^
    REM     -f mp4 ^
    REM     -preset medium ^
    REM     -profile:v main ^
    REM     -pix_fmt yuv420p ^
    REM     -colorspace bt709 ^
    REM     -color_range tv ^
    REM     -rc vbr_2pass ^
    REM     -pass 2 ^
    REM     -2pass -1 ^
    REM     "!out_file!"
)

REM shutdown -s -t 3600
