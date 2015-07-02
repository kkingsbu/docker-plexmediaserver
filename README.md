# Plex Media Server Docker Image for i386 archs

This is a Plex Media Server ([plex.tv](http://plex.tv)) Docker image that lets you easily spin up an instance of Plex Media Server. 

This container is based on the jrarseneau/plexmediaserver container and adapted for the i386 architectures

It currently supports only non PlexPass in the latest image.

## Exposed Volumes

There are three volumes exposed in this Docker that allows some configuration of your Plex instance.

1. **/volumes/plex**: contains the Plex Library and Logs.
2. **/volumes/media**: where your media is held.
3. **/volumes/tmp**: temp folder used by Plex, mostly for transcoding.

There is an assumption that you will store your Plex Library and all your Media on the host running Docker instead of in the image.

## Running the image

*latest* tag:

``sudo docker run --restart always -d --name="plexmediaserver" -h plexmediaserver -v /etc/localtime:/etc/localtime:ro -v <plex_library_folder_on_host>:/volumes/config -v <temp_folder_on_host>:/volumes/tmp -v <media_folder_on_host>:/volumes/media -p 32400:32400 kkingsbu/plexmediaserver-i386``
