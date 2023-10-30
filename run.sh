make clean
sudo docker run --rm -it -v ${PWD}:/gba aaaronic/gba-compiler:1.2
mgba-qt Project.gba
# cp Project.gba /home/ubuntu-4/Desktop/