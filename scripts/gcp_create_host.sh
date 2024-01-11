echo "Creating a Google Cloud Instance"

gcloud compute instances create mct1 --image-family=debian-12 --image-project=debian-cloud --machine-type=g1-small --zone  australia-southeast1-a


