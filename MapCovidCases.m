%Approx 9 hrs
function [Result] = MapCovidCases(CovidZipData)
    
    %Rhode Island ZipCode Map Image ===============================
    ImageIn = imread('Rhode Island-zip-code-map.png');
     
    %Covid Color Scale ============================================
    high   = [120, 000, 004]; %Red
    med    = [211, 000, 015]; %lighter shade of Red
    low    = [255, 100, 104]; %Even lighter shade of Red
    nutral = [255, 187, 188]; %lightest red
    %high   = [000, 255, 001]; %Red
    %med    = [000, 255, 001]; %lighter shade of Red
    %low    = [000, 255, 001]; %Even lighter shade of Red
    %nutral = [000, 255, 001]; %Green
     
    %==============================================================
    %Zipcode Status 
    %        3 = high 
    %        2 = med 
    %        1 = low 
    %        0 = nutral
    %==============================================================
    
    data1 = CovidZipData;
     
    [b,~] = size(data1);
    
    %==============================================================
    %Set color scale value in column 3 of data file
    %color is base on the number of Cases Column 2
    %==============================================================
    for yy = 1:b
        if     data1(yy,2) >= 22376
            data1(yy,3) = 3;
        elseif data1(yy,2) >= 14917 && data1(yy,2) < 22376
            data1(yy,3) = 2;
        elseif data1(yy,2) >= 7458 && data1(yy,2) < 14917
            data1(yy,3) =1;
        else
            data1(yy,3) = 0;
        end
    end
    
    %==============================================================
    %For each zipcode in the data change the zipcode color 
    % to the color scale color
    %==============================================================
    for yy = 1:b
        %Set the color RGB based on the color scale number
        if     data1(yy,3) == 3
           color = high;
        elseif data1(yy,3) == 2
           color = med;
        elseif data1(yy,3) == 1
           color = low;
        else
           color = nutral;
        end
        %Change Zipcode color to scale color
        ImageIn=ChangeColor(ImageIn, data1(yy,1), color);
    end
    
    Result = ImageIn;
end
