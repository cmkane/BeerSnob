# Set up PATH for AWS CLI
source ~/.profile

# Take pic for both cameras after 5 second sleep
sleep 5
while [ ! -f "image.jpg" ]
      do
	  fswebcam -d /dev/video0 --no-banner image.jpg
done

fswebcam -d /dev/video1 --no-banner -r 1920x1080 image2.jpg

# Rename files for check
mv image.jpg SmallCamDoor.jpg
mv image2.jpg BigCamTop.jpg

# Upload image files to S3
aws s3 cp "/home/pi/CamImages/SmallCamDoor.jpg" s3://iotminifridge-userfiles-mobilehub-456530050/public/
aws s3 cp "/home/pi/CamImages/BigCamTop.jpg" s3://iotminifridge-userfiles-mobilehub-456530050/public/
