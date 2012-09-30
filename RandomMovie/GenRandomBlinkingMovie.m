function GenRandomBlinkingMovie(parm)
    if nargin < 1  
        % default parameters
        frame_rate = 5;
        velocity = [1 0];
    else
        frame_rate = parm.frame_rate;
        velocity = parm.velocity;
    end
    filename = 'random_blinking/random.avi';
    % Generate 200 frames movie, about 8 seconds
    width = 100; height = 100;
    video_object = VideoWriter(filename);
    video_object.FrameRate = frame_rate;
    open(video_object);
    nframes = 200;
    movie_obj = GenRandomImage(10, 10);
    pos = randi(90, 1, 2);
    % a constant frame for reference of the obj position
    constant_frame = GenRandomImage(height, width);
    constant_frame(pos(2)+1:pos(2)+10, pos(1)+1:pos(1)+10, :) = 0;
    imwrite(constant_frame, 'random_blinking/constant_frame.png');
    for i = 1:nframes
        frame = GenRandomImage(height, width);
        if (mod(i, 2))
        % if 1
            % frame(pos(2)+1:pos(2)+10, pos(1)+1:pos(1)+10, :) = movie_obj;
            frame(pos(2)+1:pos(2)+10, pos(1)+1:pos(1)+10, :) = 0;
        end
        if (size(frame) > [100 100]) break; end
        % frame = frame(1:100, 1:100, :);
        writeVideo(video_object, frame);
    end
    close(video_object);
end