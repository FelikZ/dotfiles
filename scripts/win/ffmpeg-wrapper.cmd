@echo off
REM 1080p 420 8b h264
REM ffmpeg.exe ^
REM     -y ^
REM     -i "C:\Data\Projects\WGV-1\dnxhr-hq.mov" ^
REM     -framerate 24 ^
REM     -b:v 16000k ^
REM     -c:v h264 ^
REM     -f mp4 ^
REM     -preset medium ^
REM     -profile:v high ^
REM     -pix_fmt yuv420p ^
REM     -filter:v colorspace=all=bt709:irange=pc:range=pc ^
REM     -colorspace bt709 ^
REM     -color_range pc ^
REM     -an ^
REM     -pass 1 ^
REM     NUL
REM ffmpeg.exe ^
REM     -y ^
REM     -i "C:\Data\Projects\WGV-1\dnxhr-hq.mov" ^
REM     -framerate 24 ^
REM     -b:v 16000k ^
REM     -c:v h264 ^
REM     -f mp4 ^
REM     -preset medium ^
REM     -profile:v high ^
REM     -pix_fmt yuv420p ^
REM     -filter:v colorspace=all=bt709:irange=pc:range=pc ^
REM     -colorspace bt709 ^
REM     -color_range pc ^
REM     -c:a aac ^
REM     -b:a 256k ^
REM     -pass 2 ^
REM     C:\Data\Projects\WGV-1\dnxhr-hq-420-8b.mp4

REM 4k 422 10b h264
REM ffmpeg.exe ^
REM     -y ^
REM     -i "C:\Data\Projects\Italy\Italy1-5_444_10b.mov" ^
REM     -framerate 24 ^
REM     -b:v 45000k ^
REM     -c:v h264 ^
REM     -f mp4 ^
REM     -preset medium ^
REM     -profile:v high422 ^
REM     -pix_fmt yuv422p10le ^
REM     -filter:v colorspace=all=bt709:irange=pc:range=pc ^
REM     -colorspace bt709 ^
REM     -color_range pc ^
REM     -an ^
REM     -pass 1 ^
REM     NUL
REM ffmpeg.exe ^
REM     -y ^
REM     -i "C:\Data\Projects\Italy\Italy1-5_444_10b.mov" ^
REM     -framerate 24 ^
REM     -b:v 45000k ^
REM     -c:v h264 ^
REM     -f mp4 ^
REM     -preset medium ^
REM     -profile:v high422 ^
REM     -pix_fmt yuv422p10le ^
REM     -filter:v colorspace=all=bt709:irange=pc:range=pc ^
REM     -colorspace bt709 ^
REM     -color_range pc ^
REM     -c:a aac ^
REM     -b:a 256k ^
REM     -pass 2 ^
REM      C:\Data\Projects\Italy\Italy1-5_422_10b.mp4

REM 4k 422 10b
ffmpeg.exe ^
    -y ^
    -i "C:\Data\Projects\Italy\Night\422_10b.mov" ^
    -framerate 24 ^
    -b:v 20000k ^
    -c:v libx265 ^
    -f mp4 ^
    -tune grain ^
    -preset faster ^
    -profile:v main422-10 ^
    -pix_fmt yuv422p10le ^
    -filter:v colorspace=all=bt709:irange=pc:range=pc ^
    -colorspace bt709 ^
    -color_range pc ^
    -an ^
    -x265-params pass=1 ^
    NUL

ffmpeg.exe ^
    -y ^
    -i "C:\Data\Projects\Italy\Night\422_10b.mov" ^
    -framerate 24 ^
    -b:v 20000k ^
    -c:v libx265 ^
    -f mp4 ^
    -tune grain ^
    -preset faster ^
    -profile:v main422-10 ^
    -pix_fmt yuv422p10le ^
    -filter:v colorspace=all=bt709:irange=pc:range=pc ^
    -colorspace bt709 ^
    -color_range pc ^
    -c:a aac ^
    -b:a 256k ^
    -x265-params pass=2 ^
    C:\Data\Projects\Italy\Night\Baveno_Night_422_10b.mp4

REM 4k 444 10b
REM ffmpeg.exe ^
REM     -y ^
REM     -i "C:\Data\Projects\Italy\Italy1-5_444_10b.mov" ^
REM     -framerate 24 ^
REM     -b:v 20000k ^
REM     -c:v libx265 ^
REM     -f mp4 ^
REM     -tune grain ^
REM     -preset faster ^
REM     -profile:v main444-10 ^
REM     -pix_fmt yuv444p10le ^
REM     -filter:v colorspace=all=bt709:irange=pc:range=pc ^
REM     -colorspace bt709 ^
REM     -color_range pc ^
REM     -an ^
REM     -x265-params pass=1 ^
REM     NUL

REM ffmpeg.exe ^
REM     -y ^
REM     -i "C:\Data\Projects\Italy\Italy1-5_444_10b.mov" ^
REM     -framerate 24 ^
REM     -b:v 20000k ^
REM     -c:v libx265 ^
REM     -f mp4 ^
REM     -tune grain ^
REM     -preset faster ^
REM     -profile:v main444-10 ^
REM     -pix_fmt yuv444p10le ^
REM     -filter:v colorspace=all=bt709:irange=pc:range=pc ^
REM     -colorspace bt709 ^
REM     -color_range pc ^
REM     -c:a aac ^
REM     -b:a 256k ^
REM     -x265-params pass=2 ^
REM     C:\Data\Projects\Italy\Italy1-5_444_10b.mp4

REM 1080p 444 10b
REM ffmpeg.exe ^
REM     -y ^
REM     -i "C:\Data\Projects\Italy\Italy1-5_444_10b.mov" ^
REM     -framerate 24 ^
REM     -b:v 10000k ^
REM     -c:v libx265 ^
REM     -f mp4 ^
REM     -tune grain ^
REM     -preset faster ^
REM     -profile:v main444-10 ^
REM     -pix_fmt yuv444p10le ^
REM     -filter:v colorspace=all=bt709:irange=pc:range=pc ^
REM     -colorspace bt709 ^
REM     -color_range pc ^
REM     -an ^
REM     -x265-params pass=1 ^
REM     NUL

REM ffmpeg.exe ^
REM     -y ^
REM     -i "C:\Data\Projects\Italy\Italy1-5_444_10b.mov" ^
REM     -framerate 24 ^
REM     -b:v 10000k ^
REM     -c:v libx265 ^
REM     -f mp4 ^
REM     -tune grain ^
REM     -preset faster ^
REM     -profile:v main444-10 ^
REM     -pix_fmt yuv444p10le ^
REM     -filter:v colorspace=all=bt709:irange=pc:range=pc ^
REM     -colorspace bt709 ^
REM     -color_range pc ^
REM     -c:a aac ^
REM     -b:a 256k ^
REM     -x265-params pass=2 ^
REM     C:\Data\Projects\Italy\Italy1-5_444_10b.mp4

REM https://trac.ffmpeg.org/wiki/Encode/H.265



REM ffmpeg.exe ^
REM     -y ^
REM     -i "C:\Data\Projects\Zaandam-2\Zaandam-De-Stootersplas-10bit.mov" ^
REM     -framerate 24 ^
REM     -b:v 16000k ^
REM     -c:v h264 ^
REM     -f mov ^
REM     -preset medium ^
REM     -profile:v high ^
REM     -pix_fmt yuv420p ^
REM     -coder 1 ^
REM     -movflags +faststart -g 30 -bf 2 ^
REM     -filter:v colorspace=all=bt709:irange=pc:range=pc,scale=1920:-1 ^
REM     -colorspace bt709 ^
REM     -color_range pc ^
REM     -an ^
REM     -pass 1 ^
REM     NUL
REM ffmpeg.exe ^
REM     -y ^
REM     -i "C:\Data\Projects\Zaandam-2\Zaandam-De-Stootersplas-10bit.mov" ^
REM     -framerate 24 ^
REM     -b:v 16000k ^
REM     -c:v h264 ^
REM     -f mov ^
REM     -preset medium ^
REM     -profile:v high ^
REM     -pix_fmt yuv420p ^
REM     -coder 1 ^
REM     -movflags +faststart -g 30 -bf 2 ^
REM     -filter:v colorspace=all=bt709:irange=pc:range=pc,scale=1920:-1 ^
REM     -colorspace bt709 ^
REM     -color_range pc ^
REM     -c:a aac ^
REM     -b:a 256k ^
REM     -pass 2 ^
REM     1.mov

REM YouTube
REM ffmpeg -i input -c:v libx264 -preset slow -profile:v high -crf 18 -coder 1 -pix_fmt yuv420p -movflags +faststart -g 30 -bf 2 -c:a aac -b:a 384k -profile:a aac_low output

REM     -ss 00:02:00 -to 00:02:10 ^


REM webm -> mp4
REM "C:\Program Files\StaxRip\Apps\Encoders\ffmpeg\ffmpeg.exe" -fflags +genpts -r 24 -i "C:\Users\Home\Downloads\Bmpcc 4k metabones speedbooster vs m43 speedbooster-iEX1hVlbFqg.webm" 1.mp4

REM download audio from youtube
REM youtube-dl -F
REM youtube-dl -f best -x --audio-format wav --audio-quality 0 https://www.youtube.com/watch?v=bllKLAiLo6g
