function GenRandomJumpingMovie()
    if nargin < 1
        jumpingblackbox_filename = 'random_jumping/blackbox.avi';
        jumpingrandom_filename = 'random_jumping/random.avi';
    end
    % Generate 200 frames movie, about 8 seconds
    width = 100; height = 100;
    blackboxvideo_object = VideoWriter(jumpingblackbox_filename);
    randomboxvideo_object = VideoWriter(jumpingrandom_filename);
    open(blackboxvideo_object);
    open(randomboxvideo_object);
    nframes = 200;
    random_obj = GenRandomImage(10, 10);
    black_obj = zeros(10, 10, 3);
    for i = 1:nframes
        pos = randi(90, 1, 2);
        frame = GenRandomImage(height, width);
        
        frame(pos(2)+1:pos(2)+10, pos(1)+1:pos(1)+10, :) = black_obj;
        writeVideo(blackboxvideo_object, frame);
        frame(pos(2)+1:pos(2)+10, pos(1)+1:pos(1)+10, :) = random_obj;
        writeVideo(randomboxvideo_object, frame);
        
        frame_filename = sprintf('random_jumping/frame%d.png', i);
        imwrite(frame, frame_filename);
        
    end
    close(blackboxvideo_object);
    close(randomboxvideo_object);
end