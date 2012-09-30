function GenRandomMovingMovie(parm)
    if nargin < 1  
        % default parameters
        FPS = 2;
        velocity = [1 0];
    else
        FPS = parm.frame_rate;
        velocity = parm.velocity;
    end
    filename = sprintf('random_moving/random_FPS%d.avi', FPS);
    % Generate 200 frames movie, about 8 seconds
    width = 100; height = 100;
    profile = 'Uncompressed AVI';
    profile = 'Archival';
    video_object = VideoWriter(filename, profile);
    video_object.FrameRate = FPS;
    open(video_object);
    nframes = 200;
    movie_obj = GenRandomImage(10, 10);
    start_pos = randi(90, 1, 2); pos = start_pos; % (x, y)
    delta = velocity; 
    for i = 1:nframes
        frame = GenRandomImage(height, width);
        frame(pos(2)+1:pos(2)+10, pos(1)+1:pos(1)+10, :) = movie_obj;
        if (any([size(frame, 1) size(frame, 2)] > [100 100])) break; end
        frame = frame(1:100, 1:100, :);
        frame_filename = sprintf('random_moving/frame%d.png', i);
        imwrite(frame, frame_filename);
        writeVideo(video_object, frame);
        pos = pos + delta;
    end
    close(video_object);
end