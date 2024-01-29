% ALL PUNCUATION IS REMOVED FROM THE SENTENCE
str = 'APPARENTLY NEUTRAL PROTEST IS THROUGHLY DISCOUNTED AND IGNORED ISMAN HARD HIT BLOCKAGE ISSUE AFFECTS PRETEXT FOR EMBARGO ON BYPRODUCTS EJCECTING SUETS AND VEGITABLE OILS';
char_str = char(str);
x = uint16(char_str);

% Initialize an array to store the counts of each uppercase letter (26 letters) and space

% Number of uppercase letters
numLetters = 26; 

% Create array of 0's
counts = zeros(1, numLetters);

% Iterate through each character of the string
for i = 1:length(str)
    % Get the ASCII value of the current character
    charValue = double(str(i));
    
    % Check if the character is an uppercase letter (ASCII values 65 to 90)
    if charValue >= 65 && charValue <= 90
        % Increment the count for the current uppercase letter
        counts(charValue - 64) = counts(charValue - 64) + 1;
    end
end

% Display the counts for each uppercase letter and space into an array
letters_freq = [];
for i = 1:length(counts)
    if counts(i) > 0
            % Convert the index back to the corresponding uppercase letter
            character = char(i + 64);
        %letters_freq(end+1) = num2str(counts(i));
        %disp([character, ': ', num2str(counts(i))]);
    end
end

allletters = [];
for i = 1:length(counts)
    allletters(i) = char(i+64);
end

% Calculating probabiity of each letter occuring and storing them in array
for elm = 1:length(counts)
    letters_freq(end+1) = counts(elm) / length(str); 
end

%disp(length(str));
%disp(letters_freq);

% Defining initial sum variable
sum = 0;

% Equation for determing the average information
for num=1:length(counts)
    if letters_freq(num) > 0
        sum = sum + letters_freq(num)*-log2(letters_freq(num));
    end
end

% Printing the average information
disp(sum);

huffman




