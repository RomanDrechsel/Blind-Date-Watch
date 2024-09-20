import sys
import os
import subprocess

def checkSize(fontfile, fontsize, maxheight, codepoints, prefix):
    startheight = 64
    width = maxheight
    step = 4

    tmp = "./tmp"

    if os.path.exists(tmp):
        p = subprocess.Popen("rm -rf " + tmp, stdout=subprocess.PIPE, shell=True)
        (output, err) = p.communicate()

    os.mkdir(tmp)


    height = startheight

    best_size = None
    best_height = None

    while height <= maxheight:
        output = os.path.join(tmp, "tmpfile_" + str(height))

        params = "--font-file=\"" + fontfile + "\" \
--output=\"" + output + "\" \
--font-size=" + str(fontsize) + " \
--chars=\"" + codepoints + "\" \
--texture-size=" + str(width) + "x" + str(height) + " \
--texture-crop-width \
--texture-crop-height \
--color=255,255,255 \
--background-color=0,0,0 \
--data-format=txt \
--kerning-pairs=regular \
--padding-up=0 \
--padding-right=0 \
--padding-down=0 \
--padding-left=0 \
--extra-info \
--texture-name-suffix=index \
--max-texture-count 1"

        p = subprocess.Popen("/mnt/zusatz/Coding/Tools/FontBM/fontbm " + params, stdout=subprocess.PIPE, shell=True)
        (output, _) = p.communicate()

        # optimize
        for file in os.scandir(tmp):
            if file.is_file():
                _, ext = os.path.splitext(file.path)
                if ext == ".png":
                    p = subprocess.Popen("optipng -o7 -preserve -quiet " + file.path , stdout=subprocess.PIPE, shell=True)
                    (output, _) = p.communicate()

        # get size difference
        size = 0
        for file in os.scandir(tmp):
            if file.is_file():
                _, ext = os.path.splitext(file.path)
                if ext == ".png":
                    size += os.stat(file.path).st_size
                p = subprocess.Popen("rm " + file.path, stdout=subprocess.PIPE, shell=True)
                (output, _) = p.communicate()



        #print(prefix + "Checked " + fontfile + " (" + str(fontsize) + "): " + str(width) + "x" + str(height) + ": " + str(size) + " bytes")

        if size > 0:
            if best_size == None or best_size > size:
                best_height = height
                best_size = size

        height += step

    if os.path.exists(tmp):
        p = subprocess.Popen("rm -rf " + tmp, stdout=subprocess.PIPE, shell=True)
        (output, err) = p.communicate()

    #print(prefix + "Found best Size " + str(width) + "x" + str(best_height) + " with " + str(best_size) + " bytes")
    return width, best_height

param1 = sys.argv[1]
param2 = int(sys.argv[2])
param3 = int(sys.argv[3])
param4 = sys.argv[4]
if len(sys.argv) > 5:
    param5 = sys.argv[5]
else:
    param5 = ""

width, height = checkSize(param1, param2, param3, param4, param5)

print(str(width) + " " + str(height))
