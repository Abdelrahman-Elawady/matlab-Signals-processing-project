% project by : 
% Al-Braa Hamdy       ID: 4410708
% Khaled Samir        ID: 4410257
% Ibrahim Alshash     ID: 4410873
% Abdelrahman Elawady ID: 4413746 
% Khalid Alghamdi     ID: 4411284 
function main
    % Main script
    x = 0:0.01:10; % Time vector
    
    % Interactive menu
    disp('Choose a signal type number:');
    disp('1. Sine');
    disp('2. Cosine');
    disp('3. Square');
    while true
        signal_type = input('Your choice: ');
        if ismember(signal_type, [1, 2, 3])
            break;
        else
            disp('Invalid signal type. Please enter 1, 2, or 3.');
        end
    end
    
    disp('Choose a filter type number:');
    disp('1. Moving average');
    disp('2. Gaussian');
    disp('3. Savitzky-Golay');
    while true
        filter_type = input('Your choice: ');
        if ismember(filter_type, [1, 2, 3])
            break;
        else
            disp('Invalid filter type. Please enter 1, 2, or 3.');
        end
    end
        frequency = input('Enter signal frequency: ');

        
    % Generate, add noise to, and filter signal
    y1 = generate_signal(x, signal_type, frequency); % Original signal
    y2 = add_noise(y1); % Noisy signal
    y3 = filter_noise(y2, filter_type); % Filtered signal
    
    % Plot signals
    plot_Signals(x, y1, y2, y3);
    
    % Write signals to file
    filename = 'signals.txt';
    fileID = fopen(filename, 'w');
    fprintf(fileID, '%6s %12s %12s %12s\n', 'Time', 'Original', 'Noisy', 'Filtered');
    fprintf(fileID, '%6.2f %12.8f %12.8f %12.8f\n', [x; y1; y2; y3]);
    fclose(fileID);
    
    % Read signals from file
    fileID = fopen(filename, 'r');
    C = textscan(fileID, '%f %f %f %f', 'HeaderLines', 1);
    fclose(fileID);
    sprintf('Read %d lines from %s', length(C{1}), filename);
end

main