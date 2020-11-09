clear all;close all;clc
cropNum = 1;
v = VideoWriter('A3.avi');
open(v);
for folNum = 2
    pathData = sprintf("D:/Matlab/Original_image1/",folNum);
    cd(pathData)
    % Read data 
    if folNum == 1
        totalImg = 1;
        pathSave = 'D:/Matlab/Cropped_drone_image';
    elseif folNum == 2
        totalImg = 1;
        pathSave = 'D:/Matlab/Cropped_drone_image';
    end    
    
    for imgNum = 1:totalImg
        pathData = sprintf("D:/Matlab/Original_image1",folNum);
        cd(pathData)
        if folNum == 1
            imgName = sprintf('orig1_(%g).jpg',imgNum);
        elseif folNum == 2
            imgName = sprintf('orig1_(%g).jpg',imgNum);            
        end
        img = imread(imgName);
        imgSize = size(img);
        numdx = 7;
        numdy = 4;
        dx = imgSize(2)/numdx;
        dy = imgSize(1)/numdy;
%         Visualize image
%         animation = figure;
%         imshow(img);
%         title(sprintf('Image %g',imgNum));
%         axis off 
%         hold on 
        dx = 176
        dy = 165

        num = 1;
        for row = 1:dx:1057
            for col = 1:dy:497
                rectangle('Position',[row col dx+48-1 dy+58-1],'EdgeColor','b');
                crop_data = img(col:col+224-1,row:row+224-1,:);
                figure;
                imshow(crop_data)
                axis on
                title(sprintf("Croped image: %g from original image: %g",num,imgNum));
                num = num +1;
                drawnow
                
                save_gif = "D:/Matlab/Video";
                
                cd(save_gif)
                frame = getframe(gcf);
                writeVideo(v,frame);
                
%                 pause(0.5)
                
                
            end
        end     
    end
end
