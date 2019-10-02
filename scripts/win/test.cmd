@echo off
setlocal ENABLEDELAYEDEXPANSION

REM for %%f in (%*) do (
for %%f in (
    "C:\Data\Projects\EyeContact\Eye-Contact-Experiment-2019.mov"
) do (
    REM %%~nf
    set in_file=%%~f

    REM set out_file=%%~dpf%%~nf-final.mp4
    set out_file=C:\Data\GDrive\Video\FelikZ\EyeContact2019\%%~nf-final.mp4

    echo "!in_file! -> !out_file!"

    REM -ss 00:01:25 -to 00:01:30 ^
    REM -c:a copy ^

    ffmpeg.exe ^
        -y ^
        -i "!in_file!" ^
        -framerate 24 ^
        -b:v 20000k ^
        -c:v libx265 ^
        -c:a copy ^
        -f mp4 ^
        -tune grain ^
        -preset faster ^
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
        -f mp4 ^
        -tune grain ^
        -preset faster ^
        -profile:v main422-10 ^
        -pix_fmt yuv422p10le ^
        -vf scale=in_range=tv:out_range=tv ^
        -colorspace bt709 ^
        -color_range tv ^
        -c:a aac ^
        -b:a 256k ^
        -x265-params pass=2 ^
        "!out_file!"
)

REM shutdown -s -t 1800
