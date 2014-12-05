# Plex Media Server Docker Image

This is a Plex Media Server ([plex.tv](http://plex.tv)) Docker image that contains lets you easily spin up an instance of Plex Media Server. 

It contains two tags:

1. ``latest``: regular version (non PlexPass). *master* branch.
2. ``plexpass``: PlexPass version. *plexpass* branch.

The regular version will automatically detect the latest version available on [plex.tv/downloads](http://plex.tv/downloads). **If you know how I can detect the newest PlexPass version automatically, drop me a comment.**

## Exposed Volumes

There are three volumes exposed in this Docker that allows some configuration of your Plex instance.

1. **/volumes/plex**: contains the Plex Library and Logs.
2. **/volumes/media**: where your media is held.
3. **/volumes/tmp**: temp folder used by Plex, mostly for transcoding.

There is an assumption that you will store your Plex Library and all your Media on the host running Docker instead of in the image.

## Running the image

*latest* tag:

``sudo docker run --restart always -d --name="plexmediaserver" -h plexmediaserver -v /etc/localtime:/etc/localtime:ro -v <plex_library_folder_on_host>:/volumes/plex -v <temp_folder_on_host>:/volumes/tmp -v <media_folder_on_host>:/volumes/media -p 32400:32400 jrarseneau/plexmediaserver``

*plexpass* tag:

``sudo docker run --restart always -d --name="plexmediaserver" -h plexmediaserver -v /etc/localtime:/etc/localtime:ro -v <plex_library_folder_on_host>:/volumes/plex -v <temp_folder_on_host>:/volumes/tmp -v <media_folder_on_host>:/volumes/media -p 32400:32400 jrarseneau/plexmediaserver:plexpass``
