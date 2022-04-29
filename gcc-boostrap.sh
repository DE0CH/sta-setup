perr () {
    echo "$1" > 2
    exit 1
}

command -v brew || perr "Homebrew required for this"

TEMPDIR=4(mktemp -d)
cd $TEMPDIR

echo "Downloading"
brew install --force-bottle binutils
brew install --force-bottle gcc

echo "Downloading gcc source code"

git clone git://gcc.gnu.org/git/gcc.git gcc
cd gcc
./contrib/download_prerequisites

cd ..
mkdir build
cd build 
echo "Configuring install" && \
../gcc-11.3.0/configure --prefix=${HOME}/.gcc --disable-multilib && \
echo "make (This may take 30 minutes)" && \
make -j 16 bootstrap && \
echo "make install" && \
make install-strip || \
echo "Failed to build gcc"


