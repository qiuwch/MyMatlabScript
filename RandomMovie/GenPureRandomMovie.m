function GenPureRandomMovie()
    filename = 'pure_random.avi';
    % Generate 200 frames movie, about 8 seconds
    width = 100; height = 100;
    FPS = 20;
    video_object = VideoWriter(filename);
    video_object.FrameRate = FPS;
    open(video_object);
    nframes = 200;

    for i = 1:nframes
        frame = GenRandomImage(height, width);
        writeVideo(video_object, frame);
    end
    close(video_object);
end