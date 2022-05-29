del *.bmp
del *.ico

magick convert JavaToolkitIcon.png -define icon:auto-resize=256,64,48,32,16 JavaToolkit.ico
magick convert UninstallIcon.png -define icon:auto-resize=256,64,48,32,16 JavaToolkitUninstall.ico
magick convert JavaToolkitIcon.png -define icon:auto-resize=32 JavaToolkit_32px.ico
magick convert WizardImage.png -resize 355x700^ -gravity center -extent 355x700 -channel RGB -colorspace sRGB -define bmp:format=bmp3 WizardImage797.bmp
magick convert WizardImage.png -resize 355x700^ -gravity center -extent 355x700 -channel RGB -colorspace sRGB -define bmp:format=bmp3 WizardImage700.bmp
magick convert WizardImage.png -resize 328x604^ -gravity center -extent 328x604 -channel RGB -colorspace sRGB -define bmp:format=bmp3 WizardImage604.bmp
magick convert WizardImage.png -resize 273x556^ -gravity center -extent 273x556 -channel RGB -colorspace sRGB -define bmp:format=bmp3 WizardImage556.bmp
magick convert WizardImage.png -resize 246x459^ -gravity center -extent 246x459 -channel RGB -colorspace sRGB -define bmp:format=bmp3 WizardImage459.bmp
magick convert WizardImage.png -resize 192x386^ -gravity center -extent 192x386 -channel RGB -colorspace sRGB -define bmp:format=bmp3 WizardImage386.bmp
magick convert WizardImage.png -resize 164x314^ -gravity center -extent 164x314 -channel RGB -colorspace sRGB -define bmp:format=bmp3 WizardImage314.bmp
