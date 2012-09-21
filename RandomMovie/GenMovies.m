function GenMovies()
    parm = struct();
    parm.frame_rate = 10; % frame rate will not effect the perception of attention
    parm.moving_object_count = 1;
    parm.velocity = [1 0];
    GenRandomMovingMovie(parm);
end