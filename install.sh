LIBDIR="/usr/local/share"
BASEDIR=$(dirname "$BASH_SOURCE")

if [ "$EUID" -ne 0 ]
then
  echo "Please run as root."
  exit 1
fi

if [ -d "$LIBDIR/projectgenerator/" ]
then
  echo "Project generator has already been installed on your system."
  exit 1
fi

mkdir "$LIBDIR/projectgenerator/"
echo "Created lib folder."
mkdir "$LIBDIR/projectgenerator/templates/"
cp -r "$BASEDIR/templates/" "$LIBDIR/projectgenerator/templates/"
echo "Added templates to lib folder."

<<man
if [ ! -d "$LIBDIR/man/man1" ]
then
  mkdir "$LIBDIR/man/man1"
  echo "Created man directory."
fi
cp "$BASEDIR/generate.sh.1" "$LIBDIR/man/man1/"
echo "Added man file."
man