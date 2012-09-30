function SinglePointPlot()
    close all;
    
    % point = [10 10];
    % px = point(1); py = point(2);
    
    % red channel
    video_filename = 'data.avi';
    reader_obj = VideoReader(video_filename);

    frame_count = 30;
    samples = zeros(frame_count, 1);
    initial_frame = read(reader_obj, 1);
    figure; imshow(initial_frame);
    
    % [pxs pys] = ginput();
    % pxs = int64(pxs); pys = int64(pys);
    % hold on; plot(pxs, pys, 'r*');
    
    f0 = zeros(size(initial_frame));
    % for k = 1:length(pxs)
    [rows cols channels] =  size(initial_frame);
    for px = 1:cols; for py = 1:rows
        % px = pxs(k); py = pys(k);
        for i = 1:frame_count
            im = read(reader_obj, i); 
            samples(i) = im(py, px, 1);
        end
        % figure; 
        % title(sprintf('point (%d, %d)', px, py));
        % subplot(1, 2, 1); plot(samples);
        % subplot(1, 2, 2); Y = FourierPlot(samples); % plot(fft(samples));
        Y = fft(samples); 
        f0(py, py) = Y(1);
        fprintf('%d %d\n', px, py);    
    end; end
    
    imagesc(f0);
end
    
function Y = FourierPlot(samples)
    y = samples;
    Fs = 1;
    L = length(y);
    NFFT = 2^nextpow2(L); % Next power of 2 from length of y
    Y = fft(y,NFFT)/L;
    f = Fs/2*linspace(0,1,NFFT/2+1);

    % Plot single-sided amplitude spectrum.
    stem(f,2*abs(Y(1:NFFT/2+1))) 
    title('Single-Sided Amplitude Spectrum of y(t)')
    xlabel('Frequency (Hz)')
    ylabel('|Y(f)|')
end
