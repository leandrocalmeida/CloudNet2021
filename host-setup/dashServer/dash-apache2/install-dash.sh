#Adjust mime types for apache server
sudo cp /vagrant/host-setup/dashServer/dash-apache2/mime.conf /etc/apache2/mods-available/mime.conf

#install dependencies for dash server
sudo apt-get -y install autoconf automake build-essential checkinstall git libfaac-dev \
libgpac-dev libjack-jackd2-dev libopencore-amrnb-dev libopencore-amrwb-dev \
librtmp-dev libsdl1.2-dev libtheora-dev libva-dev libvdpau-dev libvorbis-dev \
libx11-dev libxfixes-dev pkg-config texi2html zlib1g-dev libass-dev cmake mercurial

#install assembler NASM
cd ffmpeg_sources && \
wget http://www.nasm.us/pub/nasm/releasebuilds/2.13.02/nasm-2.13.02.tar.bz2 && \
tar xjvf nasm-2.13.02.tar.bz2 && \
cd nasm-2.13.02 && \
PATH="$HOME/bin:$PATH" ./configure --prefix="$HOME/ffmpeg_build" --bindir="$HOME/bin" && \
make && \
make install

cd ../../

#install dependencies 
sudo apt-get install yasm libx264-dev libvpx-dev libfdk-aac-dev libmp3lame-dev libopus-dev

#install H.265 video enconder
cd ffmpeg_sources && \
if cd x265_git 2> /dev/null; then hg pull && hg update; else git clone https://bitbucket.org/multicoreware/x265_git.git; fi && \
cd x265_git/build/linux && \
PATH="$HOME/bin:$PATH" cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX="$HOME/ffmpeg_build" -DENABLE_SHARED:bool=off ../../source && \
PATH="$HOME/bin:$PATH" make && \
make install

cd ../

#install ffmpeg
cd ffmpeg_sources && \
wget -O ffmpeg-snapshot.tar.bz2 http://ffmpeg.org/releases/ffmpeg-snapshot.tar.bz2 && \
tar xjvf ffmpeg-snapshot.tar.bz2 && \
cd ffmpeg && \
PATH="$HOME/bin:$PATH" PKG_CONFIG_PATH="$HOME/ffmpeg_build/lib/pkgconfig" ./configure \
  --prefix="$HOME/ffmpeg_build" \
  --pkg-config-flags="--static" \
  --extra-cflags="-I$HOME/ffmpeg_build/include" \
  --extra-ldflags="-L$HOME/ffmpeg_build/lib" \
  --extra-libs="-lpthread -lm" \
  --bindir="$HOME/bin" \
  --enable-gpl \
  --enable-libass \
  --enable-libfdk-aac \
  --enable-libfreetype \
  --enable-libmp3lame \
  --enable-libopus \
  --enable-libtheora \
  --enable-libvorbis \
  --enable-libvpx \
  --enable-libx264 \
  --enable-libx265 \
  --enable-nonfree && \
PATH="$HOME/bin:$PATH" make && \
make install && \
hash -r

#install MP4Box
sudo apt install gpac

#adjust apache and symbol links 
cd /var/www/html && sudo mv index.html index.html.def && \
sudo ln -s /vagrant/videos/ /var/www/html/top10youtube

'''
cd /var/www/html && sudo mv index.html index.html.def && \
sudo ln -s /vagrant/config/dashServer/videos /var/www/html/
'''